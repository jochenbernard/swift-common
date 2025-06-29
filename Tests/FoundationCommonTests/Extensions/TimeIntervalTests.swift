import Testing

import Foundation
import FoundationCommon

@Suite
struct DoubleTests {
    @Test
    func testSecondsPerMinute() {
        #expect(Double.secondsPerMinute == 60.0)
    }

    @Test
    func testMinutesPerHour() {
        #expect(Double.minutesPerHour == 60.0)
    }

    @Test
    func testHoursPerDay() {
        #expect(Double.hoursPerDay == 24.0)
    }

    @Test
    func testDaysPerWeek() {
        #expect(Double.daysPerWeek == 7.0)
    }
}

@Suite
struct TimeIntervalTests {
    @Test
    func testOneSecond() {
        #expect(TimeInterval.oneSecond == 1.0)
    }

    @Test
    func testOneMinute() {
        #expect(TimeInterval.oneMinute == 60.0)
    }

    @Test
    func testOneHour() {
        #expect(TimeInterval.oneHour == 3_600.0)
    }

    @Test
    func testOneDay() {
        #expect(TimeInterval.oneDay == 86_400.0)
    }

    @Test
    func testOneWeek() {
        #expect(TimeInterval.oneWeek == 604_800.0)
    }

    @Test(arguments: [
        (1.0, 1.0),
        (2.0, 2.0),
        (4.0, 4.0)
    ])
    func testSeconds(
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
    func testMinutes(
        minutes: Double,
        expectedTimeInterval: TimeInterval
    ) {
        #expect(TimeInterval.minutes(minutes) == expectedTimeInterval)
    }

    @Test(arguments: [
        (1.0, 3_600.0),
        (2.0, 7_200.0),
        (4.0, 14_400.0)
    ])
    func testHours(
        hours: Double,
        expectedTimeInterval: TimeInterval
    ) {
        #expect(TimeInterval.hours(hours) == expectedTimeInterval)
    }

    @Test(arguments: [
        (1.0, 86_400.0),
        (2.0, 172_800.0),
        (4.0, 345_600.0)
    ])
    func testDays(
        days: Double,
        expectedTimeInterval: TimeInterval
    ) {
        #expect(TimeInterval.days(days) == expectedTimeInterval)
    }

    @Test(arguments: [
        (1.0, 604_800.0),
        (2.0, 1_209_600.0),
        (4.0, 2_419_200.0)
    ])
    func testWeeks(
        weeks: Double,
        expectedTimeInterval: TimeInterval
    ) {
        #expect(TimeInterval.weeks(weeks) == expectedTimeInterval)
    }
}
