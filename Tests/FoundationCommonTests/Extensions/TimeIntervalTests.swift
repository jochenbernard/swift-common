import Testing

import Foundation
import FoundationCommon

@Suite
struct DoubleTests {
    @Test
    static func testSecondsPerMinute() {
        #expect(Double.secondsPerMinute == 60.0)
    }

    @Test
    static func testMinutesPerHour() {
        #expect(Double.minutesPerHour == 60.0)
    }

    @Test
    static func testHoursPerDay() {
        #expect(Double.hoursPerDay == 24.0)
    }

    @Test
    static func testDaysPerWeek() {
        #expect(Double.daysPerWeek == 7.0)
    }
}

@Suite
struct TimeIntervalTests {
    @Test
    static func testOneSecond() {
        #expect(TimeInterval.oneSecond == 1.0)
    }

    @Test
    static func testOneMinute() {
        #expect(TimeInterval.oneMinute == 60.0)
    }

    @Test
    static func testOneHour() {
        #expect(TimeInterval.oneHour == 3600.0)
    }

    @Test
    static func testOneDay() {
        #expect(TimeInterval.oneDay == 86400.0)
    }

    @Test
    static func testOneWeek() {
        #expect(TimeInterval.oneWeek == 604800.0)
    }

    @Test(arguments: [
        (1.0, 1.0),
        (2.0, 2.0),
        (4.0, 4.0)
    ])
    static func testSeconds(
        seconds: Double,
        expectedTimeInterval: TimeInterval
    ) {
        #expect(TimeInterval.seconds(seconds) == expectedTimeInterval)
    }

    @Test(arguments: [
        (1.0, 60.0),
        (2.0, 120.0),
        (4.0, 240.0)
    ])
    static func testMinutes(
        minutes: Double,
        expectedTimeInterval: TimeInterval
    ) {
        #expect(TimeInterval.minutes(minutes) == expectedTimeInterval)
    }

    @Test(arguments: [
        (1.0, 3600.0),
        (2.0, 7200.0),
        (4.0, 14400.0)
    ])
    static func testHours(
        hours: Double,
        expectedTimeInterval: TimeInterval
    ) {
        #expect(TimeInterval.hours(hours) == expectedTimeInterval)
    }

    @Test(arguments: [
        (1.0, 86400.0),
        (2.0, 172800.0),
        (4.0, 345600.0)
    ])
    static func testDays(
        days: Double,
        expectedTimeInterval: TimeInterval
    ) {
        #expect(TimeInterval.days(days) == expectedTimeInterval)
    }

    @Test(arguments: [
        (1.0, 604800.0),
        (2.0, 1209600.0),
        (4.0, 2419200.0)
    ])
    static func testWeeks(
        weeks: Double,
        expectedTimeInterval: TimeInterval
    ) {
        #expect(TimeInterval.weeks(weeks) == expectedTimeInterval)
    }
}
