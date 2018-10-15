//: [Previous](@previous)
//: [Next](@next)

/*:
 
 */

func logIfTrue(_ predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue({2 > 1})

//: [Swift中的问号三种用法](http://andyron.com/2017/swift-question.html)
