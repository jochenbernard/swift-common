import SwiftUI

private struct FocusOnAppear: ViewModifier {
    private let focusOnAppear: Bool

    @FocusState private var isFocused

    init(_ focusOnAppear: Bool) {
        self.focusOnAppear = focusOnAppear
    }

    func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .onAppear {
                if focusOnAppear {
                    isFocused = true
                }
            }
    }
}

public extension View {
    /// Cause the view to receive focus whenever it appears.
    func focusOnAppear(_ focusOnAppear: Bool = true) -> some View {
        modifier(FocusOnAppear(focusOnAppear))
    }
}

#Preview("FocusOnAppear") {
    TextField(
        "Focus on appear",
        text: .constant("")
    )
    .focusOnAppear()
}

#Preview("FocusOnAppearTrue") {
    TextField(
        "Focus on appear true",
        text: .constant("")
    )
    .focusOnAppear(true)
}

#Preview("FocusOnAppearFalse") {
    TextField(
        "Focus on appear false",
        text: .constant("")
    )
    .focusOnAppear(false)
}
