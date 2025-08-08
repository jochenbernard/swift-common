import SwiftUI

public extension LazyHGrid {
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
