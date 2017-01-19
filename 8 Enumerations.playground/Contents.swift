/**
 Enumerations
 */
// 一等(first-class)类型
// 每个枚举定义了一个全新的类型。以大写字母开头
// 成员值(或成员)  原始值  关联值
// 不会被赋予一个默认的整型值

// 枚举语法
enum CompassPoint {
    case North
    case South
    case East
    case West
}
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
var directionToHead = CompassPoint.West
directionToHead = .East

// Switch 语句匹配枚举值
switch directionToHead {
    case .North:
        print("Lots of planets have a north")
    case .South:
        print("Watch out for penguins")
    case .East:
        print("Where the sun rises")
    case .West:
        print("Where the skies are blue")
}

// 关联值(Associated Values)  任意类型，可以各不相同
// “定义一个名为 Barcode 的枚举类型，它的一个成员值是具有 (Int，Int，Int，Int) 类型关联值的 UPCA ，另一个成员值是具有 String 类型关联值的 QRCode 。”
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
    print("QR code: \(productCode).")
}

