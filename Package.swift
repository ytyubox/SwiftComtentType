// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftContentType",
		platforms: [.macOS(SupportedPlatform.MacOSVersion.v10_15)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftContentType",
            targets: ["SwiftContentType"]),
        .library(
                   name: "SwiftContentTypeCoder",
                   targets: ["SwiftContentTypeCoder"]),
        .library(
                        name: "SwiftContentTypePlugin",
                        targets: ["SwiftContentTypePlugin"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/vapor/url-encoded-form", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SwiftContentType",
            dependencies: []),
        .testTarget(
            name: "SwiftContentTypeTests",
            dependencies: ["SwiftContentType","URLEncodedForm"]),
        
        .target(
                   name: "SwiftContentTypeCoder",
                   dependencies: ["SwiftContentType"]),
        .testTarget(
                   name: "SwiftContentTypeCoderTests",
                   dependencies: ["SwiftContentTypeCoder"]),
        .target(
                    name: "SwiftContentTypePlugin",
                    dependencies: ["SwiftContentType"]),
         .testTarget(
                    name: "SwiftContentTypePluginTests",
                    dependencies: ["SwiftContentTypePlugin"]),
    ]
)
