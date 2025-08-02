public extension Collection where Element: Identifiable {
    func firstIndex(of id: Element.ID) -> Index? {
        firstIndex {
            $0.id == id
        }
    }

    func firstIndex(of element: Element) -> Index? {
        firstIndex(of: element.id)
    }
}
