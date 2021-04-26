// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PersonaDown",
    platforms: [
        .macOS("10.11"),
        .iOS("9.0"),
        .tvOS("9.0")
    ],
    products: [
        .library(
            name: "PersonaDown",
            targets: ["PersonaDown"]
        )
    ],
    targets: [
        .target(
            name: "libcmark",
            dependencies: [],
            path: "Sources/cmark",
            exclude: [
              "include",
              "case_fold_switch.inc",
              "entities.inc",
              "COPYING"
            ],
            publicHeadersPath: "./"
        ),
        .target(
            name: "PersonaDown",
            dependencies: ["libcmark"],
            path: "Sources/Down",
            exclude: ["Down.h"],
            resources: [
                .copy("Resources/DownView.bundle"),
                .copy("Resources/DownView (macOS).bundle"),
            ]
        ),
//        .testTarget(
//            name: "DownTests",
//            dependencies: ["PersonaDown"],
//            path: "Tests/DownTests",
//            exclude: [
//                "AST/VisitorTests.swift",
//                "AST/__Snapshots__",
//                "DownViewTests.swift",
//                "Fixtures",
//                "Styler/__Snapshots__",
//                "Styler/BlockQuoteStyleTests.swift",
//                "Styler/CodeBlockStyleTests.swift",
//                "Styler/DownDebugLayoutManagerTests.swift",
//                "Styler/HeadingStyleTests.swift",
//                "Styler/LinkStyleTests.swift",
//                "Styler/InlineStyleTests.swift",
//                "Styler/ListItemStyleTests.swift",
//                "Styler/StylerTestSuite.swift",
//                "Styler/ThematicBreakSyleTests.swift"
//            ]
//        )
    ],
    swiftLanguageVersions: [.v5]
)
