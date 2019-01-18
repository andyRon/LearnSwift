/**
 Automatic Reference Counting(ARC) 自动引用计数
 
 引用计数仅仅应用于类的实例
 */

// 1 自动引用计数的工作机制
//  每次创建一个类的新的实例的时候，ARC会分配一块内存来储存该实例信息(包含实例的类型信息，以及这个实例所有相关的存储型属性的值)。
//  ARC会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。
//  引用数为0时，内存释放。

// 2 🌰
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

// 3 类实例之间的循环强引用
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

// 4 解决实例之间的循环强引用
// 弱引用(weak reference)和无主引用(unowned reference)允许循环引用中的一个实例引用另外一个实例而不保持强引用。
// 4.1 弱引用:弱引用必须被声明为变量，表明其值能在运行时被修改。`weak`
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
andy3 = nil                 // Person3的实例被销毁，虽然tenant还引用它，但因为时弱引用在ARC计数范围内。
unit5A = nil
// 4.2 无主引用 `unowned`
// 和弱引用不同的是，无主引用是永远有值的。
// Customer是客户，CreditCard是信用卡。客户可以有或五信用卡，但信用卡必须有对应的用户。
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
var john: Customer?
john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
john = nil          // 客户被销毁，对应的信用卡也要被销毁。
// 打印 “John Appleseed is being deinitialized”
// 打印 ”Card #1234567890123456 is being deinitialized”
// 4.3 无主引用以及隐式解析可选属性  ？？
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

// 5 闭包引起的循环强引用

// 6 解决闭包引起的循环强引用
