/**
 Access Control
 */
// 可以明确地给单个类型(类、结构体、枚举)设置访问级别，也可以给这些类型的属性、方法、构造器、下标等设置访问级别。协议也可以被限定在一定的范围内使用，包括协议里的全局常量、变量和函数。
// 为某些典型场景提供了默认的访问级别
// *实体(entities)* : 对于代码中可以设置访问级别的特性(属性、基本类型、函数等)一种统称

// 1 模块和源文件
// *模块*：独立的代码单元
//  *框架或应用程序*会作为一个独立的模块来构建和发布
//  一个模块可以使用import关键字导入另外一个模块
//  Xcode的每个target(例如框架或应用程序)都被当作独立的模块处理
// *源文件*：Swift中的源代码文件

// 2 访问级别（低→高）
//  open: 类似public。可以被访问和被继承
//  public: 可以访问同一模块源文件中的任何实体，在模块外也可以通过导入该模块来访问源文件里的所有实体。可以被访问不可以被继承
//  internal: 可以访问同一模块源文件中的任何实体，但是不能从模块外访问该模块源文件中的实体。通常情况下，某个接口只在应用程序或框架内部使用时，你可以将其设置为internal级别。
//  fileprivate: 限制实体只能在所在的源文件内部使用。
//  private: 只在定义的实体中使用
//  访问级别基本原则: 不可以在某个实体中定义访问级别更高的实体
//  函数的访问级别不能高于它的参数类型和返回类型的访问级别。
//  一般，默认为 internal 级别
//  在导入应用程序模块的语句前使用 @testable 特性，然后在允许测试的编译设置( Build Options -> Enable Testability )下编译这个应用程序模块，单元测试 target 就可以访问应用程序模块中所有 internal 级别的实体。

// 3 访问控制语法

// 4 自定义类型
//  一个类型的访问级别也会影响到类型成员(属性、方法、构造器、下标)的默认访问级别。
//  元组：元组的访问级别将由元组中访问级别最严格的类型来决定。
//  函数：函数的访问级别根据访问级别最严格的参数类型或返回类型的访问级别来决定。但是，如果这种访问级别不符合函数定义所在环境的默认访问级别，那么就需要明确地指定该函数的访问级别。
//  枚举类型：枚举成员的访问级别和该枚举类型相同，你不能为枚举成员单独指定不同的访问级别。枚举定义中的任何原始值或关联值的类型的访问级别至少不能低于枚举类型的访问级别。

// 5 子类
//  子类的访问级别不得高于父类的访问级别。
//  可以在符合当前访问级别的条件下重写任意类成员(方法、属性、构造器、下标等)。
public class A {
    fileprivate func someMethod() {}
}
internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

// 6 常量、变量、属性、下标
//  常量、变量、属性访问级别不能高于它们所属的类型。
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}
var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")               // 打印 “The number of edits is 3”
public struct TrackedString2 {
    public private(set) var numberOfEdits = 0                               // Getter的访问级别是public，Setter的访问级别是private。
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

// 7 构造器
//  *必要构造器* 的访问级别必须和所属类型相同。

// 8 协议

// 9 扩展

// 10 泛型

// 11 类型别名
//  类型别名的访问级别不可高于其表示的类型的访问级别

