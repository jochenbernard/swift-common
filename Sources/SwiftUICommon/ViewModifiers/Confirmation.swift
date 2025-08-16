import SwiftUI

public extension View {
    /// Presents a confirmation dialog when a specified binding contains a ``ConfirmationModel``.
    ///
    /// A ``ConfirmationModel`` can be assigned using ``ButtonWithConfirmation``.
    ///
    /// - Parameter model: The binding to an optional ``ConfirmationModel``.
    func confirmation(model: Binding<ConfirmationModel?>) -> some View {
        confirmationDialog(
            model.wrappedValue?.confirmationTitle ?? Text(""),
            isPresented: Binding(
                get: { model.wrappedValue != nil },
                set: { if !$0 { model.wrappedValue = nil } }
            ),
            titleVisibility: .visible,
            actions: {
                ConfirmationActions(
                    confirmationButtonRole: model.wrappedValue?.confirmationButtonRole,
                    confirmationButtonAction: model.wrappedValue?.confirmationButtonAction ?? {},
                    confirmationButtonLabel: model.wrappedValue?.confirmationButtonLabel ?? AnyView(EmptyView()),
                    cancelButtonLabel: model.wrappedValue?.cancelButtonLabel
                )
            },
            message: { model.wrappedValue?.confirmationMessage }
        )
    }
}

@available(
    iOS 14.0,
    macOS 11.0,
    tvOS 17.0,
    *
)
@available(watchOS, unavailable)
private struct ConfirmationPreview: View {
    @State private var confirmation: ConfirmationModel?

    var body: some View {
        Menu(
            "More",
            systemImage: "ellipsis"
        ) {
            ButtonWithConfirmation(
                action: {},
                label: Text("Delete Event"),
                confirmationTitle: Text("Are you sure you want to delete this event?"),
                model: $confirmation
            )
        }
        .confirmation(model: $confirmation)
    }
}

@available(
    iOS 14.0,
    macOS 11.0,
    tvOS 17.0,
    *
)
@available(watchOS, unavailable)
#Preview {
    ConfirmationPreview()
}
