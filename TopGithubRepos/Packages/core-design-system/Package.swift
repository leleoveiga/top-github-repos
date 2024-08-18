// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "core-design-system",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "core-design-system",
            targets: ["core-design-system"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "core-design-system",
            dependencies: [
                .product(
                    name: "SnapKit",
                    package: "SnapKit"),
            ],
            resources: [.process("Assets/")]),
        .testTarget(
            name: "core-design-systemTests",
            dependencies: ["core-design-system"]
        ),
    ]
)
