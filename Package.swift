// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "WWDCKit",
    platforms: [.iOS(.v17), .visionOS(.v1), .macOS(.v14)],
    products: [
        .library(name: "WWDCKit", targets: ["WWDCKit"]),
    ],
    targets: [
        .target(name: "WWDCKit")
    ]
)
