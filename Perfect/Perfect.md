[Perfect](http://perfect.org/docs/index_zh_CN.html)学习
-------------------------

### 快速上手
- `swift --version`   需要swift 3.0+
- 编译入门项目，http://localhost:8181/ 
```
git clone https://github.com/PerfectlySoft/PerfectTemplate.git
cd PerfectTemplate
swift build
.build/debug/PerfectTemplate
```
- 创建一个Xcode项目，生成**PerfectTemplate.xcodeproj**和相关文件： `swift package generate-xcodeproj`
- 打开**PerfectTemplate.xcodeproj**，在**Build Settings**的**Library Search Paths**中添加 $(PROJECT_DIR) - Recursive


###  HTTP和Web服务基础
- API
    + API是连接两个软件系统之间的桥梁。通常API会接受标准类型作为输入，并在内部转换然后与其它系统工作实现具体的软件操作，或者返回具体的信息。

### 代码资源库结构

### 用SPM软件包管理器编译项目
- [Swift软件包管理器（SPM）](https://swift.org/package-manager/)是一个用于Swift项目开发、测试、依存关系管理的命令行工具。
- 所有的Perfect组件针对SPM设计的。
- 创建一个新的Perfect项目最好的办法就是克隆[PerfectTemplate项目模板](https://github.com/PerfectlySoft/PerfectTemplate)或从该模板上开发新的Perfect分支。
- `git clone https://github.com/PerfectlySoft/PerfectTemplate.git`
    + Sources 目录包含了所有Perfect项目的Swift源程序文件
    + “Package.swift”是SPM文件管理清单，包含了整个项目对其它库函数的依存关系
- 在Package.swift文件中的依存
    + 目前只有一个依赖关系
    ```
    import PackageDescription
 
    let package = Package(
        name: "PerfectTemplate",
        targets: [],
        dependencies: [
            .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
                majorVersion: 2, minor: 0)
        ]
    )
    ```
    + name 项目名称
    + dependencies 依存关系清单。数组，每一个项都是一个“.Package”
        * SPM会自动下载适合的版本配合您的项目一同编译。
        * 所有依存关系库文件都会下载到一个SPM自动创建的Packages目录下。
    + 很多依赖库时可以按下面这种写法：
    ```
    import PackageDescription
     
    let versions = Version(0,0,0)..<Version(10,0,0)
    let urls = [
        "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
        "https://github.com/PerfectlySoft/Perfect-FastCGI.git",
        "https://github.com/PerfectlySoft/Perfect-CURL.git",
        "https://github.com/PerfectlySoft/Perfect-PostgreSQL.git",
        "https://github.com/PerfectlySoft/Perfect-SQLite.git",
        "https://github.com/PerfectlySoft/Perfect-Redis.git",
        "https://github.com/PerfectlySoft/Perfect-MySQL.git",
        "https://github.com/PerfectlySoft/Perfect-MongoDB.git",
        "https://github.com/PerfectlySoft/Perfect-WebSockets.git",
        "https://github.com/PerfectlySoft/Perfect-Notifications.git",
        "https://github.com/PerfectlySoft/Perfect-Mustache.git"
    ]
     
    let package = Package(
        name: "PerfectTemplate",
        targets: [],
        dependencies: urls.map { .Package(url: $0, versions: versions) }
    )
    ```

- 编译
    + `swift build`     自动下载依赖文件，然后编译。生成的可执行文件`.build/debug/PerfectTemplate`， 默认生成的是调式版本
    + `swift build -c release`      编译一个用于发行的版本，对应的在`.build/release/`目录下
    + `swift build --clean`     删除`.build`目录重新编译
    + `swift build --clean=dist`    删除`.build`目录和`Packages`目录，重新下载编译

- Xcode项目
    + `swift package generate-xcodeproj`
    + ️注意：最好不要在这个Xcode项目上直接编辑或增加文件。如果需要更多的依存关系，或者需要下载更新的版本，您需要重新生成这个Xcode项目。因此，在之前您做的任何修改都会被Xcode覆盖。 ???

- 所有的SPM项目至少要包括一个 Sources 目录和一个 Package.swift 文件。

### HTTP 服务器


### 处理HTTP请求
- 请求过程
    1. 所有对象都是在服务器对象创建后开始工作
    2. 服务器对象会被执行配置，随后会根据配置绑定并监听特定端口。
    3. 一旦出现连接，服务器会读取请求数据，请求数据读取完成后，服务器会将request object请求对象传递给请求过滤器。
    4. 过滤器可能会根据需要修改查询请求。