/**
 Properties 
 */

// 1 存储属性 Stored Properties （只能用于类和结构体）
// 描述整数的范围，且这个范围值在被创建后不能被修改.
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
// 该区间表示整数0，1，2
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间现在表示整数6，7，8
rangeOfThreeItems.firstValue = 6
// 常量结构的属性不能修改
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 尽管 firstValue 是个变量属性，这里还是会报错
//rangeOfFourItems.firstValue = 6
// 延迟存储属性: 第一次被调用的时候才会计算其初始值。 `lazy var`  (常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性)
class DataImporter {
    /*
     DataImporter 是一个负责将外部文件中的数据导入的类。 这个类的初始化会消耗不少时间。
     */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // 这里会提供数据管理功能
}
let manager = DataManager()         // DataImporter 实例的 importer 属性还没有被创建
manager.data.append("Some data")
manager.data.append("Some more data")
manager.importer.fileName

// 2 计算属性(Computed Properties)
// 不直接存储值，而是提供一个getter和一个可选的setter,来间接获取和设置其他属性或变量的值。
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// 输出 "square.origin is now at (10.0, 10.0)”
// 只读计算属性
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {    // 只用get时可简写
        return width*height*depth
    }
}

// 3 属性观察器(Property Observers)
// 设置属性时（就算值不变），就会调用`willSet`， `didSet`
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("设置成\(newValue)")
        }
//        willSet(newTotalSteps) {
//            print("About to set totalSteps to \(newTotalSteps)")
//        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
//        didSet(old) {
//            print(old)
//        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 1
stepCounter.totalSteps = 20

// 4 全局变量和局部变量(Global and Local Variables)
// 计算属性和属性观察器所描述的功能也可以用于全局变量和局部变量

// 5 类型属性(Type Properties)：用于某个类型所有实例共享的数据。(类似于其他语言的静态属性)
// 存储型类型属性是延迟初始化的
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
SomeStructure.storedTypeProperty
// 声道模型
struct AudioChannel {
    static let thresholdLevel = 10                          // 音量的最大 上限阈值
    static var maxInputLevelForAllChannels = 0              // 实例的最大 音量
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阀值之内
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // 存储当前音量作为新的最大输入音量
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
