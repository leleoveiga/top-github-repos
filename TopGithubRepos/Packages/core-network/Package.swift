// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "core-network",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "core-network",
            targets: ["core-network"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "core-network",
            dependencies: [
                .product(
                    name: "Alamofire",
                    package: "Alamofire"),
                .product(
                    name: "RxSwift",
                    package: "RxSwift"),
            ]),
        .testTarget(
            name: "core-networkTests",
            dependencies: ["core-network"]
        ),
    ]
)
