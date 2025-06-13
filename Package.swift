// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "SwiftCommon",
    products: [
        .library(
            name: "SwiftCommon",
            targets: ["SwiftCommon"]
        )
    ],
    targets: [
        .target(name: "SwiftCommon"),
        .testTarget(
            name: "SwiftCommonTests",
            dependencies: ["SwiftCommon"]
        )
    ]
)
