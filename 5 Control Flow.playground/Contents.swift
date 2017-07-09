/**
 Control Flow
 */

// 1 for in
// for in 可用来遍历 Array Dictionary Set Range String
for index in 1...5 {
}
for _ in 1...5 {
}
for v in [1,2,3] {
}
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
}
let countrys:Set = ["China", "USA", "Japan"]
for country in countrys {
}
for s in "andyron".characters {
}

// 2 while
var i = 1
while i > 10 {
    // ...
    i += 1
}
// repeat-while 类似其他语言的 do-while 
repeat {
    // ...
    i += 1
} while  i > 10

// 3 if
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

// 4 switch
// 不存在隐式的贯穿(No Implicit Fallthrough)，不需要break
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// 区间匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
// 元组匹配
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// 值绑定(Value Bindings)
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// case分句中使用where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// 复合匹配
// 当多个条件可以使用同一种方法来处理时，可以将这几种可能放在同一个case后面，并且用逗号隔开。
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

// 控制转移语句(Control Transfer Statements):   continue break fallthrough return throw
// 贯穿(Fallthrough) 执行完一个case后，继续向下执行
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
// 带标签的语句 ??

// guard 与 if 功能类似
// 1 guard会简洁，减少嵌套
// 2 解包时，guard的作用不限于本身
// greet(person: ["name": "Jane", "location": "Cupertino"])
func greet(person: [String: String]) {
    if let name = person["name"] {
        print("Hello \(name)!")
        
        if let location = person["location"] {
            print("I hope the weather is nice in \(location).")
        } else {
            print("I hope the weather is nice near you.")
        }
    } else {
        print("Hello stranger!")
    }
//    print(name)       //name的作用于只限于if中
}
func greet2(person: [String: String]) {
    guard let name = person["name"] else {
        print("Hello stranger!")
        return
    }
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}


// 检测 API 可用性
if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}
