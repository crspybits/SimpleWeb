// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimpleWeb",
    dependencies: [
        // There appears to be an undocumented (so far as I can find) dependency issue/interation between Kitura and the StencipTemplateEngine. These two won't resolve. This is with both Swift 4.1 and 4.2 (under Xcode 9.4.1 and Xcode 10).
        // .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.5.0"),
        // .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.11.0")
        
        // But, these two will. Versions taken from https://www.kitura.io/guides/templating/stenciltemplate.html
        .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.2.0")),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SimpleWeb",
            dependencies: ["KituraStencil", "Kitura"]),
    ]
)
