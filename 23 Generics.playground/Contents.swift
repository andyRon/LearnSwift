/**
 Generics
 泛型是 Swift 最强大的特性之一，许多 Swift 标准库是通过泛型代码构建的。
 */
// 1 泛型函数
// T是一个占位类型，其他字母也可以，只要在尖括号中就行。
// 可以理解为：在定义的时候还不知道是啥类型，那就假设是T类型，等到调用时，给过来什么类型的参数，那T就是上面类型。
func swapValue<T>(_ a: inout T, _ b: inout T) {
    let tmp = a
    a = b
    b = tmp
}
var a = 1
var b = 3
swapValue(&a, &b)
print(a,b)
var s1 = "word"
var s2 = "单词"
swapValue(&s1, &s2)
print(s1, s2)

// 2 类型参数
// T就是类型参数。可以定义多个类型参数。

// 3 命名类型参数：就是把类型参数命名为一个容易阅读的名字（大写字母开头的驼峰命名法）。
// Dictionary<Key, Value>
// Array<Element>

// 4 泛型类型
struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push(item: "uno")
stackOfStrings.push(item: "dos")
stackOfStrings.push(item: "tres")
stackOfStrings.push(item: "cuatro")

// 5 扩展一个泛型类型
// 不需要在扩展的定义中提供类型参数列表。原始类型定义中声明的类型参数列表在扩展中可以直接使用，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

// 6 类型约束：指定一个类型参数必须继承自指定类，或者符合一个特定的协议或协议组合。
/*
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) { // 这里是泛型函数的函数体部分
}
 */
/*
func findIndex<T>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
 */
// 不是所有的 Swift类型都可以用等式符(==)进行比较。
// Swift标准库中定义了一个 Equatable 协议，该协议要求任何遵循该协议的类型必须实现等式符( == )及不等符( != )。
func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

// 7 关联类型
// 关联类型为协议中的 某个类型提供了一个占位名(或者说别名)，其代表的实际类型在协议被采纳时才会被指定。
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
struct Stack2<Element>: Container {
    // Stack<Element> 的原始实现部分 
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(item: Element) {
        self.push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {  // swift 可以推断出ItemType就是Element
        return items[i]
    }
}

// 8 Where 子句
//func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
//    // 检查两个容器含有相同数量的元素
//    if someContainer.count != anotherContainer.count {
//        return false
//    }
//    // 检查每一对元素是否相等
//    for i in 0..<someContainer.count {
//        if someContainer[i] != anotherContainer[i] {
//            return false
//        }
//    }
//    // 所有元素都匹配，返回 true
//    return true
//}
//var stackOfStrings2 = Stack2<String>()
//stackOfStrings2.push(item: "uno")
//stackOfStrings2.push(item: "dos")
//stackOfStrings2.push(item: "tres")
//var arrayOfStrings = ["uno", "dos", "tres"]
//if allItemsMatch(stackOfStrings2, arrayOfStrings) { //??
//    print("All items match.")
//} else {
//    print("Not all items match.")
//}
