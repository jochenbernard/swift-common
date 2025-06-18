import Foundation

public extension Double {
    static let secondsPerMinute: Double = 60.0
    static let minutesPerHour: Double = 60.0
    static let hoursPerDay: Double = 24.0
    static let daysPerWeek: Double = 7.0
}

public extension TimeInterval {
    static let oneSecond: TimeInterval = 1.0
    static let oneMinute: TimeInterval = secondsPerMinute * oneSecond
    static let oneHour: TimeInterval = minutesPerHour * oneMinute
    static let oneDay: TimeInterval = hoursPerDay * oneHour
    static let oneWeek: TimeInterval = daysPerWeek * oneDay

    static func seconds(_ seconds: Double) -> TimeInterval {
        seconds * oneSecond
    }

    static func minutes(_ minutes: Double) -> TimeInterval {
        minutes * oneMinute
    }

    static func hours(_ hours: Double) -> TimeInterval {
        hours * oneHour
    }

    static func days(_ days: Double) -> TimeInterval {
        days * oneDay
    }

    static func weeks(_ weeks: Double) -> TimeInterval {
        weeks * oneWeek
    }
}
