import Foundation
import Testing
@testable import FidiliaCore

private struct FixedGenerator: RandomNumberGenerator {
    var value: UInt64

    mutating func next() -> UInt64 {
        value
    }
}

@Test func fixedThemeKeepsUserColor() {
    let fixed = StoredColor(red: 0.1, green: 0.2, blue: 0.3)!
    let surprise = StoredColor(red: 0.9, green: 0.8, blue: 0.7)!
    let schedule = SurpriseSchedule(minimumInterval: 60, maximumInterval: 120)!

    var preferences = ThemePreferences(
        mode: .fixed,
        fixedColor: fixed,
        surpriseColor: surprise,
        surpriseSchedule: schedule
    )
    var generator = FixedGenerator(value: 42)

    preferences.applySurpriseIfDue(now: .now, using: &generator)

    #expect(preferences.currentColor == fixed)
}

@Test func darkCanvasRequestsLightForegroundWithoutChangingCanvas() {
    let canvas = StoredColor(red: 0, green: 0, blue: 0)!
    #expect(canvas.prefersLightForeground)
    #expect(canvas == StoredColor(red: 0, green: 0, blue: 0)!)
}
