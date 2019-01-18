# Swift中的stride函数



`stride`函数定义：**返回从起始值到结束值的序列，指定取值特定的间隔大小。**

根据是否包含结束值，分为两种形式：


```swift
public func stride<T>(from start: T, to end: T, by stride: T.Stride) -> StrideTo<T> where T : Strideable
```

```swift
public func stride<T>(from start: T, through end: T, by stride: T.Stride) -> StrideThrough<T> where T : Strideable
```

使用例子：

```swift
for i in stride(from: 0, to: 10, by: 2) {
    print(i)
}

// 结果：
0
2
4
6
8
```



```swift
for i in stride(from: 0, through: 10, by: 2) {
    print(i)
}

// 结果：
0
2
4
6
8
10
```

参数`by` 也可是负数，那么就是从后向前取值：

```swift
for i in stride(from: (nodes.count - 1), through: 1, by: -1) {
...
}
```





### 参考

[Using stride() to loop over a range of numbers](https://www.hackingwithswift.com/example-code/language/using-stride-to-loop-over-a-range-of-numbers)









