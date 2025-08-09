import Foundation

public extension Date {
    /// The first moment of the `Date`, as a `Date`, using the user's current calendar.
    ///
    /// This date does not track changes that the user makes to their preferred calendar.
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    /// The first moment of the `Date`, as a `Date`, using the user's current calendar.
    ///
    /// This date tracks changes that the user makes to their preferred calendar.
    var autoupdatingStartOfDay: Date {
        Calendar.autoupdatingCurrent.startOfDay(for: self)
    }
}
