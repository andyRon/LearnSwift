/*
 ??
 `for...in` 可以用在所有实现了 Sequence 的类型上
 
 */

class ReverseIterator<T>: IteratorProtocol {
    
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0 {
            return nil
        } else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}


struct ReverseSequence<T>: Sequence {
    var array:[T]
    
    init (array: [T]) {
        self.array = array
    }
    
    typealias Iterator = ReverseIterator<T>
    
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
    
}

let arr = [0,1,2,3,4,5]

for i in ReverseSequence(array: arr) {
    print("Index \(i) is \(arr[i])")
}

var iterator = arr.makeIterator()
while let obj = iterator.next() {
    print(obj)
}


extension Sequence {
    
//    func map<T>(_ transform: @noescape (Self.Iterator.Element) throws -> T) rethrows -> [T]
//    
//    func filter(_ isIncluded: @noescape (Self.Iterator.Element) throws -> Bool) rethrows -> [Self.Iterator.Element]
//    
//    func reduce<Result>(_ initialResult: Result, _ nextPartialResult: @noescape (partialReult: Result, Self.Iterator.Element) throws -> Result) rethrows -> Result
}

