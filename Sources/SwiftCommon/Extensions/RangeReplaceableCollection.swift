public extension RangeReplaceableCollection where Element: Identifiable {
    mutating func removeAll(id: Element.ID) {
        removeAll {
            $0.id == id
        }
    }

    mutating func removeAll(_ element: Element) {
        removeAll(id: element.id)
    }

    mutating func removeAll(ids: Set<Element.ID>) {
        removeAll {
            ids.contains($0.id)
        }
    }

    mutating func removeAll(_ elements: [Element]) {
        removeAll(ids: Set(elements.map(\.id)))
    }

    func removingAll(id: Element.ID) -> Self {
        filter {
            $0.id != id
        }
    }

    func removingAll(_ element: Element) -> Self {
        removingAll(id: element.id)
    }

    func removingAll(ids: Set<Element.ID>) -> Self {
        filter {
            !ids.contains($0.id)
        }
    }

    func removingAll(_ elements: [Element]) -> Self {
        removingAll(ids: Set(elements.map(\.id)))
    }
}
