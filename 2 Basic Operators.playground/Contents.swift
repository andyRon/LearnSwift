/**
 Basic Operators
 */

// 赋值运算符
// 赋值操作并不返回任何值

// 算术运算符
// 溢出运算(如 a &+ b )
1 + 2
5 - 3
2 * 3
10.0 / 2.5
"hello, " + "world"
// 求余运算符
// a % b    a = (b × 倍数) + 余数    倍数是整数，可以使负数
9 % 4           // 1   9 = 4*2 + 1
-9 % 4          // -1  -9 = 4*-2 + (-1)
// 自增和自减运算 (最新版的swift已经去掉)
// 一元负号运算符/一元正号运算符

// 复合赋值(Compound Assignment Operators)
// 复合赋值运算没有返回值
var a = 1
a += 2

// 比较运算符
1 == 1
1 <= 2
2 >= 1
1 < 1
1 > 2
class A {
    
}
var obja = A()
var objb = A()
var objc = obja
obja === objb           // false    恒等 === 和不恒等 !== 只用来两个对象是否引用同一个对象实例
obja !== objc           // false

// 三目运算符(Ternary Conditional Operator)
true ? "true" : "false"

// 空合运算符(Nil Coalescing Operator)
var e: String?
var f = "我是fuck"
e ?? f                  // `e != nil ? e! : f` ， 可选类型`e`不是`nil`时，就`e!`,否则为`f`。（注意`??`前后要空格）

// 区间运算符
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
for index in 1..<5 {
    print("\(index) * 5 = \(index * 5)")
}

// 逻辑运算 操作对象是逻辑布尔值
var mybool = false
var youbool = true
!mybool
mybool && youbool
mybool || youbool

