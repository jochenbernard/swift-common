import SwiftUI

public extension LazyVGrid {
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
