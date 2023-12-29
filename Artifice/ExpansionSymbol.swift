//
//  ExpansionSymbol.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class ExpansionSymbol: NSObject, NSCoding {
  
  enum Keys: String {
    case common
    case uncommon
    case rare
    case mythic
    case special
    case bonus
  }
  
  var common: NSImage? = NSImage(named: NSImage.Name(rawValue: "Default Common Expansion Symbol"))
  var uncommon: NSImage? = NSImage(named: NSImage.Name(rawValue: "Default Uncommon Expansion Symbol"))
  var rare: NSImage? = NSImage(named: NSImage.Name(rawValue: "Default Rare Expansion Symbol"))
  var mythic: NSImage? = NSImage(named: NSImage.Name(rawValue: "Default Mythic Rare Expansion Symbol"))
  var special: NSImage? = NSImage(named: NSImage.Name(rawValue: "Default Special Rarity Expansion Symbol"))
  var bonus: NSImage? = NSImage(named: NSImage.Name(rawValue: "Default Special Rarity Expansion Symbol"))
  
  override init() {
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    common = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.common.rawValue) ?? NSImage(named: NSImage.Name(rawValue: "Default Common Expansion Symbol"))
    uncommon = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.uncommon.rawValue) ?? NSImage(named: NSImage.Name(rawValue: "Default Uncommon Expansion Symbol"))
    
    rare = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.rare.rawValue) ?? NSImage(named: NSImage.Name(rawValue: "Default Rare Expansion Symbol"))
    
    mythic = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.mythic.rawValue) ?? NSImage(named: NSImage.Name(rawValue: "Default Mythic Rare Expansion Symbol"))
    
    special = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.special.rawValue) ?? NSImage(named: NSImage.Name(rawValue: "Default Special Rarity Expansion Symbol"))
    
    bonus = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.bonus.rawValue) ?? NSImage(named: NSImage.Name(rawValue: "Default Special Rarity Expansion Symbol"))
    
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(common, forKey: Keys.common.rawValue)
    aCoder.encode(uncommon, forKey: Keys.uncommon.rawValue)
    aCoder.encode(rare, forKey: Keys.rare.rawValue)
    aCoder.encode(mythic, forKey: Keys.mythic.rawValue)
    aCoder.encode(special, forKey: Keys.special.rawValue)
    aCoder.encode(bonus, forKey: Keys.bonus.rawValue)
  }
}
