import SwiftUI

public struct ButtonWithConfirmation<Label: View>: View {
    private let confirmationTitleKey: LocalizedStringKey
    private let confirmationButtonTitleKey: LocalizedStringKey?
    private let cancelButtonTitleKey: LocalizedStringKey
    private let requiresConfirmation: Bool
    private let role: ButtonRole?
    private let model: Binding<ConfirmationModel?>?
    private let action: () -> Void
    private let label: () -> Label

    @State private var isConfirmationDialogPresented = false

    public init(
        confirmation confirmationTitleKey: LocalizedStringKey,
        confirmationButton confirmationButtonTitleKey: LocalizedStringKey? = nil,
        cancelButton cancelButtonTitleKey: LocalizedStringKey = "Cancel",
        requiresConfirmation: Bool = true,
        role: ButtonRole? = nil,
        model: Binding<ConfirmationModel?>? = nil,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.confirmationTitleKey = confirmationTitleKey
        self.confirmationButtonTitleKey = confirmationButtonTitleKey
        self.cancelButtonTitleKey = cancelButtonTitleKey
        self.requiresConfirmation = requiresConfirmation
        self.role = role
        self.model = model
        self.action = action
        self.label = label
    }

    public init(
        _ titleKey: LocalizedStringKey,
        confirmation confirmationTitleKey: LocalizedStringKey,
        confirmationButton confirmationButtonTitleKey: LocalizedStringKey? = nil,
        cancelButton cancelButtonTitleKey: LocalizedStringKey = "Cancel",
        requiresConfirmation: Bool = true,
        role: ButtonRole? = nil,
        model: Binding<ConfirmationModel?>? = nil,
        action: @escaping () -> Void,
    ) where Label == Text {
        self.init(
            confirmation: confirmationTitleKey,
            confirmationButton: confirmationButtonTitleKey,
            cancelButton: cancelButtonTitleKey,
            requiresConfirmation: requiresConfirmation,
            role: role,
            model: model,
            action: action
        ) {
            Text(titleKey)
        }
    }

    public init(
        _ titleKey: LocalizedStringKey,
        image: String,
        confirmation confirmationTitleKey: LocalizedStringKey,
        confirmationButton confirmationButtonTitleKey: LocalizedStringKey? = nil,
        cancelButton cancelButtonTitleKey: LocalizedStringKey = "Cancel",
        requiresConfirmation: Bool = true,
        role: ButtonRole? = nil,
        model: Binding<ConfirmationModel?>? = nil,
        action: @escaping () -> Void,
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(
            confirmation: confirmationTitleKey,
            confirmationButton: confirmationButtonTitleKey,
            cancelButton: cancelButtonTitleKey,
            requiresConfirmation: requiresConfirmation,
            role: role,
            model: model,
            action: action
        ) {
            Label(
                titleKey,
                image: image
            )
        }
    }

    public init(
        _ titleKey: LocalizedStringKey,
        systemImage: String,
        confirmation confirmationTitleKey: LocalizedStringKey,
        confirmationButton confirmationButtonTitleKey: LocalizedStringKey? = nil,
        cancelButton cancelButtonTitleKey: LocalizedStringKey = "Cancel",
        requiresConfirmation: Bool = true,
        role: ButtonRole? = nil,
        model: Binding<ConfirmationModel?>? = nil,
        action: @escaping () -> Void,
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(
            confirmation: confirmationTitleKey,
            confirmationButton: confirmationButtonTitleKey,
            cancelButton: cancelButtonTitleKey,
            requiresConfirmation: requiresConfirmation,
            role: role,
            model: model,
            action: action
        ) {
            Label(
                titleKey,
                systemImage: systemImage
            )
        }
    }

    public var body: some View {
        Button(
            role: role,
            action: buttonAction,
            label: label
        )
        .confirmationDialog(
            confirmationTitleKey,
            isPresented: $isConfirmationDialogPresented,
            titleVisibility: .visible,
            actions: {
                ConfirmationActions(
                    confirmationButtonRole: confirmationButtonRole,
                    confirmationButtonAction: confirmationButtonAction,
                    confirmationButtonLabel: confirmationButtonLabel,
                    cancelButton: cancelButtonTitleKey
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

    @ViewBuilder
    private func confirmationButtonLabel() -> some View {
        if let confirmationButtonTitleKey {
            Text(confirmationButtonTitleKey)
        } else {
            label()
        }
    }

    private func buttonAction() {
        if requiresConfirmation {
            if let model {
                model.wrappedValue = ConfirmationModel(
                    confirmationTitleKey: confirmationTitleKey,
                    confirmationButtonRole: confirmationButtonRole,
                    confirmationButtonAction: action,
                    confirmationButtonLabel: confirmationButtonLabel,
                    cancelButtonTitleKey: cancelButtonTitleKey,
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
        confirmation: "Are you sure you want to delete this event?",
        role: .destructive,
        action: {}
    ) {
        Text("Delete Event")
    }

    ButtonWithConfirmation(
        "Delete Event",
        confirmation: "Are you sure you want to delete this event?",
        confirmationButton: "Delete It",
        cancelButton: "Keep It",
        requiresConfirmation: true,
        role: .cancel,
        action: {}
    )

    ButtonWithConfirmation(
        "Delete Event",
        systemImage: "trash",
        confirmation: "Are you sure you want to delete this event?",
        requiresConfirmation: false,
        action: {}
    )
}
