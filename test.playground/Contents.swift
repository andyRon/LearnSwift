//protocol Greetable {
//    var name: String { get }
//    func greet()
//}
//
//struct Person: Greetable {
//    let name: String
//    func greet() {
//        print("你好 \(name)")
//    }
//}
//
//Person(name: "Wei Wang").greet()
//
//struct Cat: Greetable {
//    let name: String
//    func greet() {
//        print("meow~ \(name)")
//    }
//}
//
//let array: [Greetable] = [ Person(name: "Wei Wang"), Cat(name: "onevcat")]
//for obj in array {
//    obj.greet()
//}
//
////struct Bug: Greetable {
////    let name: String
////}
//extension Greetable {
//    func call() {
//        print("哈哈哈😄,\(name)")
//    }
//}
//
//Person(name: "AndyRon").call()
//Cat(name:"加菲猫").call()
//
//
//protocol Nameable {
//    var name: String { get }
//}
//protocol Identifiable {
//    var name: String { get }
//    var id: Int { get }
//}
//
//struct Person2: Nameable, Identifiable {
////    let name: String
//    let id: Int
//}
//extension Nameable {
//    var name: String { return "default name" }
//}
//extension Identifiable {
////    var name: String { return "another default name" }
//}
//
////Person2(name: "andyron", id: 1).name
//



var letters = Set<Character>()                                      // 创建和构造一个空的类型为`Set<Character>`的集合
letters.insert("a")
letters = []
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
favoriteGenres.insert("Jazz")
favoriteGenres.count
favoriteGenres.remove("Classical")                                  // 有成员就返回此成员，否则返回`nil`
//favoriteGenres.removeAll()
favoriteGenres.contains("Rock")
// 遍历集合
var s = ""
favoriteGenres
for genre in favoriteGenres {
//    print(genre)
    s += genre
}
print(s)
for genre in favoriteGenres.sorted() {
    print(genre)
}

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
var test = urls.map{$0+"wo"}



