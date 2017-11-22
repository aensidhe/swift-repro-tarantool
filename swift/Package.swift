// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "test_loading_module",
    products: [
        .library(
            name: "test_loading_library",
            type: .dynamic,
            targets: ["module"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-foundation/tarantool.git",
            from: "0.4.0"
        ),
    ],
    targets: [
        .target(
            name: "module",
            dependencies: ["TarantoolModule", "AsyncTarantool"])
    ]
)
