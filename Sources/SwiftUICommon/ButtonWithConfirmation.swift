import SwiftUI

public struct ButtonWithConfirmation<Label: View>: View {
    private let confirmationTitleKey: LocalizedStringKey
    private let confirmationButtonTitleKey: LocalizedStringKey?
    private let cancelButtonTitleKey: LocalizedStringKey
    private let requiresConfirmation: Bool
    private let role: ButtonRole?
    private let action: () -> Void
    private let label: () -> Label

    @State private var isConfirmationDialogPresented = false

    public init(
        confirmation confirmationTitleKey: LocalizedStringKey,
        confirmationButton confirmationButtonTitleKey: LocalizedStringKey? = nil,
        cancelButton cancelButtonTitleKey: LocalizedStringKey = "Cancel",
        requiresConfirmation: Bool = true,
        role: ButtonRole? = nil,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.confirmationTitleKey = confirmationTitleKey
        self.confirmationButtonTitleKey = confirmationButtonTitleKey
        self.cancelButtonTitleKey = cancelButtonTitleKey
        self.requiresConfirmation = requiresConfirmation
        self.role = role
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
        action: @escaping () -> Void,
    ) where Label == Text {
        self.init(
            confirmation: confirmationTitleKey,
            confirmationButton: confirmationButtonTitleKey,
            cancelButton: cancelButtonTitleKey,
            requiresConfirmation: requiresConfirmation,
            role: role,
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
        action: @escaping () -> Void,
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(
            confirmation: confirmationTitleKey,
            confirmationButton: confirmationButtonTitleKey,
            cancelButton: cancelButtonTitleKey,
            requiresConfirmation: requiresConfirmation,
            role: role,
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
        action: @escaping () -> Void,
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(
            confirmation: confirmationTitleKey,
            confirmationButton: confirmationButtonTitleKey,
            cancelButton: cancelButtonTitleKey,
            requiresConfirmation: requiresConfirmation,
            role: role,
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
                Button(
                    role: confirmationButtonRole,
                    action: confirmationButtonAction
                ) {
                    if let confirmationButtonTitleKey {
                        Text(confirmationButtonTitleKey)
                    } else {
                        label()
                    }
                }

                Button(
                    cancelButtonTitleKey,
                    role: .cancel,
                    action: {}
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

    private func buttonAction() {
        if requiresConfirmation {
            isConfirmationDialogPresented = true
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
