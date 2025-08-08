import Foundation

public extension Double {
    /// The number of seconds in one minute.
    static let secondsPerMinute: Double = 60.0

    /// The number of minutes in one hour.
    static let minutesPerHour: Double = 60.0

    /// The number of hours in one day.
    static let hoursPerDay: Double = 24.0

    /// The number of days in one week.
    static let daysPerWeek: Double = 7.0
}

public extension TimeInterval {
    /// A `TimeInterval` of one second.
    static let oneSecond: TimeInterval = 1.0

    /// A `TimeInterval` of one minute.
    static let oneMinute: TimeInterval = secondsPerMinute * oneSecond

    /// A `TimeInterval` of one hour.
    static let oneHour: TimeInterval = minutesPerHour * oneMinute

    /// A `TimeInterval` of one day.
    static let oneDay: TimeInterval = hoursPerDay * oneHour

    /// A `TimeInterval` of one week.
    static let oneWeek: TimeInterval = daysPerWeek * oneDay

    /// Returns a `TimeInterval` equal to the specified number of seconds.
    ///
    /// - parameter seconds: The number of seconds.
    /// - returns: A `TimeInterval` equal to the provided number of seconds.
    static func seconds(_ seconds: Double) -> TimeInterval {
        seconds * oneSecond
    }

    /// Returns a `TimeInterval` equal to the specified number of minutes.
    ///
    /// - parameter minutes: The number of minutes.
    /// - returns: A `TimeInterval` equal to the provided number of minutes.
    static func minutes(_ minutes: Double) -> TimeInterval {
        minutes * oneMinute
    }

    /// Returns a `TimeInterval` equal to the specified number of hours.
    ///
    /// - parameter hours: The number of hours.
    /// - returns: A `TimeInterval` equal to the provided number of hours.
    static func hours(_ hours: Double) -> TimeInterval {
        hours * oneHour
    }

    /// Returns a `TimeInterval` equal to the specified number of days.
    ///
    /// - parameter days: The number of days.
    /// - returns: A `TimeInterval` equal to the provided number of days.
    static func days(_ days: Double) -> TimeInterval {
        days * oneDay
    }

    /// Returns a `TimeInterval` equal to the specified number of weeks.
    ///
    /// - parameter weeks: The number of weeks.
    /// - returns: A `TimeInterval` equal to the provided number of weeks.
    static func weeks(_ weeks: Double) -> TimeInterval {
        weeks * oneWeek
    }
}
