// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "SwiftCommon",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .visionOS(.v1),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "FoundationCommon",
            targets: ["FoundationCommon"]
        ),
        .library(
            name: "SwiftCommon",
            targets: ["SwiftCommon"]
        ),
        .library(
            name: "SwiftUICommon",
            targets: ["SwiftUICommon"]
        )
    ],
    targets: [
        .target(name: "FoundationCommon"),
        .target(name: "SwiftCommon"),
        .target(name: "SwiftUICommon"),
        .testTarget(
            name: "FoundationCommonTests",
            dependencies: ["FoundationCommon"]
        ),
        .testTarget(
            name: "SwiftCommonTests",
            dependencies: ["SwiftCommon"]
        )
    ]
)
