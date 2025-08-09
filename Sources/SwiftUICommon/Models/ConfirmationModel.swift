import SwiftUI

/// A model that can be used to present a confirmation dialog using the ``confirmation(model:)`` `ViewModifier` or the
/// ``ConfirmationScene`` `Scene`.
///
/// A ``ConfirmationModel`` can be assigned using ``ButtonWithConfirmation``.
public struct ConfirmationModel {
    let confirmationTitle: Text
    let confirmationButtonRole: ButtonRole?
    let confirmationButtonAction: () -> Void
    let confirmationButtonLabel: AnyView
    let cancelButtonLabel: AnyView?
}
