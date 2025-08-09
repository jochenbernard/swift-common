import SwiftUI

public extension LazyVGrid {
    /// Creates a grid that grows vertically.
    ///
    /// - Parameters:
    ///   - columnCount: The number of columns. `columnCount` must be zero or greater.
    ///   - alignment: The alignment of the grid within its parent view.
    ///   - spacing: The spacing between the items.
    ///   - pinnedViews: Views to pin to the bounds of a parent scroll view.
    ///   - content: The content of the grid.
    init(
        columnCount: Int,
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat? = nil,
        pinnedViews: PinnedScrollableViews = PinnedScrollableViews(),
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            columns: Array(
                repeating: GridItem(spacing: spacing),
                count: columnCount
            ),
            alignment: alignment,
            spacing: spacing,
            pinnedViews: pinnedViews,
            content: content
        )
    }
}
