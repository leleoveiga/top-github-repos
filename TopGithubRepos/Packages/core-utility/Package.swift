// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "core-utility",
    defaultLocalization: "pt_BR",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "core-utility",
            targets: ["core-utility"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.1"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.1.0"),
        .package(url: "https://github.com/RxSwiftCommunity/RxGesture", from: "4.0.2"),
        .package(url: "https://github.com/RxSwiftCommunity/RxDataSources", from: "5.0.1"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "core-utility",
            dependencies: [
                .product(
                    name: "SnapKit",
                    package: "SnapKit"),
                .product(
                    name: "RxSwift",
                    package: "RxSwift"),
                .product(
                    name: "RxGesture",
                    package: "RxGesture"),
                .product(
                    name: "RxDataSources",
                    package: "RxDataSources"),
                .product(
                    name: "SDWebImage",
                    package: "SDWebImage"),
            ]),
        .testTarget(
            name: "core-utilityTests",
            dependencies: ["core-utility"]
        ),
    ]
)
