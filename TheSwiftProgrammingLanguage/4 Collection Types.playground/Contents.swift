/**
 Collection Type  集合类型
 */
// Collection 分为 Arrays, Sets, Dictionaries(Collection、Sets有时都翻译成集合，注意区分)

// 1 数组(Arrays)是有序数据的集。
// 一个数组中只能有一种数据类型
var someInts = [Int]()                                              // 创建一个由特定数据类型构成的空数组
someInts = []                                                       // someInts 现在是空数组，但是仍然是 [Int] 类型的。
let unmutableArray = [2, 3, 5]                                      // 定义为let，数组内容和数量就不能变化
var threeDoubles = [Double](repeating:0.0, count: 3)                // `Array`创建特定大小并且所有数据都有相同默认值的构造方法
var anotherThreeDoubles = [Double](repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles                 // 数组相加
sixDoubles.count
sixDoubles.isEmpty
sixDoubles.append(2.6)
sixDoubles += [3.2, 3.3]
sixDoubles[0]
sixDoubles[4...6]                                                   // 通过区间获取多个数组项组成的新数组，注意区间大小不能超过数组的下标
sixDoubles.insert(4.4, at: 2)
sixDoubles.remove(at: 0)
sixDoubles.removeLast()
sixDoubles.removeAll()
// 数组遍历
var shoppingList = ["Eggs", "Milk"]
for item in shoppingList {
    print("\(item)")
}
for (index, value) in shoppingList.enumerated() {                   // enumerated()把数组的索引和值生成sequence用于遍历
    print("\(index): \(value)")
}
// 数组特殊操作 
//var a = (1...10)
var arr = [1,3,7,11]
var arr2 = arr.map{$0 * 2}
var sum = arr.reduce(0,+)
// 验证tweet中是否包含选定的若干关键字中的一个
let words = ["Swift","iOS","cocoa","OSX","tvOS"]
let tweet = "This is an example tweet larking about Swift"
//words.contains(tweet.containsString)
//words.filter({tweet.containsString($0)})
tweet.split(separator: " ")
    .lazy
    .map(String.init)
    .contains(where: Set(words).contains)
let name = "andyron"
(1...4).forEach{print("Happy Birthday " + (($0 == 3) ? "dear \(name)":"to You"))}
// 创建重复固定长度数组
let arr3 = [Int?](repeating: nil, count: 20)

// 2 集合(Sets)是无序无重复数据的集。
// 存在集合的中数据类型必须是 可哈希化（必须提供一个方法来计算它的哈希值， 相等的对象哈希值必须相同，a.hashValue == b.hashValue）
// Swift的所有基本类型(比如 String , Int , Double 和 Bool)默认都是可哈希化的
// 在Swift内部可哈希化的类型都遵循了`Hashable`协议，它提供了一个属性`hashValue`
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
for genre in favoriteGenres {
    print(genre)
}
for genre in favoriteGenres.sorted() {
    print(genre)
}
// 集合操作
favoriteGenres = ["Rock", "Classical", "Hip hop"]
favoriteGenres2 = ["Hip hop", "R&B", "rap"]
favoriteGenres.intersection(favoriteGenres2)                        // 交集
favoriteGenres.symmetricDifference(favoriteGenres2)                 // 对称差集
favoriteGenres.union(favoriteGenres2)                               // 并集
favoriteGenres.subtracting(favoriteGenres2)                         // 差集
favoriteGenres2.subtracting(favoriteGenres)                         // 差集
favoriteGenres.subtract(favoriteGenres2)                            // 区别于subtracting，没有返回值直接修改favoriteGenres
var fg3: Set = ["rap"]
favoriteGenres == favoriteGenres2
favoriteGenres2.isSubset(of: fg3)                                   // favoriteGenres2中所有元素是否在fg3中
favoriteGenres2.isSuperset(of: fg3)                                 // favoriteGenres2是否包括fg3中所有元素
favoriteGenres2.isStrictSubset(of: fg3)                             // favoriteGenres2中所有元素是否在fg3中，并且两者不相同
favoriteGenres2.isStrictSuperset(of: fg3)                           // favoriteGenres2是否包括fg3中所有元素，并且两者不相同
favoriteGenres.isDisjoint(with: fg3)                                // favoriteGenres与fg3是否没有交集

// 3 字典(Dictionaries)是无序的键值对的集。
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
airports.count
airports.isEmpty
airports["hongqiao"] = "shanghai"
airports.updateValue("nanjing", forKey: "jichang")
airports["jichang"] = nil; //airports.remove(at: "jichang")
//airports.keys
//airports.values
// 遍历
for (code, name) in airports {
    print("\(code): \(name)")
}
for code in airports.keys {
    print("\(code)")
}

