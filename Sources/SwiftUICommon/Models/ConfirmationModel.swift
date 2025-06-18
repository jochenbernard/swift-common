import SwiftUI

public struct ConfirmationModel {
    let confirmationTitleKey: LocalizedStringKey
    let confirmationButtonRole: ButtonRole?
    let confirmationButtonAction: () -> Void
    let confirmationButtonLabel: () -> AnyView
    let cancelButtonTitleKey: LocalizedStringKey

    init(
        confirmationTitleKey: LocalizedStringKey,
        confirmationButtonRole: ButtonRole?,
        confirmationButtonAction: @escaping () -> Void,
        confirmationButtonLabel: @escaping () -> some View,
        cancelButtonTitleKey: LocalizedStringKey
    ) {
        self.confirmationTitleKey = confirmationTitleKey
        self.confirmationButtonRole = confirmationButtonRole
        self.confirmationButtonAction = confirmationButtonAction
        self.confirmationButtonLabel = { AnyView(confirmationButtonLabel()) }
        self.cancelButtonTitleKey = cancelButtonTitleKey
    }
}
