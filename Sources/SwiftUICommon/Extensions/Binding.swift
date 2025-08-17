import SwiftUI

public extension Binding<Bool> {
    /// Creates a binding that reflects if a specified binding contains any value.
    ///
    /// - Parameter binding: The binding.
    /// - Returns: A binding that reflects if the provided binding contains any value.
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
