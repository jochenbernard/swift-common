import Testing

import SwiftCommon

@Suite
struct CollectionTests {
    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], "a", 0),
        ([MockIdentifiable.a, .d, .c, .b], "b", 3),
        ([MockIdentifiable.a, .c, .b, .d], "c", 1),
        ([MockIdentifiable.a, .b, .d, .c], "d", 2)
    ])
    func testFirstIndex(
        collection: [MockIdentifiable],
        id: MockIdentifiable.ID,
        index: Int
    ) {
        #expect(collection.firstIndex(for: id) == index)
    }

    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], MockIdentifiable.a, 0),
        ([MockIdentifiable.a, .d, .c, .b], MockIdentifiable.b, 3),
        ([MockIdentifiable.a, .c, .b, .d], MockIdentifiable.c, 1),
        ([MockIdentifiable.a, .b, .d, .c], MockIdentifiable.d, 2)
    ])
    func testFirstIndex(
        collection: [MockIdentifiable],
        element: MockIdentifiable,
        index: Int
    ) {
        #expect(collection.firstIndex(for: element) == index)
    }
}
