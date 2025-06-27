import SwiftUI

struct ConfirmationActions: View {
    let confirmationButtonRole: ButtonRole?
    let confirmationButtonAction: () -> Void
    let confirmationButtonLabel: AnyView
    let cancelButtonLabel: AnyView?

    var body: some View {
        Button(
            role: confirmationButtonRole,
            action: confirmationButtonAction,
            label: { confirmationButtonLabel }
        )
        #if os(iOS) || os(macOS)
        .keyboardShortcut(.defaultAction)
        #endif

        Button(
            role: .cancel,
            action: {},
            label: {
                if let cancelButtonLabel {
                    cancelButtonLabel
                } else {
                    Text("Cancel")
                }
            }
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
        confirmationButtonLabel: AnyView(Text("Delete Event")),
        cancelButtonLabel: nil
    )
}
