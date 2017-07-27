/**
 Error Handling
 错误处理(Error handling)是响应错误以及从错误中恢复的过程。
 */
// 1 表示并抛出错误
// `Error`空协议表明该类型可以用于错误处理
enum VendingMachineError: Error {
    case InvalidSelection //选择无效 
    case InsufficientFunds(coinsNeeded: Int) //金额不足
    case OutOfStock //缺货
}
throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)

// 2 处理错误
// 为了标识出代码中可能会抛出错误的地方，在调用一个能抛出错误的函数、方法或者构造器之前，加上 try 关键字，或者 try? 或 try!这种变体。
// 四个处理错误的方式:
// 1) 用throwing函数传递错误
/*
 **throwing函数**: 在函数声明的参数列表之后加上 throws 关键字，为了表示一个函数、方法或构造器可以抛出错误。
 
    func canThrowErrors() throws -> String
    func cannotThrowErrors() -> String
 
 一个 throwing 函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域。
 只有 throwing 函数可以传递错误。任何在某个非throwing函数内部抛出的错误只能在函数内部处理。
 */
struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        dispenseSnack(snack: name)
    }
}
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
//  throwing构造器能像throwing函数一样传递错误。
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
// 2) 用 Do-Catch 处理错误
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
// 打印 “Insufficient funds. Please insert an additional 2 coins.”
// 3) 将错误转换成可选值
// 如果 someThrowingFunction() 抛出一个错误， x 和 y 的值是 nil，否则 x 和 y 的值就是该函数的返回值。
// 无论 someThrowingFunction() 的返回值类型是什么类型， x 和 y 都是这个类型的可选类型。
// x，y的两种形式类似，try? 更简洁。
func someThrowingFunction() throws -> Int {
    // ...
    return 0
}
let x = try? someThrowingFunction()
let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}
// 4) 禁用错误传递
// try! 禁止错误传递，如真有错误抛出，就出现运行错误。
//let photo = try! loadImage("./Resources/John Appleseed.jpg")


// 3 指定清理操作



