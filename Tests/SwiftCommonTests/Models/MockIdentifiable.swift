// swiftlint:disable identifier_name

final class MockIdentifiable: Equatable, Identifiable, Sendable {
    let id: String

    init(id: String) {
        self.id = id
    }

    static func == (
        lhs: MockIdentifiable,
        rhs: MockIdentifiable
    ) -> Bool {
        lhs.id == rhs.id
    }

    static var a: MockIdentifiable {
        MockIdentifiable(id: "a")
    }

    static var b: MockIdentifiable {
        MockIdentifiable(id: "b")
    }

    static var c: MockIdentifiable {
        MockIdentifiable(id: "c")
    }

    static var d: MockIdentifiable {
        MockIdentifiable(id: "d")
    }
}
