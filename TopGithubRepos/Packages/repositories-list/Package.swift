// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "repositories-list",
    defaultLocalization: "pt_BR",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "repositories-list",
            targets: ["repositories-list"]),
    ],
    dependencies: [
        .package(path: "../core-network"),
        .package(path: "../core-design-system"),
        .package(path: "../core-utility"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "repositories-list",
            dependencies: [
                .product(name: "core-network", package: "core-network"),
                .product(name: "core-design-system", package: "core-design-system"),
                .product(name: "core-utility", package: "core-utility")
            ]),
        .testTarget(
            name: "repositories-listTests",
            dependencies: ["repositories-list"]
        ),
    ]
)
