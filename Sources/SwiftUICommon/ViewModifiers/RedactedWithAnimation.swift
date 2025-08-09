import SwiftUI

@available(
    iOS 17.0,
    macOS 14.0,
    tvOS 17.0,
    watchOS 10.0,
    *
)
public extension View {
    /// Adds a reason to apply an animated redaction to this view hierarchy.
    ///
    /// Adding a redaction is an additive process: any redaction provided will be added to the reasons provided by the
    /// parent.
    @ViewBuilder
    func redactedWithAnimation(reason: RedactionReasons) -> some View {
        if reason.isEmpty {
            self
        } else {
            self
                .disabled(true)
                .redacted(reason: reason)
                .phaseAnimator(
                    [0.0, 1.0],
                    content: { content, phase in
                        content.mask {
                            let end = phase * 3.0
                            let start = end - 2.0

                            LinearGradient(
                                colors: [
                                    .white.opacity(0.5),
                                    .white.opacity(1.0),
                                    .white.opacity(0.5)
                                ],
                                startPoint: UnitPoint(
                                    x: start,
                                    y: start
                                ),
                                endPoint: UnitPoint(
                                    x: end,
                                    y: end
                                )
                            )
                        }
                    },
                    animation: { phase in
                        phase == 1.0
                        ? .linear.speed(0.25).delay(0.5)
                        : nil
                    }
                )
        }
    }
}

@available(
    iOS 17.0,
    macOS 14.0,
    tvOS 17.0,
    watchOS 10.0,
    *
)
#Preview {
    Text(
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
        veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
        commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
        velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia deserunt
        mollit anim id est laborum.
        """
    )
    .redactedWithAnimation(reason: .placeholder)
}
