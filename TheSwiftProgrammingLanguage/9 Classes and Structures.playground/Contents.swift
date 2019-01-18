/**
 Classes and Structures 类和结构体
 */
// 一个单一文件中定义一个类或者结构体，系统将会自动生成面向其它代码的外部接口。
/**
 类和结构体的共同点：
    定义属性用于存储值
    定义方法用于提供功能
    定义下标操作使得可以通过下标语法来访问实例所包含的值
    定义构造器用于生成初始化值
    通过扩展以增加默认实现的功能
    实现协议以提供某种标准功能
 类还有如下的附加功能：
    继承允许一个类继承另一个类的特征
    类型转换允许在运行时检查和解释一个类实例的类型
    析构器允许一个类实例释放任何其所被分配的资源
    引用计数允许对一个类的多次引用
 
 **结构体总是通过被复制的方式在代码中传递，不使用引用计数。**
 */
// 新类或结构体命名用*UpperCamelCase*（Swift类型的命名规范）
// 属性和方法命名用*lowerCamelCase*
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
// 类和结构体实例
// 结构体和类都使用构造器语法来生成新的实例， `()`是最简单的构造器语法。
let someResolution = Resolution()
let someVideoMode = VideoMode()
// 结构体的成员逐一构造器
let hd = Resolution(width: 1920, height: 1080)
// 结构体和枚举是值类型。所有的基本类型:整数(Integer)、浮 点数(floating-point)、布尔值(Boolean)、字符串(string)、数组(array)和字典(dictionary)，都是 值类型，并且在底层都是以结构体的形式所实现。
var cinema = hd
cinema.width = 2048
print("hd is still \(hd.width) pixels wide")
// 类是引用类型
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty.frameRate
// 恒等运算符:判定两个常量或者变量是否引用同一个类实例
tenEighty === alsoTenEighty

/**
 建议选择结构体的情况：
    - 该数据结构的主要目的是用来封装少量相关简单数据值。
    - 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。 
    - 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
    - 该数据结构不需要去继承另一个既有类型的属性或者行为。
 */
struct Shape {
    var width: Double = 1.0
    var height: Double = 1.0
}
struct Path {
    var start: Int
    var length: Int
}
struct Point {
    var x: Double
    var y: Double
    var z: Double
}

// Swift中的String，Array和Dictionary是值类型，OC中的NSString， NSArray和NSDictionary是引用类型

