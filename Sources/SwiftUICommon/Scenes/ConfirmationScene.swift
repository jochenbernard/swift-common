import SwiftUI

@available(macOS 15.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct ConfirmationScene: Scene {
    @Binding private var model: ConfirmationModel?

    public init(model: Binding<ConfirmationModel?>) {
        self._model = model
    }

    public var body: some Scene {
        AlertScene(
            model?.confirmationTitleKey ?? "",
            isPresented: Binding(
                get: { model != nil },
                set: { if !$0 { model = nil } }
            ),
            actions: {
                ConfirmationActions(
                    confirmationButtonRole: model?.confirmationButtonRole,
                    confirmationButtonAction: model?.confirmationButtonAction ?? {},
                    confirmationButtonLabel: model?.confirmationButtonLabel ?? { AnyView(EmptyView()) },
                    cancelButton: model?.cancelButtonTitleKey ?? ""
                )
            }
        )
    }
}
