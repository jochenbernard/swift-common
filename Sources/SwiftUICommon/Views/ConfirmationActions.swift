import SwiftUI

struct ConfirmationActions<Label: View>: View {
    private let confirmationButtonRole: ButtonRole?
    private let confirmationButtonAction: () -> Void
    private let confirmationButtonLabel: () -> Label
    private let cancelButtonTitleKey: LocalizedStringKey

    init(
        confirmationButtonRole: ButtonRole?,
        confirmationButtonAction: @escaping () -> Void,
        confirmationButtonLabel: @escaping () -> Label,
        cancelButton cancelButtonTitleKey: LocalizedStringKey
    ) {
        self.confirmationButtonRole = confirmationButtonRole
        self.confirmationButtonAction = confirmationButtonAction
        self.confirmationButtonLabel = confirmationButtonLabel
        self.cancelButtonTitleKey = cancelButtonTitleKey
    }

    var body: some View {
        Button(
            role: confirmationButtonRole,
            action: confirmationButtonAction,
            label: confirmationButtonLabel
        )
        #if os(iOS) || os(macOS)
        .keyboardShortcut(.defaultAction)
        #endif

        Button(
            cancelButtonTitleKey,
            role: .cancel,
            action: {}
        )
        #if os(iOS) || os(macOS)
        .keyboardShortcut(.cancelAction)
        #endif
    }
}

#Preview {
    ConfirmationActions(
        confirmationButtonRole: .destructive,
        confirmationButtonAction: {},
        confirmationButtonLabel: { Text("Delete Event") },
        cancelButton: "Cancel"
    )
}
