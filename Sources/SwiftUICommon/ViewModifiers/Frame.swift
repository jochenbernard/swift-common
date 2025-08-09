import SwiftUI

public extension View {
    /// Positions this view within an invisible frame with the specified size.
    ///
    /// Use this method to specify a fixed size for a view's width and height.
    ///
    /// The `alignment` parameter specifies this view's alignment within the frame.
    ///
    /// - Parameters:
    ///   - size: A fixed size for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. Note that most alignment values have no
    ///                apparent effect when the size of the frame happens to match that of this view.
    ///
    /// - Returns: A view with fixed dimensions of `size`.
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

    /// Positions this view within an invisible frame with the specified size.
    ///
    /// Use this method to specify a fixed size for a view's width and height.
    ///
    /// The `alignment` parameter specifies this view's alignment within the frame.
    ///
    /// - Parameters:
    ///   - size: A fixed size for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. Note that most alignment values have no
    ///                apparent effect when the size of the frame happens to match that of this view.
    ///
    /// - Returns: A view with fixed dimensions of `size`.
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

    /// Positions this view within an invisible frame having the specified size constraints.
    ///
    /// Pass `nil` or leave out a characteristic to indicate that the frame should adopt this view's sizing behavior,
    /// constrained by the other non-`nil` arguments.
    ///
    /// The size proposed to this view is the size proposed to the frame, limited by any constraints specified, and with
    /// any ideal dimensions specified replacing any corresponding unspecified dimensions in the proposal.
    ///
    /// If both minimum and maximum constraints are specified, the frame unconditionally adopts the size proposed for
    /// it, clamped to the constraints. Otherwise, the size of the frame is, if the size proposed for the frame by the
    /// parent is greater than the size of this view, the proposed size, clamped to the maximum.
    ///
    /// - Parameters:
    ///   - minSize: The minimum size of the resulting frame.
    ///   - idealSize: The ideal size of the resulting frame.
    ///   - maxSize: The maximum size of the resulting frame.
    ///   - alignment: The alignment of this view inside the resulting frame. Note that most alignment values have no
    ///                apparent effect when the size of the frame happens to match that of this view.
    ///
    /// - Returns: A view with flexible dimensions given by the call's non-`nil` parameters.
    func frame(
        minSize: CGFloat? = nil,
        idealSize: CGFloat? = nil,
        maxSize: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            minWidth: minSize,
            idealWidth: idealSize,
            maxWidth: maxSize,
            minHeight: minSize,
            idealHeight: idealSize,
            maxHeight: maxSize,
            alignment: alignment
        )
    }

    /// Positions this view within an invisible frame having the specified size constraints.
    ///
    /// Pass `nil` or leave out a characteristic to indicate that the frame should adopt this view's sizing behavior,
    /// constrained by the other non-`nil` arguments.
    ///
    /// The size proposed to this view is the size proposed to the frame, limited by any constraints specified, and with
    /// any ideal dimensions specified replacing any corresponding unspecified dimensions in the proposal.
    ///
    /// If both minimum and maximum constraints are specified, the frame unconditionally adopts the size proposed for
    /// it, clamped to the constraints. Otherwise, the size of the frame is, if the size proposed for the frame by the
    /// parent is greater than the size of this view, the proposed size, clamped to the maximum.
    ///
    /// - Parameters:
    ///   - minSize: The minimum size of the resulting frame.
    ///   - idealSize: The ideal size of the resulting frame.
    ///   - maxSize: The maximum size of the resulting frame.
    ///   - alignment: The alignment of this view inside the resulting frame. Note that most alignment values have no
    ///                apparent effect when the size of the frame happens to match that of this view.
    ///
    /// - Returns: A view with flexible dimensions given by the call's non-`nil` parameters.
    func frame(
        minSize: CGSize? = nil,
        idealSize: CGSize? = nil,
        maxSize: CGSize,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            minWidth: minSize?.width,
            idealWidth: idealSize?.width,
            maxWidth: maxSize.width,
            minHeight: minSize?.height,
            idealHeight: idealSize?.height,
            maxHeight: maxSize.height,
            alignment: alignment
        )
    }
}

#Preview {
    Text("Frame")
        .frame(size: 64.0)
        .border(.red)

    Text("Frame")
        .frame(
            maxSize: .infinity,
            alignment: .topLeading
        )
        .border(.green)

    Text("Frame")
        .frame(
            size: CGSize(
                width: 64.0,
                height: 32.0
            )
        )
        .border(.blue)

    Text("Frame")
        .frame(
            maxSize: CGSize(
                width: .infinity,
                height: 32.0
            ),
            alignment: .bottomTrailing
        )
        .border(.yellow)
}
