//
//  ManaSymbol.swift
//  Project Urza
//
//  Created by Kyle Cardoza on 2016-06-25.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

// Instances of this class represent a single mana symbol, of any type
// supported by the current MTG Comprehensive Rules. It includes the
// ability to fetch an NSImage of the symbol for use in user interface
// code.

import Cocoa

final class ManaSymbol: NSObject, NSCoding {
  
  var type: ManaType
  
  init(type: ManaType) {
    self.type = type
  }
  
  enum ManaType {
    case colorless
    case normal(ManaColor)
    case phyrexian(ManaColor)
    case snow
    case generic(Int)
    case hybridColorless(ManaColor)
    case hybrid(ManaColor, ManaColor)
    case variable
    case variableY
    case tap
    case untap
    case energyCounter
  }
  
  enum ManaColor: String {
    case white
    case blue
    case black
    case red
    case green
  }
  
  convenience init?(string: String) {
    self.init(type: .colorless)
    if isColorless(string) {
      self.type = .colorless
    } else if isNormal(string) {
      switch string {
      case "W":
        self.type = .normal(.white)
      case "U":
        self.type = .normal(.blue)
      case "B":
        self.type = .normal(.black)
      case "R":
        self.type = .normal(.red)
      case "G":
        self.type = .normal(.green)
      default:
        return nil
      }
    } else if isPhyrexian(string) {
      switch string {
      case "W/P":
        self.type = .phyrexian(.white)
      case "U/P":
        self.type = .phyrexian(.blue)
      case "B/P":
        self.type = .phyrexian(.black)
      case "R/P":
        self.type = .phyrexian(.red)
      case "G/P":
        self.type = .phyrexian(.green)
      default:
        return nil
      }
    } else if isSnow(string) {
      self.type = .snow
    } else if isGeneric(string) {
      guard let val = Int(string) else {
        return nil
      }
      self.type = .generic(val)
    } else if isHybridColorless(string) {
      switch string {
      case "2/W":
        self.type = .hybridColorless(.white)
      case "2/U":
        self.type = .hybridColorless(.blue)
      case "2/B":
        self.type = .hybridColorless(.black)
      case "2/R":
        self.type = .hybridColorless(.red)
      case "2/G":
        self.type = .hybridColorless(.green)
      default:
        return nil
      }
    } else if isHybrid(string) {
      let components = string.components(separatedBy: "/")
      
      switch (components[0], components[1]) {
      case ("W", "U"):
        self.type = .hybrid(.white, .blue)
      case ("W", "B"):
        self.type = .hybrid(.white, .black)
      case ("U", "B"):
        self.type = .hybrid(.blue, .black)
      case ("U", "R"):
        self.type = .hybrid(.blue, .red)
      case ("B", "R"):
        self.type = .hybrid(.black, .red)
      case ("B", "G"):
        self.type = .hybrid(.black, .green)
      case ("R", "G"):
        self.type = .hybrid(.red, .green)
      case ("R", "W"):
        self.type = .hybrid(.red, .white)
      case ("G", "W"):
        self.type = .hybrid(.green, .white)
      case ("G", "U"):
        self.type = .hybrid(.green, .blue)
      default:
        return nil
      }
    } else if isVariable(string) {
      self.type = .variable
    } else if isTap(string) {
      self.type = .tap
    } else if isEnergyCounter(string) {
      self.type = .energyCounter
    } else {
      return nil
    }
  }
  
  func isHybrid(_ string: String) -> Bool {
    guard string.characters.count == 3,
          string.contains("/") else {
      return false
    }
    let components = string.components(separatedBy: "/")
    
    switch (components[0], components[1]) {
    case ("W", "U"):
      return true
    case ("W", "B"):
      return true
    case ("U", "B"):
      return true
    case ("U", "R"):
      return true
    case ("B", "R"):
      return true
    case ("B", "G"):
      return true
    case ("R", "G"):
      return true
    case ("R", "W"):
      return true
    case ("G", "W"):
      return true
    case ("G", "U"):
      return true
    default:
      return false
    }
  }
  
  func isHybridColorless(_ string: String) -> Bool {
    guard string.characters.count == 3,
          string.contains("/") else {
      return false
    }
    let components = string.components(separatedBy: "/")
    
    switch (components[0], components[1]) {
    case ("2", "W"):
      return true
    case ("2", "U"):
      return true
    case ("2", "B"):
      return true
    case ("2", "R"):
      return true
    case ("2", "G"):
      return true
    default:
      return false
    }
  }
  
  func isGeneric(_ string: String) -> Bool {
    guard string.characters.count <= 2,
      let val = Int(string) else {
        return false
    }
    switch val {
    case 0...20:
      return true
    default:
      return false
    }
  }
  
  func isVariable(_ string: String) -> Bool {
    return string == "X"
  }
  
  func isSnow(_ string: String) -> Bool {
    return string == "S"
  }
  
  func isNormal(_ string: String) -> Bool {
    switch string {
    case "W":
      return true
    case "U":
      return true
    case "B":
      return true
    case "R":
      return true
    case "G":
      return true
    default:
      return false
    }
  }
  
  func isTap(_ string: String) -> Bool {
    return string == "T"
  }
  
  func isUntap(_ string: String) -> Bool {
    return string == "Q"
  }
  
  func isColorless(_ string: String) -> Bool {
    return string == "C"
  }
  
  func isPhyrexian(_ string: String) -> Bool {
    switch string {
    case "W/P":
      return true
    case "U/P":
      return true
    case "B/P":
      return true
    case "R/P":
      return true
    case "G/P":
      return true
    default:
      return false
    }
  }
  
  func isEnergyCounter(_ string: String) -> Bool {
    return string == "E"
  }
  
  enum ManaError: Error {
    case invalidGenericManaQuantity
    case invalidHybridColor
  }
  
  // The NSImages used here are implicitly unwrapped optionals because
  // the image files are in the app's asset catalog, and thus, if they
  // can't be loaded, it means the app bundle is somehow corrupt, and
  // bailing out is the right thing to do.
  
  func image() throws -> NSImage! {
    switch self.type {
    case .colorless:
      return NSImage(named: NSImage.Name(rawValue: "Colorless Mana"))
      
    case .normal(let color):
      switch color {
      case .white:
        return NSImage(named: NSImage.Name(rawValue: "White Mana"))
        
      case .blue:
        return NSImage(named: NSImage.Name(rawValue: "Blue Mana"))
        
      case .black:
        return NSImage(named: NSImage.Name(rawValue: "Black Mana"))
        
      case .red:
        return NSImage(named: NSImage.Name(rawValue: "Red Mana"))
        
      case .green:
        return NSImage(named: NSImage.Name(rawValue: "Green Mana"))
      }
      
    case .generic(let quantity):
      switch quantity {
      case 0...20:
        return NSImage(named: NSImage.Name(rawValue: "\(quantity) Generic Mana"))
        
      default:
        throw ManaSymbol.ManaError.invalidGenericManaQuantity
      }
      
    case .phyrexian(let color):
      switch color {
      case .white:
        return NSImage(named: NSImage.Name(rawValue: "Phyrexian White Mana"))
        
      case .blue:
        return NSImage(named: NSImage.Name(rawValue: "Phyrexian Blue Mana"))
        
      case .black:
        return NSImage(named: NSImage.Name(rawValue: "Phyrexian Black Mana"))
        
      case .red:
        return NSImage(named: NSImage.Name(rawValue: "Phyrexian Red Mana"))
        
      case .green:
        return NSImage(named: NSImage.Name(rawValue: "Phyrexian Green Mana"))
      }
      
    case .snow:
      return NSImage(named: NSImage.Name(rawValue: "Snow Mana"))
      
    case .hybridColorless(let color):
      switch color {
      case .white:
        return NSImage(named: NSImage.Name(rawValue: "Hybrid White Colorless Mana"))
        
      case .blue:
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Blue Colorless Mana"))
        
      case .black:
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Black Colorless Mana"))
        
      case .red:
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Red Colorless Mana"))
        
      case .green:
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Green Colorless Mana"))
      }
      
    case .variable:
      return NSImage(named: NSImage.Name(rawValue: "Variable Mana"))
      
    case .variableY:
      return NSImage(named: NSImage.Name(rawValue: "Variable Mana Y"))
      
    case .hybrid(let color, let hybridColor):
      switch (color, hybridColor) {
      case (.white, .blue):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid White Blue Mana"))
        
      case (.white, .black):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid White Black Mana"))
        
      case (.blue, .black):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Blue Black Mana"))
        
      case (.blue, .red):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Blue Red Mana"))
        
      case (.black, .red):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Black Red Mana"))
        
      case (.black, .green):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Black Green Mana"))
        
      case (.red, .green):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Red Green Mana"))
        
      case (.red, .white):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Red White Mana"))
        
      case (.green, .white):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Green White Mana"))
        
      case (.green, .blue):
        return NSImage(named: NSImage.Name(rawValue: "Hybrid Green Blue Mana"))
        
      default:
        throw ManaSymbol.ManaError.invalidHybridColor
      }
    case .tap:
      return NSImage(named: NSImage.Name(rawValue: "Tap Symbol"))
    case .untap:
      return NSImage(named: NSImage.Name(rawValue: "Untap Symbol"))
    case .energyCounter:
      return NSImage(named: NSImage.Name(rawValue: "Energy Counter"))
    }
  }
  
  convenience init?(coder aDecoder: NSCoder) {
    self.init(type: .colorless)
	guard let type = aDecoder.decodeObject(of: NSString.self, forKey: "type") as String? else {
      return nil
    }
    switch type {
    case "colorless":
      self.type = .colorless
      
    case "normal":
      guard
		let rawValue = aDecoder.decodeObject(of: NSString.self, forKey: "color") as String?,
        let color = ManaColor(rawValue: rawValue) else {
        return nil
      }
      self.type = .normal(color)
      
    case "phyrexian":
      guard
		let rawValue = aDecoder.decodeObject(of: NSString.self, forKey: "color") as String?,
        let color = ManaColor(rawValue: rawValue) else {
          return nil
      }
      self.type = .phyrexian(color)
      
    case "snow":
      self.type = .snow
      
    case "generic":
      guard let quantity = aDecoder.decodeObject(of: NSNumber.self, forKey: "quantity") as? Int else {
          return nil
      }
      self.type = .generic(quantity)
      
    case "hybridColorless":
      guard
		let rawValue = aDecoder.decodeObject(of: NSString.self, forKey: "color") as String?,
        let color = ManaColor(rawValue: rawValue) else {
          return nil
      }
      self.type = .hybridColorless(color)
      
    case "hybrid":
      guard
		let rawColor = aDecoder.decodeObject(of: NSString.self, forKey: "color") as String?,
        let color = ManaColor(rawValue: rawColor),
		let rawHybridColor = aDecoder.decodeObject(of: NSString.self, forKey: "color") as String?,
        let hybridColor = ManaColor(rawValue: rawHybridColor) else {
          return nil
      }
      self.type = .hybrid(color, hybridColor)
      
    case "variable":
      self.type = .variable
      
    case "variableY":
      self.type = .variable
      
    case "tap":
      self.type = .tap
      
    case "untap":
      self.type = .untap
      
    default:
      return nil
    }
  }
  
  func encode(with aCoder: NSCoder) {
    switch type {
    case .colorless:
      aCoder.encode("colorless", forKey: "type")
      
    case .normal(let color):
      aCoder.encode("normal", forKey: "type")
      aCoder.encode(color.rawValue, forKey: "color")
      
    case .phyrexian(let color):
      aCoder.encode("phyrexian", forKey: "type")
      aCoder.encode(color.rawValue, forKey: "color")
      
    case .snow:
      aCoder.encode("snow", forKey: "type")
      
    case .generic(let quantity):
      aCoder.encode("generic", forKey: "type")
      aCoder.encode(quantity, forKey: "quantity")
      
    case .hybridColorless(let color):
      aCoder.encode("hybridColorless", forKey: "type")
      aCoder.encode(color.rawValue, forKey: "color")
      
    case .hybrid(let color, let hybridColor):
      aCoder.encode("hybrid", forKey: "type")
      aCoder.encode(color.rawValue, forKey: "color")
      aCoder.encode(hybridColor.rawValue, forKey: "hybridColor")
      
    case .variable:
      aCoder.encode("variable", forKey: "type")
      
    case .variableY:
      aCoder.encode("variableY", forKey: "type")
      
    case .tap:
      aCoder.encode("tap", forKey: "type")
      
    case .untap:
      aCoder.encode("untap", forKey: "type")
      
    case .energyCounter:
      aCoder.encode("energyCounter", forKey: "type")
    }
  }
    
  
  
  func attributedString(size: CGFloat, align: NSTextAlignment, enableShadow shadow: Bool = false) -> NSMutableAttributedString {
    
    let size = size * 0.9
    
    var image: NSImage
    
    let attachment = NSTextAttachment()
    
    let style = NSMutableParagraphStyle()
    style.maximumLineHeight = size * 1.15
    style.lineSpacing = 1
    style.paragraphSpacingBefore = 1
    style.paragraphSpacing = 0.3 * size
    style.alignment = align
    
    switch self.type {
    case .colorless where shadow == true:
      image = Template.Mana.Colorless.shadow
      
    case .colorless:
      image = Template.Mana.Colorless.noShadow
      
    case .normal(let color) where shadow == true:
      switch color {
      case .white:
        image = Template.Mana.White.shadow
        
      case .blue:
        image = Template.Mana.Blue.shadow
        
      case .black:
        image = Template.Mana.Black.shadow
        
      case .red:
        image = Template.Mana.Red.shadow
        
      case .green:
        image = Template.Mana.Green.shadow
      }
      
    case .normal(let color):
      switch color {
      case .white:
        image = Template.Mana.White.noShadow
        
      case .blue:
        image = Template.Mana.Blue.noShadow
        
      case .black:
        image = Template.Mana.Black.noShadow
        
      case .red:
        image = Template.Mana.Red.noShadow
        
      case .green:
        image = Template.Mana.Green.noShadow
      }
      
    case .generic(let quantity) where shadow == true:
      switch quantity {
      case 1:
        image = Template.Mana.Generic.One.shadow
      case 2:
        image = Template.Mana.Generic.Two.shadow
      case 3:
        image = Template.Mana.Generic.Three.shadow
      case 4:
        image = Template.Mana.Generic.Four.shadow
      case 5:
        image = Template.Mana.Generic.Five.shadow
      case 6:
        image = Template.Mana.Generic.Six.shadow
      case 7:
        image = Template.Mana.Generic.Seven.shadow
      case 8:
        image = Template.Mana.Generic.Eight.shadow
      case 9:
        image = Template.Mana.Generic.Nine.shadow
      case 10:
        image = Template.Mana.Generic.Ten.shadow
      case 11:
        image = Template.Mana.Generic.Eleven.shadow
      case 12:
        image = Template.Mana.Generic.Twelve.shadow
      case 13:
        image = Template.Mana.Generic.Thirteen.shadow
      case 14:
        image = Template.Mana.Generic.Fourteen.shadow
      case 15:
        image = Template.Mana.Generic.Fifteen.shadow
      case 16:
        image = Template.Mana.Generic.Sixteen.shadow
      case 17:
        image = Template.Mana.Generic.Seventeen.shadow
      case 18:
        image = Template.Mana.Generic.Eighteen.shadow
      case 19:
        image = Template.Mana.Generic.Nineteen.shadow
      case 20:
        image = Template.Mana.Generic.Twenty.shadow
      default:
        image = Template.Mana.Generic.Zero.shadow
      }
      
    case .generic(let quantity):
      switch quantity {
      case 1:
        image = Template.Mana.Generic.One.noShadow
      case 2:
        image = Template.Mana.Generic.Two.noShadow
      case 3:
        image = Template.Mana.Generic.Three.noShadow
      case 4:
        image = Template.Mana.Generic.Four.noShadow
      case 5:
        image = Template.Mana.Generic.Five.noShadow
      case 6:
        image = Template.Mana.Generic.Six.noShadow
      case 7:
        image = Template.Mana.Generic.Seven.noShadow
      case 8:
        image = Template.Mana.Generic.Eight.noShadow
      case 9:
        image = Template.Mana.Generic.Nine.noShadow
      case 10:
        image = Template.Mana.Generic.Ten.noShadow
      case 11:
        image = Template.Mana.Generic.Eleven.noShadow
      case 12:
        image = Template.Mana.Generic.Twelve.noShadow
      case 13:
        image = Template.Mana.Generic.Thirteen.noShadow
      case 14:
        image = Template.Mana.Generic.Fourteen.noShadow
      case 15:
        image = Template.Mana.Generic.Fifteen.noShadow
      case 16:
        image = Template.Mana.Generic.Sixteen.noShadow
      case 17:
        image = Template.Mana.Generic.Seventeen.noShadow
      case 18:
        image = Template.Mana.Generic.Eighteen.noShadow
      case 19:
        image = Template.Mana.Generic.Nineteen.noShadow
      case 20:
        image = Template.Mana.Generic.Twenty.noShadow
      default:
        image = Template.Mana.Generic.Zero.noShadow
      }
      
    case .phyrexian(let color) where shadow == true:
      switch color {
      case .white:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian White Mana"))!.copy() as! NSImage
        
      case .blue:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian Blue Mana"))!.copy() as! NSImage
        
      case .black:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian Black Mana"))!.copy() as! NSImage
        
      case .red:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian Red Mana"))!.copy() as! NSImage
        
      case .green:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian Green Mana"))!.copy() as! NSImage
      }
      
    case .phyrexian(let color):
      switch color {
      case .white:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian White Mana (No Shadow)"))!.copy() as! NSImage
        
      case .blue:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian Blue Mana (No Shadow)"))!.copy() as! NSImage
        
      case .black:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian Black Mana (No Shadow)"))!.copy() as! NSImage
        
      case .red:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian Red Mana (No Shadow)"))!.copy() as! NSImage
        
      case .green:
        image = NSImage(named: NSImage.Name(rawValue: "Phyrexian Green Mana (No Shadow)"))!.copy() as! NSImage
      }
      
    case .snow where shadow == true:
      image = NSImage(named: NSImage.Name(rawValue: "Snow Mana"))!.copy() as! NSImage
      
    case .snow:
      image = NSImage(named: NSImage.Name(rawValue: "Snow Mana (No Shadow)"))!.copy() as! NSImage
      
    case .hybridColorless(let color) where shadow == true:
      switch color {
      case .white:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid White Colorless Mana"))!.copy() as! NSImage
        
      case .blue:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Blue Colorless Mana"))!.copy() as! NSImage
        
      case .black:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Black Colorless Mana"))!.copy() as! NSImage
        
      case .red:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Red Colorless Mana"))!.copy() as! NSImage
        
      case .green:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Green Colorless Mana"))!.copy() as! NSImage
      }
      
    case .hybridColorless(let color):
      switch color {
      case .white:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid White Colorless Mana (No Shadow)"))!.copy() as! NSImage
        
      case .blue:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Blue Colorless Mana (No Shadow)"))!.copy() as! NSImage
        
      case .black:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Black Colorless Mana (No Shadow)"))!.copy() as! NSImage
        
      case .red:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Red Colorless Mana (No Shadow)"))!.copy() as! NSImage
        
      case .green:
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Green Colorless Mana (No Shadow)"))!.copy() as! NSImage
      }
      
    case .variable where shadow == true:
      image = NSImage(named: NSImage.Name(rawValue: "Variable Mana"))!.copy() as! NSImage
      
    case .variableY where shadow == true:
      image = NSImage(named: NSImage.Name(rawValue: "Variable Mana Y"))!.copy() as! NSImage
      
    case .variable:
      image = NSImage(named: NSImage.Name(rawValue: "Variable Mana (No Shadow)"))!.copy() as! NSImage
      
    case .variableY:
      image = NSImage(named: NSImage.Name(rawValue: "Variable Mana Y (No Shadow)"))!.copy() as! NSImage
      
    case .hybrid(let color, let hybridColor) where shadow == true:
      switch (color, hybridColor) {
      case (.white, .blue):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid White Blue Mana"))!.copy() as! NSImage
        
      case (.white, .black):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid White Black Mana"))!.copy() as! NSImage
        
      case (.blue, .black):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Blue Black Mana"))!.copy() as! NSImage
        
      case (.blue, .red):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Blue Red Mana"))!.copy() as! NSImage
        
      case (.black, .red):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Black Red Mana"))!.copy() as! NSImage
        
      case (.black, .green):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Black Green Mana"))!.copy() as! NSImage
        
      case (.red, .green):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Red Green Mana"))!.copy() as! NSImage
        
      case (.red, .white):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Red White Mana"))!.copy() as! NSImage
        
      case (.green, .white):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Green White Mana"))!.copy() as! NSImage
        
      case (.green, .blue):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Green Blue Mana"))!.copy() as! NSImage
        
      default:
        image = NSImage(named: NSImage.Name(rawValue: "0 Generic Mana"))!.copy() as! NSImage
      }
      
    case .hybrid(let color, let hybridColor):
      switch (color, hybridColor) {
      case (.white, .blue):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid White Blue Mana (No Shadow)"))!.copy() as! NSImage
        
      case (.white, .black):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid White Black Mana (No Shadow)"))!.copy() as! NSImage
        
      case (.blue, .black):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Blue Black Mana (No Shadow)"))!.copy() as! NSImage
        
      case (.blue, .red):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Blue Red Mana (No Shadow)"))!.copy() as! NSImage
        
      case (.black, .red):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Black Red Mana (No Shadow)"))!.copy() as! NSImage
        
      case (.black, .green):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Black Green Mana (No Shadow)"))!.copy() as! NSImage
        
      case (.red, .green):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Red Green Mana (No Shadow)"))!.copy() as! NSImage
        
      case (.red, .white):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Red White Mana (No Shadow)"))!.copy() as! NSImage
        
      case (.green, .white):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Green White Mana (No Shadow)"))!.copy() as! NSImage
        
      case (.green, .blue):
        image = NSImage(named: NSImage.Name(rawValue: "Hybrid Green Blue Mana (No Shadow)"))!.copy() as! NSImage
        
      default:
        image = NSImage(named: NSImage.Name(rawValue: "0 Generic Mana (No Shadow)"))!.copy() as! NSImage
      }
      
    case .tap:
      image = NSImage(named: NSImage.Name(rawValue: "Tap Symbol"))!.copy() as! NSImage
      
    case .untap:
      image = NSImage(named: NSImage.Name(rawValue: "Untap Symbol"))!.copy() as! NSImage
      
    case .energyCounter:
      image = NSImage(named: NSImage.Name(rawValue: "Energy Counter"))!.copy() as! NSImage
    }
    
    image.size = NSSize(width: size, height: size)
    
    (attachment.attachmentCell as! NSCell).image = image
    
    let attributes = [
      NSAttributedStringKey.paragraphStyle: style,
      NSAttributedStringKey.attachment: attachment
    ]
    
    let char = Character(UnicodeScalar(NSAttachmentCharacter)!)
    
    return NSMutableAttributedString(string: "\(char)", attributes: attributes)

  }
  
  var cmc: Int {
    switch self.type {
    case .colorless, .normal(_), .phyrexian(_), .snow, .hybrid(_, _), .hybridColorless(_):
      return 1
    case .generic(let value):
      return value
    default:
      return 0
    }
  }
}



extension String {
  func tokenizeMana() -> [String] {
    return self.components(separatedBy: CharacterSet(charactersIn: "{}"))
      .filter { $0 != "" }
  }
}
