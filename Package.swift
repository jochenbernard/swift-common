// swift-tools-version: 6.2

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
            name: "SwiftCommon",
            targets: ["SwiftCommon"]
        ),
        .library(
            name: "FoundationCommon",
            targets: ["FoundationCommon"]
        ),
        .library(
            name: "SwiftUICommon",
            targets: ["SwiftUICommon"]
        )
    ],
    targets: [
        .target(
            name: "SwiftCommon",
            dependencies: [
                "FoundationCommon",
                "SwiftUICommon"
            ]
        ),
        .target(name: "FoundationCommon"),
        .target(name: "SwiftUICommon"),
        .testTarget(
            name: "FoundationCommonTests",
            dependencies: ["FoundationCommon"]
        )
    ]
)
