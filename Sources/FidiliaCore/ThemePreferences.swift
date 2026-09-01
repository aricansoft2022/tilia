import Foundation

public struct ThemePreferences: Codable, Hashable, Sendable {
    public enum Mode: String, Codable, Sendable {
        case fixed
        case surprise
    }

    public var mode: Mode
    public var fixedColor: StoredColor
    public var surpriseColor: StoredColor
    public var surpriseSchedule: SurpriseSchedule
    public var nextSurpriseChangeAt: Date?

    public init(
        mode: Mode = .fixed,
        fixedColor: StoredColor,
        surpriseColor: StoredColor,
        surpriseSchedule: SurpriseSchedule,
        nextSurpriseChangeAt: Date? = nil
    ) {
        self.mode = mode
        self.fixedColor = fixedColor
        self.surpriseColor = surpriseColor
        self.surpriseSchedule = surpriseSchedule
        self.nextSurpriseChangeAt = nextSurpriseChangeAt
    }

    public var currentColor: StoredColor {
        mode == .fixed ? fixedColor : surpriseColor
    }

    /// Applies a due surprise change without any aesthetic filtering.
    public mutating func applySurpriseIfDue(
        now: Date,
        using generator: inout some RandomNumberGenerator
    ) {
        guard mode == .surprise else { return }

        if let nextSurpriseChangeAt, now < nextSurpriseChangeAt {
            return
        }

        surpriseColor = StoredColor.random(using: &generator)
        nextSurpriseChangeAt = surpriseSchedule.nextChangeDate(
            after: now,
            using: &generator
        )
    }
}
