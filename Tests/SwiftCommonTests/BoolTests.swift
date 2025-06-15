import Testing

import SwiftCommon

@Suite
struct BoolTests {
    @Test
    static func testComparable() {
        #expect((false < false) == false)
        #expect((false < true) == true)
        #expect((true < false) == false)
        #expect((true < true) == false)
    }
}
