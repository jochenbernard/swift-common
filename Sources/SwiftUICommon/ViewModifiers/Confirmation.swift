import SwiftUI

public extension View {
    func confirmation(model: Binding<ConfirmationModel?>) -> some View {
        confirmationDialog(
            model.wrappedValue?.confirmationTitleKey ?? "",
            isPresented: Binding(
                get: { model.wrappedValue != nil },
                set: { if !$0 { model.wrappedValue = nil } }
            ),
            titleVisibility: .visible,
            actions: {
                ConfirmationActions(
                    confirmationButtonRole: model.wrappedValue?.confirmationButtonRole,
                    confirmationButtonAction: model.wrappedValue?.confirmationButtonAction ?? {},
                    confirmationButtonLabel: model.wrappedValue?.confirmationButtonLabel ?? { AnyView(EmptyView()) },
                    cancelButton: model.wrappedValue?.cancelButtonTitleKey ?? ""
                )
            }
        )
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
private struct ConfirmationPreview: View {
    @State private var confirmation: ConfirmationModel?

    var body: some View {
        Menu(
            "More",
            systemImage: "ellipsis"
        ) {
            ButtonWithConfirmation(
                "Delete Event",
                confirmation: "Are you sure you want to delete this event?",
                model: $confirmation,
                action: {}
            )
        }
        .confirmation(model: $confirmation)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    ConfirmationPreview()
}
