import Foundation

/// A date as precisely as the person remembers it.
///
/// Fidilia deliberately supports year-only and month-only memories rather than
/// fabricating missing calendar components.
public struct MemoryDate: Codable, Hashable, Sendable, Comparable {
    public enum Precision: String, Codable, Sendable {
        case day
        case month
        case year
    }

    public let year: Int
    public let month: Int?
    public let day: Int?

    public var precision: Precision {
        if day != nil { return .day }
        if month != nil { return .month }
        return .year
    }

    public init?(year: Int, month: Int? = nil, day: Int? = nil) {
        guard year > 0 else { return nil }
        guard day == nil || month != nil else { return nil }

        if let month {
            guard (1...12).contains(month) else { return nil }
        }

        if let day {
            var components = DateComponents()
            components.calendar = Calendar(identifier: .gregorian)
            components.timeZone = TimeZone(secondsFromGMT: 0)
            components.year = year
            components.month = month
            components.day = day

            guard let date = components.date else { return nil }
            let verified = Calendar(identifier: .gregorian).dateComponents(
                [.year, .month, .day],
                from: date
            )
            guard verified.year == year,
                  verified.month == month,
                  verified.day == day else {
                return nil
            }
        }

        self.year = year
        self.month = month
        self.day = day
    }

    /// Stable chronology key that retains display precision separately.
    public var sortKey: Int {
        (year * 10_000) + ((month ?? 0) * 100) + (day ?? 0)
    }

    public static func < (lhs: MemoryDate, rhs: MemoryDate) -> Bool {
        lhs.sortKey < rhs.sortKey
    }

    /// Returns true only when the supplied precision unambiguously lies in the future.
    /// Month/year-only values are compared at their own precision.
    public func isInFuture(relativeTo date: Date, calendar: Calendar = .current) -> Bool {
        let current = calendar.dateComponents([.year, .month, .day], from: date)
        guard let currentYear = current.year else { return false }

        if year != currentYear {
            return year > currentYear
        }

        guard let month else { return false }
        guard let currentMonth = current.month else { return false }
        if month != currentMonth {
            return month > currentMonth
        }

        guard let day else { return false }
        guard let currentDay = current.day else { return false }
        return day > currentDay
    }
}
