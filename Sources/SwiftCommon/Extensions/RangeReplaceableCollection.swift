public extension RangeReplaceableCollection where Element: Identifiable {
    /// Removes all the elements that have the specified id.
    ///
    /// - Parameter id: The id.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    mutating func removeAll(id: Element.ID) {
        removeAll(where: { $0.id == id })
    }

    /// Removes all the elements that have the same id as the specified element.
    ///
    /// - Parameter element: The element.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    mutating func removeAll(_ element: Element) {
        removeAll(id: element.id)
    }

    /// Removes all the elements that have an id contained in the specified set.
    ///
    /// - Parameter ids: The set of ids.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    mutating func removeAll(ids: Set<Element.ID>) {
        removeAll(where: { ids.contains($0.id) })
    }

    /// Removes all the elements that have the same id as an element contained in the specified array.
    ///
    /// - Parameter elements: The array of elements.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    mutating func removeAll(_ elements: [Element]) {
        removeAll(ids: Set(elements.map(\.id)))
    }

    /// Returns a new collection of the same type containing, in order, the elements of the original collection that do
    /// not have the specified id.
    ///
    /// - Parameter id: The id.
    /// - Returns: A collection of the elements that do not have the given id.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    func removingAll(id: Element.ID) -> Self {
        filter({ $0.id != id })
    }

    /// Returns a new collection of the same type containing, in order, the elements of the original collection that do
    /// not have the same id as the specified element.
    ///
    /// - Parameter element: The element.
    /// - Returns: A collection of the elements that do not have the same id as the given element.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    func removingAll(_ element: Element) -> Self {
        removingAll(id: element.id)
    }

    /// Returns a new collection of the same type containing, in order, the elements of the original collection that do
    /// not have have an id contained in the specified set.
    ///
    /// - Parameter ids: The set of ids.
    /// - Returns: A collection of the elements that do not have an id contained in the given set.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    func removingAll(ids: Set<Element.ID>) -> Self {
        filter({ !ids.contains($0.id) })
    }

    /// Returns a new collection of the same type containing, in order, the elements of the original collection that do
    /// not have have the same id as an element contained in the specified array.
    ///
    /// - Parameter elements: The array of elements.
    /// - Returns: A collection of the elements that do not have the same id as an element contained in the given array.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    func removingAll(_ elements: [Element]) -> Self {
        removingAll(ids: Set(elements.map(\.id)))
    }
}
