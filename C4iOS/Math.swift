// Copyright © 2014 C4
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions: The above copyright
// notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import CoreGraphics

protocol NumericType : Comparable, Equatable {
public protocol NumericType : Comparable, Equatable {
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
    func *(lhs: Self, rhs: Self) -> Self
    func /(lhs: Self, rhs: Self) -> Self
    func %(lhs: Self, rhs: Self) -> Self
    init(_ v: Double)
    init(_ v: Float)
    init(_ v: Int)
    init(_ v: Int8)
    init(_ v: Int16)
    init(_ v: Int32)
    init(_ v: Int64)
    init(_ v: UInt)
    init(_ v: UInt8)
    init(_ v: UInt16)
    init(_ v: UInt32)
    init(_ v: UInt64)

    func doubleValue() -> Double;
}

extension Double : NumericType {
    func doubleValue() -> Double { return self }
    public func doubleValue() -> Double { return self }
}
extension Float  : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension Int    : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension Int8   : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension Int16  : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension Int32  : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension Int64  : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension UInt   : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension UInt8  : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension UInt16 : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension UInt32 : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension UInt64 : NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}
extension CGFloat: NumericType {
    func doubleValue() -> Double { return Double(self) }
    public func doubleValue() -> Double { return Double(self) }
}

/**
Clamp a value to the range [min, max].

:param: val The value
:param: min The lower bound
:param: max The upper bound

:returns: The clamped value
*/
func clamp<T : Comparable>(val: T, min: T, max: T) -> T {
    assert(min < max, "min has to be less than or equal to max")
public func clamp<T : Comparable>(val: T, min: T, max: T) -> T {
    assert(min < max, "min has to be less than max")
    if val < min { return min }
    if val > max { return max }
    return val
}

/**
Linear interpolation. For any two values a and b return a linear interpolation with parameter `param`.

:param: a     first value
:param: b     second value
:param: param parameter between 0 and 1

:returns: The interpolated value
*/
func lerp<T : NumericType>(a: T, b: T, param: Double) -> T {
public func lerp<T : NumericType>(a: T, b: T, param: Double) -> T {
    assert(a < b, "a must be less than b")
    return a + T((b - a).doubleValue() * param)
}

/**
Linear mapping. Maps a value in the source range [min, max] to a value in the target range [toMin, toMax] using linear interpolation.

:param: val   Source value
:param: min   Source range lower bound
:param: max   Source range upper bound
:param: toMin Target range lower bound
:param: toMax Target range upper bound

:returns: The mapped value.
*/
func map<T: NumericType>(val: T, min: T, max: T, toMin: T, toMax: T) -> T {
public func map<T: NumericType>(val: T, min: T, max: T, toMin: T, toMax: T) -> T {
    assert(min < max, "min has to be less than max")
    var param = val.doubleValue() / (max - min).doubleValue() - min.doubleValue()
    return lerp(toMin, toMax, param)
}

func max<T : Comparable>(a: T, b: T) -> T {
public func max<T : Comparable>(a: T, b: T) -> T {
    return a > b ? a : b
}

func min<T : Comparable>(a: T, b: T) -> T {
public func min<T : Comparable>(a: T, b: T) -> T {
    return a > b ? a : b
}

/**
Return a random integer below `below`

:param: below The upper bound

:returns: A random value smaller than `below`
*/
func random(#below: Int) -> Int {
public func random(#below: Int) -> Int {
    return Int(arc4random_uniform(UInt32(below)))
}

/**
Return a random integer greater than or equal to min and less than max.

:param: min The lower bound
:param: max The upper bound

:returns: A random value greater than or equal to min and less than max.
*/
func random(min: Int, max: Int) -> Int {
public func random(min: Int, max: Int) -> Int {
    assert(min < max, "min must be less than max")
    return min + random(below: max - min)
}

func radToDeg<T: NumericType>(val: T) -> T {
    if let intVal = val as? Int {
        var dblVal = Double(intVal)
        return T(dblVal / M_PI * 180.0)
    }
    var norm = val / T(M_PI)
    return norm * T(180.0)
public func radToDeg<T: NumericType>(val: T) -> T {
}

func degToRad<T: NumericType>(val: T) -> T {
    var norm = val / T(180.0)
    return norm * T(M_PI)
public func degToRad<T: NumericType>(val: T) -> T {
}

func rgbToFloat<T: NumericType>(val: T) -> T {
    return val / T(255.0)
public func rgbToDouble<T: NumericType>(val: T) -> Double {
}

func rgbFromFloat<T: NumericType>(val: T) -> T {
    return val * T(255.0)
public func rgbFromDouble<T: NumericType>(val: T) -> Double {
}