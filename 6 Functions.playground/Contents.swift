/**
 Functions 函数
 */

// 1 函数的定义与调用 (Defining and Calling Functions)
// 参数，parameters
// 返回类型，return type
// 实参，arguments
func greet(person: String) -> String {
    return "Hello, " + person + "!"
}

// 2 函数参数与返回值 (Function Parameters and Return Values)
// 无参数函数 (Functions Without Parameters)
func sayHelloWorld() -> String {
    return "hello, world"
}
// 多参数函数 (Functions With Multiple Parameters)
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return "Hello, " + person + " again!"
    } else {
        return "Hello, " + person + "!"
    }
}
// 无返回值函数 (Functions Without Return Values)
// 没有定义返回类型的函数会 返回一个特殊的Void值。它其实是一个空的元组(tuple)，没有任何元素，可以写成()。
func greet(person: String) {
    print("Hello, \(person)!")
}
// 多个返回值函数 (Functions with Multiple Return Values)
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// 可选元组返回类型 (Optional Tuple Return Types)
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax2(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// 3 函数参数标签和参数名称 (Function Argument Labels and Parameter Names)
// 每个函数参数都有一个参数标签( argument label )以及一个参数名称( parameter name )。参数标签在调用函数的时候使用;调用的时候需要将函数的参数标签写在对应的参数前面。参数名称在函数的实现中使用。
func someFunction(argumentLabel parameterName: Int) {
}
// 忽略参数标签(Omitting Argument Labels)
// 默认参数值 (Default Parameter Values)
// 可变参数 (Variadic Parameters)   一个函数最多只能拥有一个可变参数
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1,2,3))
print(arithmeticMean(1.2,3.45,5,6,3.12))
// 输入输出参数(In-Out Parameters)
// 函数参数默认是常量。输入输出参数可以在函数中修改参数，并且在函数调用结束后仍然存在。
// 只能传递变量给输入输出参数
// 输入输出参数不能有默认值，而且可变参数不能用inout标记。
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// 4 函数类型 (Function Types)
func addTwoInts(_ a: Int, _ b: Int) -> Int {            // `(Int, Int) -> Int`
    return a + b
}
func printHelloWorld() {                                // `() -> Void`
    print("hello, world")
}
// 使用函数类型 (Using Function Types)
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
// 函数类型作为参数类型 (Function Types as Parameter Types)
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// 函数类型作为返回类型 (Function Types as Return Types)
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

// 5 嵌套函数 (Nested Functions)
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

