# Swift中where的用法总结



不同的版本的Swift中where用法有些不同，以最新的Swift4为准，

### 1 if, guard, while三个语句中where被去掉了，直接使用`,`相隔就行了

```swift
if let oldMan: Int = 50, let youngerMan: Int = 18, oldMan > youngerMan {
    print("odlMan > youngerMan")
} else {
    print("错误判断")
}

var arrayTwo:[Int]? = []
while let arr = arrayTwo, arr.count < 5 {
    arrayTwo?.append(1)
}

let string:String? = "小刚"
guard let str = string, str != "小明" else {
    fatalError("看错人了") //
}
print("确实是小明")
```

### 2 do catch

```swift
enum ExceptionError:Error{
    case httpCode(Int)
}
func throwError() throws {
    throw ExceptionError.httpCode(500)
}
do{
    try throwError()
}catch ExceptionError.httpCode(let httpCode) where httpCode >= 500{
    print("server error")
}
```

### 3 switch

```swift
var value:(Int,String) = (1,"小明")
switch value {
case let (x,_) where x < 60:
    print("不及格")
default:
    print("及格")
}
```

### 4 for in

```swift
let arrayOne = [1,2,3,4,5]
let dictionary = [1:"hehe1",2:"hehe2"]
for i in arrayOne where dictionary[i] != nil {
    print(i)
}
```
### 5 泛型

```swift
func genericFunction<S>(str:S) where S:ExpressibleByStringLiteral{
    print(str)
}
// 也可以不使用where语句，直接在尖括号中定义时做限制
func genericFunction2<S:ExpressibleByStringLiteral>(str:S){
    print(str)
}
```

### 6 协议

```swift
protocol aProtocol{}
extension aProtocol where Self:UIView{
    //只给遵守myProtocol协议的UIView添加了扩展
    func getString() -> String{
        return "string"
    }
}
```



> playground文件：[andyRon/LearnSwift/Where.playground](https://github.com/andyRon/LearnSwift)


> 参考：
[Swift where 关键字](http://www.jianshu.com/p/1546594b856b)