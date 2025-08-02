public extension RangeReplaceableCollection where Element: Identifiable {
    mutating func removeAll(_ id: Element.ID) {
        removeAll {
            $0.id == id
        }
    }

    mutating func removeAll(_ element: Element) {
        removeAll(element.id)
    }

    func removingAll(_ id: Element.ID) -> Self {
        filter {
            $0.id != id
        }
    }

    func removingAll(_ element: Element) -> Self {
        removingAll(element.id)
    }
}
