/*
 [柯里化 (Currying)](https://en.wikipedia.org/wiki/Currying)
 柯里化是一种量产相似方法的好办法
 
 */

func addOne(num: Int) -> Int {
    return num + 1
}

func addTo(_ adder: Int) -> (Int)->Int {
    return {
        num in
        return num + adder
    }
}

let addThree = addTo(3)
let result = addThree(6)
