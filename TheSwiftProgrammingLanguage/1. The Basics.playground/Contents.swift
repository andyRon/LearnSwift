/**
 The Basics  基础
 */

// 1 常量和变量(Constants and Variables)
// 声明：常量 let 变量 var
let constants = 10
var variables = 0
// 多个声明
var x = 0.0, y = 0.0, z = 0.0
// 类型标注(type annotation)
var welcomeMessage: String
// 常量和变量的命名
// 常量与变量名不能包含数学符号，箭头，保留的(或者非法的)Unicode 码位，连线与制表符。也不能以数字开头。
// 常量与变量不能修改类型也不能互换
// 使用反引号（`）来使用保留关键字
let π = 3.14159
let 你好 = "你好世界"
let `let` = "hihi"
// 输出常量和变量 `func print(_ items: Any..., separator: String = default, terminator: String = default)`  三种参数：输出项、分隔符、结束符
print(1,`let`, separator: ",", terminator: "<br/>")
print(x, y, z, `let`)
// 字符串插值(string interpolation)
print("The current value of constants is \(constants)")

// 2 注释(Comment)
// 单行注释
/*
 /*
 多行注释可以嵌套在其它的多行注释之中
  */
 */

// 3 分号(Semicolons)   单行单条语句不一定需要，单行多条语句必须
let cat = "?"; print(cat)

// 4 整数(Integers)
// U代表无符号
// Int类型与当前系统的位数相同
UInt8.max
UInt8.min
Int8.max
Int32.max
UInt32.max
Int64.max
UInt64.max
Int.max

// 5 浮点数(Floating-Point Numbers)
Double(11.1)                        // 64位
Float(11.1)                         // 32位

// 6 类型安全(type safe)和类型推断(type inference)
let meaningOfLife = 42              // meaningOfLife 会被推测为 Int 类型
let pi = 3.14159                    // pi 会被推测为 Double 类型(优先选择 Double 而不是 Float )

// 7 数值型字面量(Numeric Literals)
// 整数字面量
15
0b1111                              // 二进制15
0o17                                // 八进制15
0xf                                 // 十六进制15
// 浮点字面量
1.025e2                             // 1.025*10^2
1.025e-2                            // 1.025*10^-2
0xbp3                               // 11*2^3
0xbp-3                              // 11*2^-3
0xC.3p0                             // (12+3/16)*2^0
100_000                             // _增强可读性

// 8 数值型类型转换(Numeric Type Conversion)
// 整数转换
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)           // `UInt16`有一个构造器，接受`UInt8`类型的参数生成`UInt16`
// 整数和浮点数转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(pi2)
let pi3 = 3 + 0.14159                                       // 字面量没有特定的类型，所以可以直接相加

// 9 类型别名(type aliases)
typealias AudioSample = UInt16
AudioSample.max

// 10 布尔值
true
false

// 11 元组(tuples) 把多个值组合成一个复合值
// 元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。
let http404Error = (404, "Not Found")                       // 一个类型为 (Int, String) 的元组， 用于描述 HTTP 状态码
let (statusCode, statusMessage) = http404Error              // 元组的内容分解(decompose)
let (justTheStatusCode, _) = http404Error
http404Error.0                                              // 下标访问
let http200Status = (statusCode: 200, description: "OK")    // 给元组元素命名
http200Status.description

// 12 可选类型(optionals)
// 声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil
var optionalString: String?                                 // optionalString的类型要么是String，要么是nil
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)                   // convertedNumber 被推测为可选的`Int`
// if 语句以及强制解析
// 使用 if 语句和 nil 比较来判断一个可选值是否包含值
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")       // `!`称为可选值的强制解析(forced unwrapping)
}
// optionalString! 报错， 使用!来强制解析值之前，一定要确定可选包含一个非nil 的值。
// 可选绑定(optional binding)
if let actualNumber = Int(possibleNumber) {                                     // 如果`Int(possibleNumber)`强制解析的值不是nil，就赋值给actualNumber，并且语句为ture
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
var someOptional: String? = "some"
var someOtherOptional: String?
if let constantName = someOptional, let anotherConstantName = someOtherOptional{
    print("多个可选绑定可以用逗号分隔, 需要每一个语句都为true")
}
// 隐式解析可选类型(implicitly unwrapped optionals): 一个可以自动解析的可选类型
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!                                      // 需要惊叹号来获取值
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString                                      // 不需要感叹号
if assumedString != nil {
    print(assumedString)
}

// 13 错误处理
func canThrowAnErrow() throws {
    // 这个函数有可能抛出错误
}
do {
    try canThrowAnErrow() // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}
enum myError: Error {
    case OutOfCleanDishes
    case MissingIngredients
}
func makeASandwich() throws {
    // ...
    throw  myError.OutOfCleanDishes
}
do {
    try makeASandwich()
} catch myError.OutOfCleanDishes {
    // washDishes()
} catch myError.MissingIngredients{
    // buyGroceries
}

// 14 断言(assertion)和先决条件
// assert(_:_:file:line:)
let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")

// 如果代码已经检查了条件，你可以使用 assertionFailure(_:file:line:) 函数来表明断言失败了
if age > 10 {
  print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
  print("You can ride the ferris wheel.")
} else {
//  assertionFailure("A person's age can't be less than zero.")
  // 错误，输出： Fatal error: A person's age can't be less than zero.: file 1. The Basics.playground, line 165
}


// precondition(_:_:file:line:)
let index = -1
//precondition(index > 0, "Index must be greater than zero.")
