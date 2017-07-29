/**
 Protocols
 协议定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法、属性，以及其他需要的东西。
 类、结构体或枚举都可以采纳协议，并为协议定义的这些要求提供具体实现。 
 xx conform xxx protocol (xx“符合”xxx协议)
 */

// 1 属性要求
// 可以要求提供特定名称和类型的实例属性或类型属性
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
protocol FullyNamed {
    var fullName: String { get }
}
struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

// 2 方法要求
// 不需要大括号和方法体; 不支持为协议中的方法的参数提供默认值
protocol SomeProtocol2 {
    static func someTypeMethod()
}
protocol RandomNumberGenerator {
    func random() -> Double
}
// 线性同余生成器(linear congruential generator)的伪随机数算法。
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        // a.truncatingRemainder(dividingBy:m) = b 相当于 x*m + b = a。（a是浮点数，x是整数）
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

// 3 Mutating 方法要求
// 实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字。
protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

// 4 构造器要求
protocol SomeProtocol3 {
    init(someParameter: Int)
}
class SomeClass: SomeProtocol3 {
    required init(someParameter: Int) {  // 必须要加required
        
    }
}

// 5 协议作为类型
//  1 作为函数、方法或构造器中的参数类型或返回值类型
//  2 作为常量、变量或属性的类型
//  3 作为数组、字典或其他容器中的元素类型
class Dice {        // 骰子
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
let a = 8.625
a.truncatingRemainder(dividingBy: 0.75)
let b = 5.5
b.truncatingRemainder(dividingBy: 3)

// 6 委托(代理)模式
// 委托是一种设计模式，它允许类或结构体将一些需要它们负责的功能委托给其他类型的实例。
// 委托模式的实现: 定义协议来封装那些需要被委托的功能，这样就能确保采纳协议的类型能提供这些功能。
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(game: DiceGame)
}
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(game: self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(game: self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(game: self)
    }
}
class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

// 7 通过扩展添加协议一致性
// 通过扩展令已有类型采纳并符合协议时，该类型的所有实例也会随之获得协议中定义的各项功能。
protocol TextRepresentable {
    var textualDescription: String { get }
}
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

// 8 通过扩展采纳协议
// 当一个类型已经符合了某个协议中的所有要求，却还没有声明采纳该协议时，可以通过空扩展体的扩展来采纳该协议
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}
let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster

// 9 协议类型的集合
let things: [TextRepresentable] = [ d12, simonTheHamster]
    for thing in things {
        print(thing.textualDescription)
}

// 10 协议的继承
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

// 11 类类型专属协议
protocol SomeClassOnlyProtocol: class { // 只能类可以实现这个协议
    
}
//struct SomeStruct: SomeClassOnlyProtocol {
//}

// 12 协议合成
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person2: Named, Aged {
    var name: String
    var age: Int
}
// 参数celebrator的类型是`Named & Aged`，意味着它不关心参数的具体类型，只要参数符合这两个协议即可
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person2(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

// 13 检查协议一致性
/**
 检查和转换到某个协议类型在语法上和类型的检查和转换完全相同:
 • is 用来检查实例是否符合某个协议，若符合则返回 true ，否则返回 false 。
 • as? 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 nil 。 
 • as! 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误。
 */
protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

// 14 可选的协议要求
import Foundation
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count = count + amount
        } else if let amount = dataSource?.fixedIncrement {
            count = count +  amount
        }
    }
}
class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

// 15 协议扩展
// 协议可以通过扩展来为采纳协议的类型提供属性、方法以及下标的实现。
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And here's a random Boolean: \(generator.randomBool())")
// 提供默认实现。
// 如果符合PrettyTextRepresentable协议某个类、结构体或枚举，有属性prettyTextualDescription的实现，那属性prettyTextualDescription的结果就是这个实现，否则就会使用扩展当中的实现。
extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}
// 为协议扩展添加限制条件
extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
print(hamsters.textualDescription)



