//  SwiftColors.swift
//
// Copyright (c) 2014 Doan Truong Thi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if os(iOS)
  import UIKit
  typealias SWColor = UIColor
#else
  import Cocoa
  typealias SWColor = NSColor
#endif

extension SWColor {
  /**
    Create non-autoreleased color with in the given hex string
    Alpha will be set as 1 by default
    
    :param:   hexString
    :returns: color with the given hex string
  */
  convenience init(hexString: String) {
    self.init(hexString: hexString, alpha: 1.0)
  }

  /**
    Create non-autoreleased color with in the given hex string and alpha
    
    :param:   hexString
    :param:   alpha
    :returns: color with the given hex string and alpha
  */
  convenience init(hexString: String, alpha: Float) {
    var hex = hexString

    // Check for hash and remove the hash
    if hex.hasPrefix("#") {
      hex = hex.substringFromIndex(advance(hex.startIndex, 1))
    }
    
    // Check for string length
    assert(countElements(hex) == 6 || countElements(hex) == 3)
    
    // Deal with 3 character Hex strings
    if countElements(hex) == 3 {
      var redHex   = hex.substringToIndex(advance(hex.startIndex, 1))
      var greenHex = hex.substringWithRange(Range<String.Index>(start: advance(hex.startIndex, 1), end: advance(hex.startIndex, 2)))
      var blueHex  = hex.substringFromIndex(advance(hex.startIndex, 2))
      
      hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
    }

    let redHex = hex.substringToIndex(advance(hex.startIndex, 2))
    let greenHex = hex.substringWithRange(Range<String.Index>(start: advance(hex.startIndex, 2), end: advance(hex.startIndex, 4)))
    let blueHex = hex.substringWithRange(Range<String.Index>(start: advance(hex.startIndex, 4), end: advance(hex.startIndex, 6)))
    
    var redInt:   CUnsignedInt = 0
    var greenInt: CUnsignedInt = 0
    var blueInt:  CUnsignedInt = 0

    NSScanner(string: redHex).scanHexInt(&redInt)
    NSScanner(string: greenHex).scanHexInt(&greenInt)
    NSScanner(string: blueHex).scanHexInt(&blueInt)

    self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
  }

  /**
    Create non-autoreleased color with in the given hex value
    Alpha will be set as 1 by default
    
    :param:   hex
    :returns: color with the given hex value
  */
  convenience init(hex: Int) {
    self.init(hex: hex, alpha: 1.0)
  }
  
  /**
    Create non-autoreleased color with in the given hex value and alpha
    
    :param:   hex
    :param:   alpha
    :returns: color with the given hex value and alpha
  */
  convenience init(hex: Int, alpha: Float) {
    var hexString = NSString(format: "%2X", hex)
    self.init(hexString: hexString, alpha: alpha)
  }
}
