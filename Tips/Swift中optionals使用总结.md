# Swift中optionals使用总结


1. 变量声明

```swift
let optional: String? = "unicorn"
var optional2: Int?
let optionals: [String?] = ["unicorn", nil, "dragon"]
var optionals2: [Int]?
```


2. if let

```swift
if let value = optional {

// 多变量
if let value = optional, let value2 = optional2 {

// 布尔值判断从句（boolean clause）
if let value = optional, value.hasSuffix("saurus") {
```


3. guard

```swift
guard let value = optional else { 
  return
}
```

4. while

```swift
while let value = optional {
```

5. 空合运算（(Nil Coalescing）

```swift
let value = optional ?? "nil"
```

6. 强制解析

```swift
let value = optional!
```

7. switch

```swift
switch optional {
case .some(let value):
  print(value)
case .none:
  print("nil")
}
```

8. map()

```swift
let value = optional.map(String.init(describing:))
```

9. flatMap()

```swift
let value = optional.flatMap(URL.init(string:))
```

10. compactMap()

```swift
let values = optionals.compactMap { $0 }
```

11. 类型转换

```swift
let value = optional as! String
```

12. 可选链

```swift
let value = optional?.uppercased()
```

13. for 

```swift
for element in optionals {
  if let value = element {
```

14. for case let

```swift
for case let optional? in optionals {
```

15. forEach

```swift
optionals?.forEach { value in
```

16. 错误转换成optional

```swift
try? aThrowingCall()
try! aThrowingCall()
```


> 参考： https://www.optionals.org
