import SwiftUI

public struct IconToggleStyle: ToggleStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            configuration
                .label
                .labelStyle(.iconOnly)
                .symbolVariant(configuration.isOn ? .fill : .none)
        }
    }
}

public extension ToggleStyle where Self == IconToggleStyle {
    static var icon: IconToggleStyle {
        IconToggleStyle()
    }
}

#Preview {
    Group {
        Toggle(
            "Toggle Pin",
            systemImage: "pin",
            isOn: .constant(false)
        )

        Toggle(
            "Toggle Pin",
            systemImage: "pin",
            isOn: .constant(true)
        )
    }
    .toggleStyle(.icon)
}
