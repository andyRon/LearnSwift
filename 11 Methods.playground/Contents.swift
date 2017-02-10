/**
 Methods
 方法是与某些特定类型相关联的函数
 实例方法为给定类型的实例封装了具体的任务与功能
 类、结构体、枚举都可以定义**实例方法**，也都可以定义**类型方法**
 在OC中，类是唯一能定义方法的类型
 */
// 实例方法 (Instance Methods)
// 实例方法只能被它所属的类的某个特定实例调用
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
// 方法的局部参数名称和外部参数名称 (Local and External Parameter Names for Methods)
class Counter2 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}
let counter = Counter2()
counter.incrementBy(amount: 5, numberOfTimes: 3)
// self 属性(The self Property)：`self`完全等同于该实例本身。
// 消除方法参数 x 和实例属性 x 之间的歧义:
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}
// 在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)
// 结构体和枚举的属性不能在它的实例方法中被修改(因为结构体和枚举是值类型)，但可通过`mutating`（可变方法）修改。
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(_ deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point2(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
// 在可变方法中给 self 赋值(Assigning to self Within a Mutating Method)
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveByX(_ deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

// 类型方法 (Type Methods)
// `static`  `class`
// 在类型方法的方法体(body)中，`self`指向这个类型本身，而不是类型的某个实例。
struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level: level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level: level + 1)
        tracker.advanceToLevel(level: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}
