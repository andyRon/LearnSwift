/**
 Initialization
 */
// 构造过程是使用类、结构体或枚举类型的实例之前的准备过程
// 通过定义构造器( Initializers )来实现构造过程

// 存储属性的初始赋值
// 类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。
// 当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值是被直接设置的，不会触发任何属性观察者。

// 自定义构造过程
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius 是 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius 是 0.0
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
// 不带外部名的构造器参数
struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}
// 可选属性类型
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
// 对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改;不能在子类中修改。
class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

// 默认构造器
// 如果结构体或类的所有属性都有默认值，相当于有一个自定义的构造器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
// 结构体的逐一成员构造器
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

// 值类型(结构体和枚举类型)的构造器代理(调用其它构造器来完成实例的部分构造过程)
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}                               // 功能上与所有属性都有默认值的默认构造器类似
    init(origin: Point, size: Size) {       // 功能上与结构体的逐一成员构造器类似
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// 类的继承和构造过程
/* 指定构造器(designated initializers)：主要，至少有一个。一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。
 init(parameters) {
    statements
 }
 */
/* 便利构造器(convenience initializers)：次要，辅助。
 convenience init(parameters) {
    statements
 }
 */
// 类的构造器代理规则
//  1 指定构造器必须调用其直接父类的的指定构造器。
//  2 便利构造器必须调用同一类中定义的其它构造器。
//  3 便利构造器必须最终导致一个指定构造器被调用。
// 两段式构造过程
//  第一阶段：每个存储型属性被引入它们的类指定一个初始值
//  第二阶段：给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性
// 4种有效的安全检查(确保两段式构造过程能不出错地完成)
//  1 指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器。(一个对象的内存只有在其所有存储型属性确定之后才能完全初始化)
//  2 指定构造器必须先向上代理调用父类构造器，然后再为继承的属性设置新值。如果没这么做，指定构造器赋予的新值将被父类中的构造器所覆盖。
//  3 便利构造器必须先代理调用同一类中的其它构造器，然后再为任意属性赋新值。如果没这么做，便利构造器赋予的新值将被同一类中其它指定构造器所覆盖。
//  4 构造器在第一阶段构造完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用self作为一个值。
// 构造器的继承和重写
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
class Bicycle: Vehicle {
    override init() {
        super.init()            // 确保`Bicycle`在修改`Vehicle`的属性之前，它所继承的属性`numberOfWheels`能被`Vehicle`初始化
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
bicycle.numberOfWheels
// 注：子类可以在初始化时修改继承来的变量属性，但是不能修改继承来的常量属性。
// 构造器的自动继承
//  规则1：如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器。
//  规则2：如果子类提供了所有父类指定构造器的实现——无论是通过规则1继承过来的，还是提供了自定义实现——它将自动继承所有父类的便利构造器。
// 指定构造器和便利构造器实践
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()
class RecipeIngredient: Food {      // 食谱中的一项原料
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
oneMysteryItem.quantity
// `RecipeIngredient()`使用从`Food`自动继承的便利构造器`convenience init()`，并在这个便利构造器调用自身的`override convenience init(name: String)`
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
class ShoppingListItem2: RecipeIngredient {     // 购物单中出现的某一种食谱原料
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " 有" : " 无"
        return output
    }
}
var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

// 可失败构造器

// 必要构造器
// 在类的构造器前添加`required`修饰符表明所有该类的子类都必须实现该构造器
// 在重写父类中必要的指定构造器时，不需要添加 override 修饰符

// 通过闭包或函数设置属性的默认值