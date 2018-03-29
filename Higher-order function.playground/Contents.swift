/*
 高级函数（Higher-order function）
 定义：如果一个函数：
     - 接受一个或多个函数当作参数
     - 把一个函数当作返回值
 */
// 1 sorted
// public func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element]
let numbers = [1, 4, 2, 3]
let res = numbers.sorted {
    $0 < $1
}
print(res.description)

// 2 map
// public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
let arr = [1, 2, 4]
let brr = arr.map {
    "No." + String($0)
}
// brr = ["No.1", "No.2", "No.4"]

// 3 reduce
// public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
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
}   // crr = "1 2 4"
[3,5,8,9].reduce(2) {
    (prevSum: Int, element: Int) in
    return prevSum + element
}

// 4 forEach
// public func forEach(_ body: (Element) throws -> Void) rethrows
arr.forEach {
    print($0)
}

// 5 flatMap
let collections = [[5, 2, 7], [4, 8], [9, 1, 3]]
let flat = collections.flatMap { $0 }
// [5, 2, 7, 4, 8, 9, 1, 3]

// 6 filter
let err = arr.filter {
    $0 % 2 == 0
}
// brr = [2, 4]


// map 和 flatMap 的区别
let numbers2 = [1, 2, 3, 4]

let mapped = numbers2.map { Array(repeating: $0, count: $0) }
// [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]

let flatMapped = numbers2.flatMap { Array(repeating: $0, count: $0) }
// [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
