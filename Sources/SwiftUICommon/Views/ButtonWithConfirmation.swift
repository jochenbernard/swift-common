import SwiftUI

public struct ButtonWithConfirmation<Label: View>: View {
    private let role: ButtonRole?
    private let action: () -> Void
    private let label: Label
    private let requiresConfirmation: Bool
    private let confirmationTitle: Text
    private let confirmationButtonLabel: AnyView?
    private let cancelButtonLabel: AnyView?
    private let model: Binding<ConfirmationModel?>?

    @State private var isConfirmationDialogPresented = false

    public init(
        role: ButtonRole? = nil,
        action: @escaping () -> Void,
        label: Label,
        requiresConfirmation: Bool = true,
        confirmationTitle: Text,
        confirmationButtonLabel: (any View)? = nil,
        cancelButtonLabel: (any View)? = nil,
        model: Binding<ConfirmationModel?>? = nil,
    ) {
        self.role = role
        self.action = action
        self.label = label
        self.requiresConfirmation = requiresConfirmation
        self.confirmationTitle = confirmationTitle
        self.confirmationButtonLabel = confirmationButtonLabel.map({ AnyView($0) })
        self.cancelButtonLabel = cancelButtonLabel.map({ AnyView($0) })
        self.model = model
    }

    public var body: some View {
        Button(
            role: role,
            action: buttonAction,
            label: { label }
        )
        .confirmationDialog(
            confirmationTitle,
            isPresented: $isConfirmationDialogPresented,
            titleVisibility: .visible,
            actions: {
                ConfirmationActions(
                    confirmationButtonRole: confirmationButtonRole,
                    confirmationButtonAction: confirmationButtonAction,
                    confirmationButtonLabel: unwrappedConfirmationButtonLabel,
                    cancelButtonLabel: cancelButtonLabel
                )
            }
        )
    }

    private var confirmationButtonRole: ButtonRole? {
        if role == .cancel {
            nil
        } else {
            role
        }
    }

    private var unwrappedConfirmationButtonLabel: AnyView {
        if let confirmationButtonLabel {
            confirmationButtonLabel
        } else {
            AnyView(label)
        }
    }

    private func buttonAction() {
        if requiresConfirmation {
            if let model {
                model.wrappedValue = ConfirmationModel(
                    confirmationTitle: confirmationTitle,
                    confirmationButtonRole: confirmationButtonRole,
                    confirmationButtonAction: action,
                    confirmationButtonLabel: unwrappedConfirmationButtonLabel,
                    cancelButtonLabel: cancelButtonLabel,
                )
            } else {
                isConfirmationDialogPresented = true
            }
        } else {
            action()
        }
    }

    private func confirmationButtonAction() {
        action()
    }
}

#Preview {
    ButtonWithConfirmation(
        role: .cancel,
        action: {},
        label: Text("Delete Event"),
        confirmationTitle: Text("Are you sure you want to delete this event?")
    )
}
