// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "SwiftCommon",
    products: [
        .library(
            name: "FoundationCommon",
            targets: ["FoundationCommon"]
        )
    ],
    targets: [
        .target(name: "FoundationCommon"),
        .testTarget(
            name: "FoundationCommonTests",
            dependencies: ["FoundationCommon"]
        )
    ]
)
