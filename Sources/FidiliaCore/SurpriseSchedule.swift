import Foundation

public struct SurpriseSchedule: Codable, Hashable, Sendable {
    public let minimumInterval: TimeInterval
    public let maximumInterval: TimeInterval

    public init?(minimumInterval: TimeInterval, maximumInterval: TimeInterval) {
        guard minimumInterval > 0,
              maximumInterval >= minimumInterval else {
            return nil
        }

        self.minimumInterval = minimumInterval
        self.maximumInterval = maximumInterval
    }

    public func nextChangeDate(
        after date: Date,
        using generator: inout some RandomNumberGenerator
    ) -> Date {
        let interval = Double.random(
            in: minimumInterval...maximumInterval,
            using: &generator
        )
        return date.addingTimeInterval(interval)
    }
}
