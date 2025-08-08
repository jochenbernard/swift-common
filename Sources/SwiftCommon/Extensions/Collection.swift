public extension Collection where Element: Identifiable {
    func firstIndex(for id: Element.ID) -> Index? {
        firstIndex(where: { $0.id == id })
    }

    func firstIndex(for element: Element) -> Index? {
        firstIndex(for: element.id)
    }
}
