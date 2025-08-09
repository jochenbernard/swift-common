import Testing

import SwiftCommon

@Suite
struct RangeReplaceableCollectionTests {
    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], "a", [MockIdentifiable.b, .c, .d]),
        ([MockIdentifiable.a, .d, .c, .b], "b", [MockIdentifiable.a, .d, .c]),
        ([MockIdentifiable.a, .c, .b, .d], "c", [MockIdentifiable.a, .b, .d]),
        ([MockIdentifiable.a, .b, .d, .c], "d", [MockIdentifiable.a, .b, .c])
    ])
    func testRemoveAll(
        collection: [MockIdentifiable],
        id: MockIdentifiable.ID,
        expectedCollection: [MockIdentifiable]
    ) {
        var collection = collection
        collection.removeAll(id: id)
        #expect(collection == expectedCollection)
    }

    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], MockIdentifiable.a, [MockIdentifiable.b, .c, .d]),
        ([MockIdentifiable.a, .d, .c, .b], MockIdentifiable.b, [MockIdentifiable.a, .d, .c]),
        ([MockIdentifiable.a, .c, .b, .d], MockIdentifiable.c, [MockIdentifiable.a, .b, .d]),
        ([MockIdentifiable.a, .b, .d, .c], MockIdentifiable.d, [MockIdentifiable.a, .b, .c])
    ])
    func testRemoveAll(
        collection: [MockIdentifiable],
        element: MockIdentifiable,
        expectedCollection: [MockIdentifiable]
    ) {
        var collection = collection
        collection.removeAll(element)
        #expect(collection == expectedCollection)
    }

    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], Set(["a", "b"]), [MockIdentifiable.c, .d]),
        ([MockIdentifiable.a, .d, .c, .b], Set(["b", "c"]), [MockIdentifiable.a, .d]),
        ([MockIdentifiable.a, .c, .b, .d], Set(["c", "d"]), [MockIdentifiable.a, .b]),
        ([MockIdentifiable.a, .b, .d, .c], Set(["d", "a"]), [MockIdentifiable.b, .c])
    ])
    func testRemoveAll(
        collection: [MockIdentifiable],
        ids: Set<MockIdentifiable.ID>,
        expectedCollection: [MockIdentifiable]
    ) {
        var collection = collection
        collection.removeAll(ids: ids)
        #expect(collection == expectedCollection)
    }

    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], [MockIdentifiable.a, .b], [MockIdentifiable.c, .d]),
        ([MockIdentifiable.a, .d, .c, .b], [MockIdentifiable.b, .c], [MockIdentifiable.a, .d]),
        ([MockIdentifiable.a, .c, .b, .d], [MockIdentifiable.c, .d], [MockIdentifiable.a, .b]),
        ([MockIdentifiable.a, .b, .d, .c], [MockIdentifiable.d, .a], [MockIdentifiable.b, .c])
    ])
    func testRemoveAll(
        collection: [MockIdentifiable],
        elements: [MockIdentifiable],
        expectedCollection: [MockIdentifiable]
    ) {
        var collection = collection
        collection.removeAll(elements)
        #expect(collection == expectedCollection)
    }

    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], "a", [MockIdentifiable.b, .c, .d]),
        ([MockIdentifiable.a, .d, .c, .b], "b", [MockIdentifiable.a, .d, .c]),
        ([MockIdentifiable.a, .c, .b, .d], "c", [MockIdentifiable.a, .b, .d]),
        ([MockIdentifiable.a, .b, .d, .c], "d", [MockIdentifiable.a, .b, .c])
    ])
    func testRemovingAll(
        collection: [MockIdentifiable],
        id: MockIdentifiable.ID,
        expectedCollection: [MockIdentifiable]
    ) {
        #expect(collection.removingAll(id: id) == expectedCollection)
    }

    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], MockIdentifiable.a, [MockIdentifiable.b, .c, .d]),
        ([MockIdentifiable.a, .d, .c, .b], MockIdentifiable.b, [MockIdentifiable.a, .d, .c]),
        ([MockIdentifiable.a, .c, .b, .d], MockIdentifiable.c, [MockIdentifiable.a, .b, .d]),
        ([MockIdentifiable.a, .b, .d, .c], MockIdentifiable.d, [MockIdentifiable.a, .b, .c])
    ])
    func testRemovingAll(
        collection: [MockIdentifiable],
        element: MockIdentifiable,
        expectedCollection: [MockIdentifiable]
    ) {
        #expect(collection.removingAll(element) == expectedCollection)
    }

    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], Set(["a", "b"]), [MockIdentifiable.c, .d]),
        ([MockIdentifiable.a, .d, .c, .b], Set(["b", "c"]), [MockIdentifiable.a, .d]),
        ([MockIdentifiable.a, .c, .b, .d], Set(["c", "d"]), [MockIdentifiable.a, .b]),
        ([MockIdentifiable.a, .b, .d, .c], Set(["d", "a"]), [MockIdentifiable.b, .c])
    ])
    func testRemovingAll(
        collection: [MockIdentifiable],
        ids: Set<MockIdentifiable.ID>,
        expectedCollection: [MockIdentifiable]
    ) {
        #expect(collection.removingAll(ids: ids) == expectedCollection)
    }

    @Test(arguments: [
        ([MockIdentifiable.a, .b, .c, .d], [MockIdentifiable.a, .b], [MockIdentifiable.c, .d]),
        ([MockIdentifiable.a, .d, .c, .b], [MockIdentifiable.b, .c], [MockIdentifiable.a, .d]),
        ([MockIdentifiable.a, .c, .b, .d], [MockIdentifiable.c, .d], [MockIdentifiable.a, .b]),
        ([MockIdentifiable.a, .b, .d, .c], [MockIdentifiable.d, .a], [MockIdentifiable.b, .c])
    ])
    func testRemovingAll(
        collection: [MockIdentifiable],
        elements: [MockIdentifiable],
        expectedCollection: [MockIdentifiable]
    ) {
        #expect(collection.removingAll(elements) == expectedCollection)
    }
}
