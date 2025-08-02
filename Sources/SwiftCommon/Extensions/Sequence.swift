public extension Sequence where Element: Identifiable {
    func first(for id: Element.ID) -> Element? {
        first {
            $0.id == id
        }
    }

    func first(for element: Element) -> Element? {
        first(for: element.id)
    }
}
