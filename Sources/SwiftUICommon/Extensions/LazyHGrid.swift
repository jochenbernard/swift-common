import SwiftUI

public extension LazyHGrid {
    /// Creates a grid that grows horizontally.
    ///
    /// - Parameters:
    ///   - rowCount: The number of rows. `rowCount` must be zero or greater.
    ///   - alignment: The alignment of the grid within its parent view.
    ///   - spacing: The spacing between the items.
    ///   - pinnedViews: Views to pin to the bounds of a parent scroll view.
    ///   - content: The content of the grid.
    init(
        rowCount: Int,
        alignment: VerticalAlignment = .center,
        spacing: CGFloat? = nil,
        pinnedViews: PinnedScrollableViews = PinnedScrollableViews(),
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            rows: Array(
                repeating: GridItem(spacing: spacing),
                count: rowCount
            ),
            alignment: alignment,
            spacing: spacing,
            pinnedViews: pinnedViews,
            content: content
        )
    }
}
