/**
 Advanced Operators 高级运算符
 */

// 1 位运算符
// 按位取反运算符
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits                     // 等于 0b11110000
// 按位与运算符
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits     // 等于 00111100
// 按位或运算符
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits              // 等于 11111110
// 按位异或运算符
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits              // 等于 00010001
// 按位左移、右移运算符
let shiftBits: UInt8 = 4                            // 00000100
shiftBits << 1                                      // 00001000
shiftBits << 2                                      // 00010000
shiftBits << 5                                      // 10000000
shiftBits << 6                                      // 00000000
shiftBits >> 2                                      // 00000001
//  使用移位运算对颜色进行RGB分解
let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16          // redComponent 是 0xCC，即 204
let greenComponent = (pink & 0x00FF00) >> 8         // greenComponent 是 0x66， 即 102
let blueComponent = pink & 0x0000FF                 // blueComponent 是 0x99，即 153
//  有符号整数的移位运算

// 2 溢出运算符
// 在默认情况下，当向一个整数赋予超过它容量的值时，Swift默认会报错，而不是生成一个无效的数。
var potentialOverflow = Int16.max                   // potentialOverflow 的值是 32767，这是 Int16 能容纳的最大整数
//potentialOverflow += 1                            // 这里会报错
// 可以选择让系统在数值溢出的时候采取截断处理，而非报错。 `&+` `&-` `&*`
var unsignedOverflow = UInt8.max                    // unsignedOverflow 等于 UInt8 所能容纳的最大整数 255 
unsignedOverflow = unsignedOverflow &+ 1            // 此时 unsignedOverflow 等于 0
var unsignedOverflow2 = UInt8.min                   // unsignedOverflow 等于 UInt8 所能容纳的最小整数 0
unsignedOverflow2 = unsignedOverflow2 &- 1          // 此时 unsignedOverflow 等于 255

// 3 优先级和结合性

// 4 运算符函数
// *运算符重载*: 类和结构体可以为现有的运算符提供自定义的实现。
// 例子：向量的相加
struct Vector2D {
    var x = 0.0, y = 0.0
}
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
        return !(left == right)
    }
}
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector         // combinedVector 是一个新的 Vector2D 实例，值为 (5.0, 5.0)
let negative = -vector                              // negative 是一个值为 (-3.0, -1.0) 的 Vector2D 实例
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd                             // original 的值现在为 (4.0, 6.0)
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

// 5 自定义运算符
