import UIKit

/*
 Swift中where语句相关用法总结（更新至Swift4）
 */
// if, guard, while三个语句中where被去掉了，直接使用`,`相隔就行了
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

// do catch
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

// switch
var value:(Int,String) = (1,"小明")
switch value {
case let (x,_) where x < 60:
    print("不及格")
default:
    print("及格")
}

// for in
let arrayOne = [1,2,3,4,5]
let dictionary = [1:"hehe1",2:"hehe2"]
for i in arrayOne where dictionary[i] != nil {
    print(i)
}

// 泛型
func genericFunction<S>(str:S) where S:ExpressibleByStringLiteral{
    print(str)
}
// 也可以不使用where语句，直接在尖括号中定义时做限制
func genericFunction2<S:ExpressibleByStringLiteral>(str:S){
    print(str)
}

// 协议
protocol aProtocol{}
extension aProtocol where Self:UIView{
    //只给遵守myProtocol协议的UIView添加了扩展
    func getString() -> String{
        return "string"
    }
    
}



