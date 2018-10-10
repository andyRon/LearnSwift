/*
 `mutating`关键字修饰方法是为了能在该方法中修改 `struct` 或是 `enum` 的变量，所以如果你没在协议方法里写 `mutating` 的话，别人如果用 `struct` 或者 `enum` 来实现这个协议的话，就不能在方法里改变自己的变量了
  */

import UIKit

protocol Vehicle {
    var numberOfWheels: Int {get}
    var color: UIColor {get set}
    
    mutating func changeColor()
}

struct Car: Vehicle {
    var numberOfWheels: Int = 4
    var color: UIColor = .white
    
    mutating func changeColor() {
        color = .blue
    }
}
