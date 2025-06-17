import SwiftUI

public extension View {
    func frame(
        size: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            width: size,
            height: size,
            alignment: alignment
        )
    }

    func frame(
        maxSize: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            maxWidth: maxSize,
            maxHeight: maxSize,
            alignment: alignment
        )
    }

    func frame(
        size: CGSize,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            width: size.width,
            height: size.height,
            alignment: alignment
        )
    }

    func frame(
        maxSize: CGSize,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            maxWidth: maxSize.width,
            maxHeight: maxSize.height,
            alignment: alignment
        )
    }
}
