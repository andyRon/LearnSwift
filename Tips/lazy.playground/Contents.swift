//: Playground - noun: a place where people can play

import UIKit
// https://juejin.im/post/5a92c2cf51882528b6401888

/*
 Swift的编程范式虽然有函数式编程，但是Swift和纯函数式编程的语言如haskell还是有一些差距。Swift中集合操作默认的求值策略是eager，就是及早求值。当表达式赋值给一个变量时计算就进行了。
 为了支持惰性求值，在collection通过lazy属性可以获取到一个惰性的集合。
 */
// a huge collection
let giant = 0..<Int.max
// lazily map it: no work is done yet
let mapped = giant.lazy.map { $0 * 2 }
// sum the first few elements
let sum = mapped.prefix(10).reduce(0, +)
// sum == 90

// 惰性求值的缺点就和异步一样，写代码的时候不能显示的看出执行顺序。

