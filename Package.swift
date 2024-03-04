// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-core-module",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "CoreInterfaceKit", targets: ["CoreInterfaceKit"]),
        .library(name: "CoreKit", targets: ["CoreKit"]),
        .library(name: "CoreOpenAPIGeneratorKit", targets: ["CoreOpenAPIGeneratorKit"]),
        .library(name: "CoreOpenAPIRuntimeKit", targets: ["CoreOpenAPIRuntimeKit"]),
        .executable(name: "CoreOpenAPIGenerator", targets: ["CoreOpenAPIGenerator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.0.0"),
        .package(url: "https://github.com/binarybirds/swift-nanoid", from: "1.0.0"),
        .package(url: "https://github.com/feather-framework/feather-relational-database", .upToNextMinor(from: "0.2.0")),
        .package(url: "https://github.com/feather-framework/feather-database-kit", .upToNextMinor(from: "0.1.0")),
        .package(url: "https://github.com/feather-framework/feather-openapi-kit", .upToNextMinor(from: "0.8.0")),
        .package(url: "https://github.com/jpsim/Yams", from: "5.0.0"),
    ],
    targets: [
        .target(name: "CoreInterfaceKit"),
        .target(
            name: "CoreKit",
            dependencies: [
                .product(name: "NanoID", package: "swift-nanoid"),
                .product(name: "FeatherRelationalDatabase", package: "feather-relational-database"),
                .product(name: "DatabaseQueryKit", package: "feather-database-kit"),
                .target(name: "CoreInterfaceKit"),
            ]
        ),
        .target(
            name: "CoreOpenAPIRuntimeKit",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .target(name: "CoreInterfaceKit"),
            ]
        ),
        .executableTarget(
            name: "CoreOpenAPIGenerator",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .target(name: "CoreOpenAPIGeneratorKit"),
            ]
        ),
        .target(
            name: "CoreOpenAPIGeneratorKit",
            dependencies: [
                .product(name: "FeatherOpenAPIKit", package: "feather-openapi-kit"),
                .product(name: "FeatherOpenAPIKitMacros", package: "feather-openapi-kit"),
            ],
            plugins: [
                .plugin(name: "FeatherOpenAPIGenerator", package: "feather-openapi-kit")
            ]
        ),
        .testTarget(
            name: "CoreInterfaceKitTests",
            dependencies: [
                .target(name: "CoreInterfaceKit")
            ]
        ),
    ]
)
