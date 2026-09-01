// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-checkpoint",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Checkpoint",
            targets: ["Checkpoint"]
        ),
        .library(
            name: "Checkpoint Test Support",
            targets: ["Checkpoint Test Support"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Checkpoint",
            dependencies: []
        ),
        .target(
            name: "Checkpoint Test Support",
            dependencies: [.target(name: "Checkpoint")]
        ),
        .testTarget(
            name: "Checkpoint Tests",
            dependencies: [
                .target(name: "Checkpoint"),
                .target(name: "Checkpoint Test Support"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
