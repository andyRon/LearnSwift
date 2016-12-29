// 字符串字面量(String Literals)
"Some string literal value"

// 初始化空字符串 (Initializing an Empty String)
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}

// 字符串是值类型(Strings Are Value Types)
// 在实际编译时，Swift 编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字符 串作为值类型的同时可以获得极高的性能。

// 使用字符(Working with Characters)
for character in "Dog!?".characters {
    print(character)
}
let exclamationMark: Character = "!"                                        // `Character`是字符（注意也是双引号，不是单引号）
let catCharacters: [Character] = ["C", "a", "t", "!", "?"]
let catString = String(catCharacters)

// 连接字符串和字符 (Concatenating Strings and Characters)
let string1 = "Hello"
let string2 = " there"
var welcome = string1 + string2
welcome += string1
welcome.append(exclamationMark)

// 字符串插值 (String Interpolation)
// 插值字符串中写在括号中的表达式不能包含非转义双引号 (") 和反斜杠 (\)，并且不能包含回车或换行符。
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"      // message is "3 times 2.5 is 7.5"

// Unicode
// Swift的String和Character类型是完全兼容Unicode标准的。
let dollarSign = "\u{24}"           // Unicode 标量 U+0024
let blackHeart = "\u{2665}"         // Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"    // Unicode 标量 U+1F496
// 可扩展的字形群集(Extended Grapheme Clusters)

// 计算字符数量 (Counting Characters)
welcome.characters.count

// 访问和修改字符串 (Accessing and Modifying a String)
let greeting = "Guten Tag!"
greeting[greeting.startIndex]

// 比较字符串 (Comparing Strings)

// 字符串的 Unicode 表示形式(Unicode Representations of Strings)


// String的常见方法和属性
welcome.characters                  // `String`没有继承`Sequence`，不能直接遍历，用 `String.characters`
welcome.characters.count
for c in welcome.characters {
}
welcome.isEmpty
welcome.startIndex
welcome.hashValue
welcome.hasPrefix("he")             // 是否有前缀
welcome.hasSuffix("!")              // 是否有后缀
welcome.lowercased()                // 变成小写
welcome.uppercased()                // 变成大写



