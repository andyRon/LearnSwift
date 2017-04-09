import PackageDescription

let package = Package(
    name: "SPMKit",

    dependencies: [
        .Package(url: "https://github.com/nvzqz/RandomKit.git",
                 majorVersion: 4)
    ]
)
