# Swift中的zip函数

`zip(_:_:)`函数的完整定义：

```swift
public func zip<Sequence1, Sequence2>(_ sequence1: Sequence1, _ sequence2: Sequence2) -> Zip2Sequence<Sequence1, Sequence2> where Sequence1 : Sequence, Sequence2 : Sequence

```



例子：

```swift
let words = ["one", "two", "three", "four"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
    print("\(word): \(number)")
}
// Prints "one: 1"
// Prints "two: 2
// Prints "three: 3"
// Prints "four: 4"

let naturalNumbers = 1...Int.max
let zipped = Array(zip(words, naturalNumbers))
// zipped == [("one", 1), ("two", 2), ("three", 3), ("four", 4)]
```



