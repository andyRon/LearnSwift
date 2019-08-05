/**
 Strings and Characters  字符串和字符
 */

// 1 字符串字面量(String Literals)
"Some string literal value"

// 2 初始化空字符串 (Initializing an Empty String)
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}

// 3 字符串可变性(String Mutability)
var variableString = "Horse"
variableString += " and carriage"
//let constantString = "Highlander"
//constantString += " and another Highlander"

// 4 字符串是值类型(Strings Are Value Types)
// 在实际编译时，Swift编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字符串作为值类型的同时可以获得极高的性能。

// 5 使用字符(Working with Characters)
for character in "Dog!?🐶" {
    print(character)
}
let exclamationMark: Character = "!"                                        // `Character`是字符（注意也是双引号，不是单引号）
let catCharacters: [Character] = ["C", "a", "t", "!", "?"]
let catString = String(catCharacters)                                       // 字符数组生成字符串

// 6 连接字符串和字符 (Concatenating Strings and Characters)
let string1 = "Hello"
let string2 = " there"
var welcome0 = string1 + string2
welcome0 += string1
welcome0.append(exclamationMark)

// 7 字符串插值 (String Interpolation)
// 插值字符串中写在括号中的表达式不能包含非转义双引号 (") 和反斜杠 (\)，并且不能包含回车或换行符。
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"      // message is "3 times 2.5 is 7.5"

// 8 Unicode
// Swift的String和Character类型是完全兼容Unicode标准的。
let dollarSign = "\u{24}"           // Unicode 标量 U+0024
let blackHeart = "\u{2665}"         // Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"    // Unicode 标量 U+1F496
// 可扩展的字形群集(Extended Grapheme Clusters)

// 9 计算字符数量 (Counting Characters)
welcome0.count

// 10 访问和修改字符串 (Accessing and Modifying a String)
let greeting = "Guten Tag!"
greeting[greeting.startIndex]                                               // G
greeting[greeting.index(before: greeting.endIndex)]                         // !
greeting[greeting.index(after: greeting.startIndex)]                        // u
let index = greeting.index(greeting.startIndex, offsetBy: 6)                // 从某个索引开始向后offsetBy的索引
greeting[index]
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Inserting and Removing
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)                                                       // welcome now equals "hello!"
welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))                // welcome now equals "hello there!
welcome.remove(at: welcome.index(before: welcome.endIndex))                                     // welcome now equals "hello there"
let range = welcome.index(welcome.endIndex, offsetBy: -6) ..< welcome.endIndex
welcome.removeSubrange(range)                                                                   // welcome now equals "hello"

// 11 比较字符串 (Comparing Strings)
// 字符串字符相等：==，!=
// 前缀/后缀相等：hasPrefix(_:) / hasSuffix(_:)

// 12 字符串的 Unicode 表示形式(Unicode Representations of Strings)

// 13 String的常见方法和属性
//welcome.characters                  // `String`没有继承`Sequence`，不能直接遍历，用 `String.characters`
welcome.count
for c in welcome {
}
welcome.isEmpty
welcome.startIndex
welcome.hashValue
welcome.hasPrefix("he")             // 是否有前缀
welcome.hasSuffix("!")              // 是否有后缀
welcome.lowercased()                // 变成小写
welcome.uppercased()                // 变成大写



