/**
 Automatic Reference Counting
 */
// 引用计数仅仅应用于类的实例 
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?
reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1
reference1 = nil
reference2 = nil
reference3 = nil

// 类实例之间的循环强引用
class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment2?
    deinit { print("\(name) is being deinitialized") }
}
class Apartment2 {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person2?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
var andy: Person2?
var unit4A: Apartment2?
andy = Person2(name: "Andy Ron")
unit4A = Apartment2(unit: "4A")
andy!.apartment = unit4A
unit4A!.tenant = andy
andy = nil
unit4A = nil
// john和unit4A两个变量虽然已经被赋值为nil，但之前它们引用两个实例之间的强引用关系保留了下来并且不会被断开

// 解决实例之间的循环强引用
// 弱引用(weak reference)和无主引用(unowned reference)允许循环引用中的一个实例引用另外一个实例而不保持强引用
// 弱引用:弱引用必须被声明为变量，表明其值能在运行时被修改。`weak`
class Person3 {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment3?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Apartment3 {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person3?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
var andy3: Person3?
var unit5A: Apartment3?
andy3 = Person3(name: "Andy Ron3")
unit5A = Apartment3(unit: "5A")
andy3!.apartment = unit5A
unit5A!.tenant = andy3
andy3 = nil
unit5A = nil
// 无主引用 `unowned`

// 

