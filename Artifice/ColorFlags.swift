//
//  ColorFlags.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Foundation

class ColorFlags: NSObject, NSCoding {
  
  enum Keys: String {
    case colorless
    case allColors
    case white
    case blue
    case black
    case red
    case green
  }
  
  var colorless: Bool
  var allColors: Bool
  var white: Bool
  var blue: Bool
  var black: Bool
  var red: Bool
  var green: Bool
  
  override init() {
    colorless = false
    allColors = false
    white = false
    blue = false
    black = false
    red = false
    green = false
  }
  
  required init?(coder aDecoder: NSCoder) {
    colorless = aDecoder.decodeBool(forKey: Keys.colorless.rawValue)
    allColors = aDecoder.decodeBool(forKey: Keys.allColors.rawValue)
    white = aDecoder.decodeBool(forKey: Keys.white.rawValue)
    blue = aDecoder.decodeBool(forKey: Keys.blue.rawValue)
    black = aDecoder.decodeBool(forKey: Keys.black.rawValue)
    red = aDecoder.decodeBool(forKey: Keys.red.rawValue)
    green = aDecoder.decodeBool(forKey: Keys.green.rawValue)
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(colorless, forKey: Keys.colorless.rawValue)
    aCoder.encode(allColors, forKey: Keys.allColors.rawValue)
    aCoder.encode(white, forKey: Keys.white.rawValue)
    aCoder.encode(blue, forKey: Keys.blue.rawValue)
    aCoder.encode(black, forKey: Keys.black.rawValue)
    aCoder.encode(red, forKey: Keys.red.rawValue)
    aCoder.encode(green, forKey: Keys.green.rawValue)
  }
}
