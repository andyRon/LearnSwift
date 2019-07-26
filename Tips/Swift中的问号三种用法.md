# Swift中的问号三种用法


1. 三目运算符(Ternary Conditional Operator)
这在大部分语言中都比较常见
`布尔值 ? "true" : "false"`

2. 可选值
可选值`?`和 `!`是一对。`?`用在某个类型后面，可以通俗的理解为，这个值不太确实是否是这个类型，如果不是就给个`nil`吧；`!`可以理解为，一定要给个类型我，要不老子分分钟挂给你看了。😎

3. 空合运算符(Nil Coalescing Operator)  `??`
这个我在其他语言没见过。`e ?? f ` 相当于 `e != nil ? e! : f`， 可选类型`e`不是`nil`时，就`e!`,否则为`f`。

```swift
var e: String?
var f = "我是fuck"
e ?? f                  // `e != nil ? e! : f` ， 可选类型`e`不是`nil`时，就`e!`,否则为`f`。（注意`??`前后要空格）
```