/**
 常量和变量
 */
// 声明：常量 let 变量 var
let constants = 10
var variables = 0

// 多个声明
var x = 0.0, y = 0.0, z = 0.0

// 类型标注(type annotation)
var welcomeMessage: String

// 常量与变量名不能包含数学符号，箭头，保留的(或者非法的)Unicode 码位，连线与制表符。也不能以数字开头。
// 常量与变量不能修改类型也不能互换
// 使用反引号（`）来使用保留关键字
let π = 3.14159
let 你好 = "你好世界"
let `let` = "hihi"

// 输出 `print(_:separator:terminator:)`  三种参数：输出项、分隔符、结束符
print(1,`let`, separator: ",", terminator: "<br/>")

// 字符串插值(string interpolation)
print("The current value of constants is \(constants)")
// 注释
// 当行注释
/*
 /*
 多行注释可以嵌套在其它的多行注释之中
  */
 */

// 分号   单行单挑语句不一定需要，单行多条语句必须
let cat = "?"; print(cat)

//整数
// U代表无符号
// Int类型与当前系统的位数相同
UInt8.max
Int8.max
Int32.max
UInt32.max
Int64.max
UInt64.max
Int.max

// 浮点数
Double(11.1)
Float(11.1)



