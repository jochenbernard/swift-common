import Testing

import SwiftCommon

@Suite
struct SequenceTests {
    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], "a", 0),
        ([MockIdentifiable.a, .d, .c, .b], "b", 3),
        ([MockIdentifiable.a, .c, .b, .d], "c", 1),
        ([MockIdentifiable.a, .b, .d, .c], "d", 2)
    ])
    func testFirst(
        sequence: [MockIdentifiable],
        id: MockIdentifiable.ID,
        expectedElementIndex: Int
    ) {
        #expect(sequence.first(for: id) === sequence[expectedElementIndex])
    }

    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], MockIdentifiable.a, 0),
        ([MockIdentifiable.a, .d, .c, .b], MockIdentifiable.b, 3),
        ([MockIdentifiable.a, .c, .b, .d], MockIdentifiable.c, 1),
        ([MockIdentifiable.a, .b, .d, .c], MockIdentifiable.d, 2)
    ])
    func testFirst(
        sequence: [MockIdentifiable],
        element: MockIdentifiable,
        expectedElementIndex: Int
    ) {
        #expect(sequence.first(for: element) === sequence[expectedElementIndex])
    }
}
