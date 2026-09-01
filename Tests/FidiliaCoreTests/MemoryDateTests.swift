import Foundation
import Testing
@testable import FidiliaCore

@Test func preservesDatePrecision() {
    #expect(MemoryDate(year: 2009)?.precision == .year)
    #expect(MemoryDate(year: 2009, month: 9)?.precision == .month)
    #expect(MemoryDate(year: 2009, month: 9, day: 12)?.precision == .day)
}

@Test func rejectsInvalidCalendarShapes() {
    #expect(MemoryDate(year: 2026, day: 1) == nil)
    #expect(MemoryDate(year: 2026, month: 13) == nil)
    #expect(MemoryDate(year: 2026, month: 2, day: 30) == nil)
}

@Test func sortsWithoutInventingDisplayPrecision() {
    let year = MemoryDate(year: 2026)!
    let month = MemoryDate(year: 2026, month: 9)!
    let day = MemoryDate(year: 2026, month: 9, day: 1)!

    #expect(year < month)
    #expect(month < day)
    #expect(year.precision == .year)
    #expect(month.precision == .month)
}
