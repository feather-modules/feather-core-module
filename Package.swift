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
        .library(name: "CoreModuleKit", targets: ["CoreModuleKit"]),
        .library(name: "CoreModule", targets: ["CoreModule"]),
        .library(name: "CoreOpenAPIGeneratorKit", targets: ["CoreOpenAPIGeneratorKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-relational-database", .upToNextMinor(from: "0.2.0")),
        .package(url: "https://github.com/feather-framework/feather-database-kit", .upToNextMinor(from: "0.7.0")),
        .package(url: "https://github.com/feather-framework/feather-openapi-kit", .upToNextMinor(from: "0.9.0")),
        .package(url: "https://github.com/feather-framework/feather-validation", .upToNextMinor(from: "0.1.0")),
    ],
    targets: [
        .target(
            name: "CoreModuleKit"
        ),
        .target(
            name: "CoreModule",
            dependencies: [
                .product(name: "FeatherRelationalDatabase", package: "feather-relational-database"),
                .product(name: "FeatherValidation", package: "feather-validation"),
                .product(name: "DatabaseQueryKit", package: "feather-database-kit"),
                .target(name: "CoreModuleKit"),
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
            name: "CoreModuleKitTests",
            dependencies: [
                .target(name: "CoreModuleKit")
            ]
        ),
        .testTarget(
            name: "CoreModuleTests",
            dependencies: [
                .target(name: "CoreModule")
            ]
        ),
    ]
)
