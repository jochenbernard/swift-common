import Testing

import SwiftCommon

// swiftlint:disable identical_operands

@Suite
struct BoolTests {
    @Test
    func testComparable() {
        #expect((false < false) == false)
        #expect((false < true) == true)
        #expect((true < false) == false)
        #expect((true < true) == false)
    }
}
