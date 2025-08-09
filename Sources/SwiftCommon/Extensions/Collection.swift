public extension Collection where Element: Identifiable {
    /// Returns the first index in which an element of the collection has the specified id.
    ///
    /// - Parameter id: The id.
    /// - Returns: The index of the first element which has the given id. If no elements in the collection have the
    ///            given id, returns `nil`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    func firstIndex(for id: Element.ID) -> Index? {
        firstIndex(where: { $0.id == id })
    }

    /// Returns the first index in which an element of the collection has the same id as the specified element.
    ///
    /// - Parameter element: The element.
    /// - Returns: The index of the first element which has the same id as the given element. If no elements in the
    ///            collection have the same id as the given element, returns `nil`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    func firstIndex(for element: Element) -> Index? {
        firstIndex(for: element.id)
    }
}
