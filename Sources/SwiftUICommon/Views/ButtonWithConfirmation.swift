import SwiftUI

/// A button that presents a confirmation dialog.
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

    /// Creates a button that presents a confirmation dialog.
    ///
    /// - Parameters:
    ///   - role: An optional semantic role that describes the button and the confirmation button. A value of `nil`
    ///           means that the buttons don't have an assigned role. The default is `nil`.
    ///   - action: The action to perform when the user confirms the action.
    ///   - label: The label of the button.
    ///   - requiresConfirmation: Whether confirmation is required. If `requiresConfirmation` is `true` a confirmation
    ///                           dialog will be presented when the user interacts with the button. If
    ///                           `requiresConfirmation` is `false` `action` will be performed directly when the user
    ///                           interacts with the button. The default is `true`.
    ///   - confirmationTitle: The title of the confirmation dialog.
    ///   - confirmationButtonLabel: The label of the confirmation button. If `confirmationButtonLabel` is `nil` `label`
    ///                              will be used instead. The default is `nil`.
    ///   - cancelButtonLabel: The label of the cancel button. If `cancelButtonLabel` is `nil` "Cancel" will be used
    ///                        instead. The default is `nil`.
    ///   - model: An optional binding to a ``ConfirmationModel``. If `model` is `nil` this view will directly present
    ///            a confirmation dialog when the user interacts with the button. If `model` is a binding this view will
    ///            assign a ``ConfirmationModel`` to this binding when the user interacts with the button to be handled
    ///            elsewhere using the ``confirmation(model:)`` `ViewModifier` or the ``ConfirmationScene`` `Scene`. The
    ///            default is `nil`.
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
