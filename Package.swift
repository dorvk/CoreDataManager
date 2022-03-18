// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDataManager",
    products: [
        .library(name: "CoreDataManager", targets: ["CoreDataManager"])
    ],
    dependencies: [],
    targets: [
        .target(name: "CoreDataManager", dependencies: [], path: "Sources")
    ]
)
