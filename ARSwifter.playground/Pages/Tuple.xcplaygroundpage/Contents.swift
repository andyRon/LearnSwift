/*
 Swift，使用了多元组的方式来同时返回被分割的部分和剩余部分：
 
 extension CGRect {
 //...
 func divided(atDistance: CGFloat, from fromEdge: CGRectEdge)
 -> (slice: CGRect, remainder: CGRect)
 //...
 }
  */

import UIKit

let rect = CGRect(x: 0, y: 0, width: 100, height: 100)

let (small, large) = rect.divided(atDistance: 20, from: .minXEdge)

small
large



