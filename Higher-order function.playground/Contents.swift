/*:
 ## 高阶函数（Higher-order function）
 
 在数学和计算机科学中，[**高阶函数**](https://en.wikipedia.org/wiki/Higher-order_function)是至少满足下列一个条件的函数：
 - 接受一个或多个函数作为输入
 - 输出一个函数
 函数式编程中，高阶函数比较常见了。
 
 >注：`$0`, `$1`, `$2`... 表示闭包第一个参数，第二个参数，第三个参数...。 详细可参考[以撸代码的形式学习Swift-7：闭包(Closure)](http://andyron.com/2017/swift-7-closure)
 */

/*:
 ### 1 sorted
 根据给定的条件（一个用于比较的闭包）来对数组进行排序。
 
 函数原型：
 ```swift
 public func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element]
 ```
 */
let numbers = [1, 4, 2, 3]
let res = numbers.sorted {
    $0 < $1
}
print(res.description)

/*:
 ### 2 map
 返回一个包含对原数组每个元素进行给定闭包处理后元素的数组。（也就是每个元素进行相同处理）
 
 函数原型：
 ```swift
 public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
 ```
 */
let arr = [1, 2, 4]
let brr = arr.map {
    "No." + String($0)
}
// brr = ["No.1", "No.2", "No.4"]

/*:
 ### 3 reduce
 Returns the result of combining the elements of the sequence using the given closure.（ 返回使用给定闭包组合序列元素的结果。）

 函数原型：
 ```swift
 public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
 ```
 */
let crr = arr.reduce(0) {
    (prevSum: Int, element: Int) in
    return prevSum + element
}   // crr = 7
let drr = arr.reduce("") {
    if $0 == "" {
        return String($1)
    } else {
        return $0 + " " + String($1)
    }
}
print(drr)      // drr = "1 2 4"
let res2 = [3,5,8,9].reduce(2) {
    (prevSum: Int, element: Int) in
    return prevSum + element
}
print(res2) // 27。 2+3+5+8+9 = 27

/*:
 ### 4 forEach
 Calls the given closure on each element in the sequence in the same order as a for-in loop.(与`for-in`类似)
 
 函数原型：
 ```swift
 public func forEach(_ body: (Element) throws -> Void) rethrows
 ```
 */
["Swift","OC","iOS","macOS"].forEach {
    print($0)
}

/*:
 ### 5 flatMap
 Returns an array containing the concatenated results of calling the given transformation with each element of this sequence.（返回一个数组，其中包含使用此序列的每个元素调用给定转换的连接结果。）
 
 函数原型：
 ```swift
 public func flatMap(_ transform: (Element) throws -> String?) rethrows -> [String]
 ```
 */
let collections = [[5, 2, 7], [4, 8], [9, 1, 3]]
let flat = collections.flatMap { $0 }
// [5, 2, 7, 4, 8, 9, 1, 3]

/*:
 flatMap和map的区别是，对二维数组时flatMap有个降维处理，对于一位数组，两者没有明显区别
 */
let numbersCompound = [[1,2,3],[4,5,6]]
let mapped = numbersCompound.map { $0.map{ "\($0)-map" } }
print(mapped)       // [["1-map", "2-map", "3-map"], ["4-map", "5-map", "6-map"]]
let flatMapped = numbersCompound.flatMap { $0.map{ "\($0)-flatMap" } }
print(flatMapped)   // ["1-flatMap", "2-flatMap", "3-flatMap", "4-flatMap", "5-flatMap", "6-flatMap"]

let numbers2 = [1, 2, 3, 4]
let mapres = numbers2.map { Array(repeating: $0, count: $0) }
// [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]
let flatMapres = numbers2.flatMap { Array(repeating: $0, count: $0) }
// [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

//: >注：新版Swift使用了`Sequence.compactMap(_:)`来替代`Sequence.flatMap`，[详细](https://github.com/apple/swift-evolution/blob/master/proposals/0187-introduce-filtermap.md)

/*:
 ### 6 filter
 Returns an array containing, in order, the elements of the sequence that satisfy the given predicate.（返回一个数组，该数组按顺序包含满足给定闭包的序列元素。）
 
 函数原型：
 ```swift
 public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element]
 ```
 */
let err = arr.filter {
    $0 % 2 == 0
}
// err = [2, 4]




