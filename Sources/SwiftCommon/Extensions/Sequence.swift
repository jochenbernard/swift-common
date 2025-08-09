public extension Sequence where Element: Identifiable {
    /// Returns the first element of the sequence that has the specified id.
    ///
    /// - Parameter id: The id.
    /// - Returns: The first element of the sequence that has the given id, or `nil` if there is no element that has the
    ///            given id.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    func first(for id: Element.ID) -> Element? {
        first(where: { $0.id == id })
    }

    /// Returns the first element of the sequence that has the same id as the specified element.
    ///
    /// - Parameter element: The element.
    /// - Returns: The first element of the sequence that has the same id as the given element, or `nil` if there is no
    ///            element that has the same id as the given element.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    func first(for element: Element) -> Element? {
        first(for: element.id)
    }
}
