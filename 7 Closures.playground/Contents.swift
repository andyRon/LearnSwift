/**
 * Closure
 */
// 闭包是自包含的函数代码块，可以在代码中被传递和使用。
// Swift 中的闭包与 C 和 Objective-C 中的代码块(blocks)以及其他一些编程语言中的匿名函数比较相似。
// 闭包可以捕获和存储其所在上下文中任意常量和变量的引用。

// 闭包表达式(Closure Expressions)
// sorted 方法(The Sorted Method)
// 原数组不会被 sorted(by:) 方法修改。
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella", "Andy", "Amni"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
/**
 闭包表达式语法:
 { (parameters) -> returnType in
 statements
 }
 关键字`in`表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。
 */
var reversedNames2 = names.sorted(by: {(s1:String, s2:String) -> Bool in return s1>s2})
// 根据上下文推断类型(Inferring Type From Context)
var reversedNames3 = names.sorted(by: {(s1, s2)->Bool in return s1>s2})
// 根据上下文推断类型(Inferring Type From Context)  省略 return 和 返回值
var reversedNames4 = names.sorted(by: {(s1, s2) in s1>s2})
// 参数名称缩写(Shorthand Argument Names)
var reversedNames5 = names.sorted(by: {$0>$1})
// 运算符方法(Operator Methods)
var reversedNames6 = names.sorted(by: >)

// 尾随闭包(Trailing Closures)  将一个很长的闭包表达式作为最后一个参数传递给函数
/**
// 以下是不使用尾随闭包进行函数调用 
func someFunctionThatTakesAClosure(closure: {
// 闭包主体部分 
})
// 以下是使用尾随闭包进行函数调用 
func someFunctionThatTakesAClosure() {
// 闭包主体部分 
}
 */
var reversedNames7 = names.sorted(){$0>$1}
var reversedNames8 = names.sorted{$0>$1}        // 当闭包表达式是唯一参数时， ()可省略
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number%10]! + output        // 字典下标返回一个可选值(optional value)
        number /= 10
    } while number > 0
    return output
}

// 值捕获(Capturing Values)
// 闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
// 嵌套函数 是 捕获值的闭包的最简单形式
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
var funcby10 = makeIncrementer(forIncrement: 10)
var funcby50 = makeIncrementer(forIncrement: 50)
// 新生成的incrementer函数，都会各自获得类似全局变量的 amount和runingTotal
funcby50()
funcby50()
funcby10()

// 闭包是引用类型(Closures Are Reference Types)
// 函数和闭包都是引用类型
// 无论将函数或闭包赋值给一个常量还是变量，实际上都是将常量或变量的值设置为对应函数或闭包的引用。
let funcbyTen = funcby10
funcbyTen()

// 逃逸闭包(Escaping Closures)

// 自动闭包(Autoclosures)


