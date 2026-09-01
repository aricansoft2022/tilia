// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "FidiliaCore",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "FidiliaCore",
            targets: ["FidiliaCore"]
        )
    ],
    targets: [
        .target(
            name: "FidiliaCore"
        ),
        .testTarget(
            name: "FidiliaCoreTests",
            dependencies: ["FidiliaCore"]
        )
    ]
)
