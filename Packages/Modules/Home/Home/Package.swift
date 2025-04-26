// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let analyticsInterface = "AnalyticsInterface"
private let commonModels = "CommonModels"
private let dependencyContainer = "DependencyContainer"
private let songDetailsInterface = "SongDetailsInterface"
private let localization = "Localization"

let package = Package(
    name: "Home",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Home",
            targets: ["Home"]
        ),
    ],
    dependencies: [
        .package(name: analyticsInterface, path: "../../../Analytics/\(analyticsInterface)"),
        .package(name: commonModels, path: "../../../\(commonModels)"),
        .package(name: dependencyContainer, path: "../../../\(dependencyContainer)"),
        .package(name: songDetailsInterface, path: "../../SongDetails/\(songDetailsInterface)"),
        .package(name: localization, path: "../../../\(localization)"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Home",
            dependencies: [
                .product(name: analyticsInterface, package: analyticsInterface),
                .product(name: commonModels, package: commonModels),
                .product(name: dependencyContainer, package: dependencyContainer),
                .product(name: songDetailsInterface, package: songDetailsInterface),
                .product(name: localization, package: localization),
            ]
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]
        ),
    ]
)
