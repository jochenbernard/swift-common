public extension RangeReplaceableCollection where Element: Identifiable {
    mutating func removeAll(_ id: Element.ID) {
        removeAll {
            $0.id == id
        }
    }

    mutating func removeAll(_ element: Element) {
        removeAll(element.id)
    }

    mutating func removeAll(_ ids: Set<Element.ID>) {
        removeAll {
            ids.contains($0.id)
        }
    }

    mutating func removeAll(_ elements: [Element]) {
        removeAll(Set(elements.map(\.id)))
    }

    func removingAll(_ id: Element.ID) -> Self {
        filter {
            $0.id != id
        }
    }

    func removingAll(_ element: Element) -> Self {
        removingAll(element.id)
    }

    func removingAll(_ ids: Set<Element.ID>) -> Self {
        filter {
            !ids.contains($0.id)
        }
    }

    func removingAll(_ elements: [Element]) -> Self {
        removingAll(Set(elements.map(\.id)))
    }
}
