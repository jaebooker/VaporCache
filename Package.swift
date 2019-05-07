// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "VaporCache",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0"),
        // SWift SQL Heavy
        .package(url: "https://github.com/vapor/fluent-mysql.git", from: "3.0.0-rc"),
        // Swift PostGres
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0-rc")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentSQLite", "FluentPostgreSQL", "FluentMySQL", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

