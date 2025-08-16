import Testing

import SwiftUI
import SwiftUICommon

@Suite
struct BindingTests {
    @Test(arguments: [
        (nil, false),
        ("value", true)
    ])
    func testHasValueGetter(
        value: String?,
        expectedHasValue: Bool
    ) {
        let binding = Binding.constant(value)
        let hasValue = Binding.hasValue(binding)
        #expect(hasValue.wrappedValue == expectedHasValue)
    }

    @MainActor
    @Test(arguments: [
        (nil, false, nil),
        (nil, true, nil),
        ("value", false, nil),
        ("value", true, "value")
    ])
    func testHasValueSetter(
        value: String?,
        newHasValue: Bool,
        expectedValue: String?
    ) {
        let value = ValueWrapper(wrappedValue: value)
        let binding = Binding(
            get: { value.wrappedValue },
            set: { value.wrappedValue = $0 }
        )
        let hasValue = Binding.hasValue(binding)
        hasValue.wrappedValue = newHasValue
        #expect(binding.wrappedValue == expectedValue)
    }
}

@MainActor
class ValueWrapper<Value> {
    var wrappedValue: Value

    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}
