/**
 Inheritance
 */
// 一个类可以继承(inherit)另一个类的方法(methods)，属性(properties)和其它特性
// 类可以调用和访问超类的方法，属性和下标(subscripts)，并且可以重写(override)这些方 法，属性和下标来优化或修改它们的行为。
// 可以为类中继承来的属性添加属性观察器(property observers)
// 基类(base class)
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}
let someVehicle = Vehicle()
// 子类生成(Subclassing)
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
// 重写(Overriding)
// 任何缺少`override`关键字的重写都会在编译时被诊断为错误。
// 访问超类的方法，属性及下标。 `super`
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
// 防止重写 (`final var`, `final func`, `final class func`, `final subscript`)
