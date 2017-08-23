// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "ColorOfTheDay",
    dependencies: [
        .Package(url: "../RandomColor", majorVersion: 1)
    ]
)
