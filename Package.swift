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
        .library(name: "Checkpoint", targets: ["Checkpoint"]),
        .library(name: "Checkpoint Standard Library Integration", targets: ["Checkpoint Standard Library Integration"]),
        .library(name: "Checkpoint Foundation Library Integration", targets: ["Checkpoint Foundation Library Integration"]),
        .library(name: "Checkpoint Test Support", targets: ["Checkpoint Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Checkpoint",
            dependencies: [
            ],
            path: "Sources/Checkpoint"
        ),
        .target(
            name: "Checkpoint Standard Library Integration",
            dependencies: [
                .target(name: "Checkpoint"),
            ],
            path: "Sources/Checkpoint Standard Library Integration"
        ),
        .target(
            name: "Checkpoint Foundation Library Integration",
            dependencies: [
                .target(name: "Checkpoint"),
                .target(name: "Checkpoint Standard Library Integration"),
            ],
            path: "Sources/Checkpoint Foundation Library Integration"
        ),
        .target(
            name: "Checkpoint Test Support",
            dependencies: [
                .target(name: "Checkpoint"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Checkpoint Tests",
            dependencies: [
                .target(name: "Checkpoint"),
                .target(name: "Checkpoint Test Support"),
                .target(name: "Checkpoint Standard Library Integration"),
                .target(name: "Checkpoint Foundation Library Integration"),
            ],
            path: "Tests/Checkpoint Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
