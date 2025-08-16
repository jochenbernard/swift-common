import SwiftUI

public extension Binding<Bool> {
    /// Creates a binding that reflects if a wrapped binding contains any value.
    ///
    /// - Parameter binding: The binding to wrap.
    static func hasValue<V>(_ binding: Binding<V?>) -> Binding where V: Sendable {
        Binding(
            get: { binding.wrappedValue != nil },
            set: { hasValue in
                if !hasValue {
                    binding.wrappedValue = nil
                }
            }
        )
    }
}
