/**
 Extensions
 为一个已有的类、结构体、枚举类型或者协议类型添加新功能。
 包括在没有权限获取原始源代码的情况下扩展类型的能力(即**逆向建模**)
 */
// 扩展可以为一个类型添加新的功能，但是不能重写已有的功能。

// 1 扩展语法(Extension Syntax)
/**
 extension SomeType {
    // 为 SomeType 添加的新功能写到这里
 }
 // 扩展一个已有类型，使其实现一些协议。
 extension SomeType: SomeProtocol, AnotherProctocol { 
    // 协议实现写到这里
 }
 */
// 如果你通过扩展为一个已有类型添加新功能，那么新功能对该类型的所有已有实例都是可用的，即使它们是在这个扩展定义之前创建的。

// 2 计算型属性(Computed Properties)
extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
// 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。

// 3 构造器(Initializers)
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// 4 方法(Methods)
extension Int {
    func repetitions(task: () -> Void) {      // 将闭包中的任务执行整数对应的次数
        for _ in 0..<self {
            task()
        }
    }
}
5.repetitions(task: {
    print("Hello!")
})
// 可变实例方法(Mutating Instance Methods)
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square() // 不能直接用字面量`3.square()`

// 5 下标(Subscripts)
extension Int {
    subscript(digitIndex: Int) ->Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self/decimalBase) % 10
    }
}
12345678[2]

// 6 嵌套类型(Nested Types)
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}
func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", terminator: "")
        case .Zero:
            print("0 ", terminator: "")
        case .Positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds(numbers: [3, 19, -27, 0, -6, 0, 7])
