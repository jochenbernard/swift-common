import SwiftUI

public struct ConfirmationModel {
    let confirmationTitle: Text
    let confirmationButtonRole: ButtonRole?
    let confirmationButtonAction: () -> Void
    let confirmationButtonLabel: AnyView
    let cancelButtonLabel: AnyView?
}
