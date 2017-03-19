//
//  Strideable+RandomKit.swift
//  RandomKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015-2017 Nikolai Vazquez
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

extension Strideable where Self: RandomWithinRange, Stride: RandomToValue {

    /// Returns a random value of `Self` inside of the unchecked range using `randomGenerator`.
    public static func uncheckedRandom<R: RandomGenerator>(within range: Range<Self>, using randomGenerator: inout R) -> Self {
        let distance = range.lowerBound.distance(to: range.upperBound)
        return range.lowerBound.advanced(by: .random(to: distance, using: &randomGenerator))
    }

}

extension Strideable where Self: RandomWithinClosedRange, Stride: RandomThroughValue {

    /// Returns a random value of `Self` inside of the closed range using `randomGenerator`.
    public static func random<R: RandomGenerator>(within closedRange: ClosedRange<Self>, using randomGenerator: inout R) -> Self {
        let distance = closedRange.lowerBound.distance(to: closedRange.upperBound)
        return closedRange.lowerBound.advanced(by: .random(through: distance, using: &randomGenerator))
    }

}

extension String.UTF16Index: RandomWithinRange, RandomWithinClosedRange {
}

extension UnsafePointer: RandomWithinRange, RandomWithinClosedRange {
}

extension UnsafeMutablePointer: RandomWithinRange, RandomWithinClosedRange {
}

extension UnsafeRawPointer: RandomWithinRange, RandomWithinClosedRange {
}

extension UnsafeMutableRawPointer: RandomWithinRange, RandomWithinClosedRange {
}
