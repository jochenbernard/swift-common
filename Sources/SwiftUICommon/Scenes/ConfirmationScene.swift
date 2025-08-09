import SwiftUI

/// A scene that renders itself as a standalone confirmation dialog.
@available(macOS 15.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct ConfirmationScene: Scene {
    @Binding private var model: ConfirmationModel?

    /// Presents a confirmation dialog when a specified binding contains a ``ConfirmationModel``.
    ///
    /// A ``ConfirmationModel`` can be assigned using ``ButtonWithConfirmation``.
    ///
    /// - Parameter model: The binding to an optional ``ConfirmationModel``.
    public init(model: Binding<ConfirmationModel?>) {
        self._model = model
    }

    public var body: some Scene {
        AlertScene(
            model?.confirmationTitle ?? Text(""),
            isPresented: Binding(
                get: { model != nil },
                set: { if !$0 { model = nil } }
            ),
            actions: {
                ConfirmationActions(
                    confirmationButtonRole: model?.confirmationButtonRole,
                    confirmationButtonAction: model?.confirmationButtonAction ?? {},
                    confirmationButtonLabel: model?.confirmationButtonLabel ?? AnyView(EmptyView()),
                    cancelButtonLabel: model?.cancelButtonLabel
                )
            }
        )
    }
}
