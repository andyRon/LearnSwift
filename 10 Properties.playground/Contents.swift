/**
 Properties
 + 存储属性 Stored Properties （只能用于类和结构体）
 * 常量结构体的存储属性（常量结构的属性不能修改）
 * 延迟存储属性  `lazy var`
 - 必须将延迟存储属性声明成变量（使用var关键字），因为属性的初始值可能在实例构造完成之后才会得到。而**常量属性在构造过程完成之前必须要有初始值**，因此无法声明成延迟属性。
 - 如果一个被标记为lazy的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始
 * 存储属性和实例变量 ??
 + 计算属性  getter (setter, `newValue`) （用于类、结构体和枚举）
 * 只读计算属性
 * 必须使用var关键字定义计算属性
 + 属性观察器(property observer)
 * 可以添加的：
 - 存储属性（除了延迟存储属性）
 - **重写的计算属性**
 * 每次属性被设置值的时候都会调用属性观察器
 * willSet (newValue)
 * didset (oldValue)
 + 全局变量和局部变量
 全局的常量或变量都是延迟计算的（不需要`lazy`），局部范围的常量或变量不会延迟计算。
 + 类型属性（类似于静态属性）
 * 存储型类型属性是延迟初始化的
 * `static` `class`
 
 */

// 存储属性 Stored Properties （只能用于类和结构体）
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

// 计算属性
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
    var volume: Double {
        return width*height*depth
    }
}

// 属性观察器

