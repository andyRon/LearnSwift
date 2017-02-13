/**
 Generics
 */
// 泛型函数
func swapValue<T>(_ a: inout T, _ b: inout T) {     // T 是一个占位类型，其他字幕也可以，只要在尖括号中就行
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

// 命名类型参数
// Dictionary<Key : Hashable, Value>
// Array<Element>

// 泛型类型
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

// 扩展一个泛型类型
extension Stack {       // 不需要在扩展的定义中提供类型参数列表
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

// 类型约束
// 类型约束语法
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
// 不是所有的 Swift类型都可以用等式符( == )进行比较
func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

// 关联类型
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

// Where 子句
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    // 检查两个容器含有相同数量的元素
    if someContainer.count != anotherContainer.count {
        return false
    }
    // 检查每一对元素是否相等
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    // 所有元素都匹配，返回 true
    return true
}
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
