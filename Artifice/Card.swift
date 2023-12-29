//
//  Card.swift
//  Project Urza
//
//  Created by Kyle Cardoza on 2016-07-24.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class Card: NSObject, NSCoding {

  enum Keys: String {
    case artData
    case name
    case manaCost
    case cardType
    case rulesText
    case flavourText
    case power
    case toughness
    case artistName
    case setCode
    case rarityCode
    case promoText
    case centerRulesText
    case colorFlags
    case borderColor
    case dateOverlay
    case colorIndicator
    case expansionSymbol
    case template
    case enableCollectorNumber
    case notes
    case useManaSymbol
    case baseFontSize
    case planeswalkerAbility1
    case planeswalkerAbility2
    case planeswalkerAbility3
    case planeswalkerAbility4
    case planeswalkerAbility1Cost
    case planeswalkerAbility2Cost
    case planeswalkerAbility3Cost
    case planeswalkerAbility4Cost
    case planeswalkerStartingLoyalty
    case watermark
    case watermarkOpacity
    case etbTapped
    case childCard
    case isDoubleSided
    case artZoomFactor
    case artOffsetX
    case artOffsetY
    case artRotation
    case processedArtCache
  }
  
  
  var name: String
  var manaCost: String
  var cardType: String
  var rulesText: String
  var flavorText: String
  var power: String
  var toughness: String
  var artistName: String
  var rarityCode: String
  var promoText: String
  var centerRulesText: Bool
  var colorFlags: ColorFlags
  var borderColor: BorderColor
  var dateOverlay: String
  var colorIndicator: Bool
  var expansionSymbol: NSImage?
  var notes: String
  var number: String
  var useManaSymbol: Bool
  var baseFontSize: Double
  var planeswalkerAbility1: String
  var planeswalkerAbility2: String
  var planeswalkerAbility3: String
  var planeswalkerAbility4: String
  var planeswalkerAbility1Cost: String
  var planeswalkerAbility2Cost: String
  var planeswalkerAbility3Cost: String
  var planeswalkerAbility4Cost: String
  var planeswalkerStartingLoyalty: String
  var watermark: NSImage?
  var watermarkOpacity: Double
  var etbTapped: Bool
  var childCard: Card?
  var isDoubleSided: Bool
  
  
  var template: CardTemplate {
    willSet {
      processedArtCache = nil
    }
  }
  
  var artZoomFactor: Double {
    willSet {
      processedArtCache = nil
    }
  }
  
  var artOffsetX: Double {
    willSet {
      processedArtCache = nil
    }
  }
  
  var artOffsetY: Double {
    willSet {
      processedArtCache = nil
    }
  }
  
  var artRotation: Float {
    willSet {
      processedArtCache = nil
    }
  }
  
  var artData: NSImage? {
    willSet {
      processedArtCache = nil
    }
  }
  
  fileprivate var processedArtCache: NSImage?
  
  var processedArt: NSImage? {
    get {
      if processedArtCache != nil {
        return processedArtCache
      } else {
        processedArtCache = artData?.rotated(0.0 - artRotation).zoomed(by: artZoomFactor, aspectRatio: Double(template.aspectRatio), offsetX: artOffsetX, offsetY: artOffsetY)
        return processedArtCache
      }
    }
  }
  
  override init() {
    name = ""
    manaCost = ""
    cardType = ""
    rulesText = ""
    flavorText = ""
    power = ""
    toughness = ""
    artistName = ""
    rarityCode = "C"
    promoText = ""
    centerRulesText = false
    colorFlags = ColorFlags()
    borderColor = .black
    dateOverlay = ""
    colorIndicator = false
    expansionSymbol = nil
    template = .standard
    notes = ""
    number = ""
    useManaSymbol = false
    baseFontSize = 20.75
    planeswalkerAbility1 = ""
    planeswalkerAbility2 = ""
    planeswalkerAbility3 = ""
    planeswalkerAbility4 = ""
    planeswalkerAbility1Cost = ""
    planeswalkerAbility2Cost = ""
    planeswalkerAbility3Cost = ""
    planeswalkerAbility4Cost = ""
    planeswalkerStartingLoyalty = ""
    watermarkOpacity = 0.5
    etbTapped = false
    isDoubleSided = false
    artZoomFactor = 1.0
    artOffsetX = 0.0
    artOffsetY = 0.0
    artRotation = 0.0
  }
  
  required init?(coder aDecoder: NSCoder) {
    expansionSymbol = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.expansionSymbol.rawValue)
    
    artData = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.artData.rawValue)
    
	name = aDecoder.decodeObject(of: NSString.self, forKey: Keys.name.rawValue) as String? ?? ""
    
	manaCost = aDecoder.decodeObject(of: NSString.self, forKey: Keys.manaCost.rawValue) as String? ?? ""
    
	cardType = aDecoder.decodeObject(of: NSString.self, forKey: Keys.cardType.rawValue) as String? ?? ""
    
	rulesText = aDecoder.decodeObject(of: NSString.self, forKey: Keys.rulesText.rawValue) as String? ?? ""
    
	flavorText = aDecoder.decodeObject(of: NSString.self, forKey: Keys.flavourText.rawValue) as String? ?? ""
    
	power = aDecoder.decodeObject(of: NSString.self, forKey: Keys.power.rawValue) as String? ?? ""
    
	toughness = aDecoder.decodeObject(of: NSString.self, forKey: Keys.toughness.rawValue) as String? ?? ""
    
	artistName = aDecoder.decodeObject(of: NSString.self, forKey: Keys.artistName.rawValue) as String? ?? ""
    
	rarityCode = aDecoder.decodeObject(of: NSString.self, forKey: Keys.rarityCode.rawValue) as String? ?? "C"
    
	promoText = aDecoder.decodeObject(of: NSString.self, forKey: Keys.promoText.rawValue) as String? ?? ""
    
    centerRulesText = aDecoder.decodeBool(forKey: Keys.centerRulesText.rawValue)
    
	dateOverlay = aDecoder.decodeObject(of: NSString.self, forKey: Keys.dateOverlay.rawValue) as String? ?? ""
 
    colorFlags = aDecoder.decodeObject(of: ColorFlags.self, forKey: Keys.colorFlags.rawValue) ?? ColorFlags()
    
	switch aDecoder.decodeObject(of: NSString.self, forKey: Keys.borderColor.rawValue) as String? {
    case BorderColor.black.rawValue?:
      self.borderColor = .black
    case BorderColor.white.rawValue?:
      self.borderColor = .white
    case BorderColor.silver.rawValue?:
      self.borderColor = .silver
    case BorderColor.gold.rawValue?:
      self.borderColor = .gold
    default:
      self.borderColor = .black
    }
    
	switch aDecoder.decodeObject(of: NSString.self, forKey: Keys.template.rawValue) as String? {
    case CardTemplate.standard.rawValue?:
      self.template = .standard
    case CardTemplate.token.rawValue?:
      self.template = .token
    case CardTemplate.fullArtToken.rawValue?:
      self.template = .fullArtToken
    case CardTemplate.fullArtBasicLand.rawValue?:
      self.template = .fullArtBasicLand
    case CardTemplate.fullArtNonbasicLand.rawValue?:
      self.template = .fullArtNonbasicLand
    case CardTemplate.planeswalker3ability.rawValue?:
      self.template = .planeswalker3ability
    case CardTemplate.planeswalker4ability.rawValue?:
      self.template = .planeswalker4ability
    case CardTemplate.transparentStandard.rawValue?:
      self.template = .transparentStandard
    case CardTemplate.gameDay.rawValue?:
      self.template = .gameDay
    case CardTemplate.miracle.rawValue?:
      self.template = .miracle
    case CardTemplate.split.rawValue?:
      self.template = .split
    default:
      self.template = .standard
    }
    
    baseFontSize = aDecoder.decodeDouble(forKey: Keys.baseFontSize.rawValue) == 0 ? 20.75 : aDecoder.decodeDouble(forKey: Keys.baseFontSize.rawValue)
    
    colorIndicator = aDecoder.decodeBool(forKey: Keys.colorIndicator.rawValue)
    
	notes = aDecoder.decodeObject(of: NSString.self, forKey: Keys.notes.rawValue) as String? ?? ""
    
    number = ""
    
    useManaSymbol = aDecoder.decodeBool(forKey: Keys.useManaSymbol.rawValue)
    
	planeswalkerAbility1 = aDecoder.decodeObject(of: NSString.self, forKey: Keys.planeswalkerAbility1.rawValue) as String? ?? ""
	planeswalkerAbility2 = aDecoder.decodeObject(of: NSString.self, forKey: Keys.planeswalkerAbility2.rawValue) as String? ?? ""
	planeswalkerAbility3 = aDecoder.decodeObject(of: NSString.self, forKey: Keys.planeswalkerAbility3.rawValue) as String? ?? ""
	planeswalkerAbility4 = aDecoder.decodeObject(of: NSString.self, forKey: Keys.planeswalkerAbility4.rawValue) as String? ?? ""
	planeswalkerAbility1Cost = aDecoder.decodeObject(of: NSString.self, forKey: Keys.planeswalkerAbility1Cost.rawValue) as String? ?? ""
	planeswalkerAbility2Cost = aDecoder.decodeObject(of: NSString.self, forKey: Keys.planeswalkerAbility2Cost.rawValue) as String? ?? ""
	planeswalkerAbility3Cost = aDecoder.decodeObject(of: NSString.self, forKey: Keys.planeswalkerAbility3Cost.rawValue) as String? ?? ""
	planeswalkerAbility4Cost = aDecoder.decodeObject(of: NSString.self, forKey: Keys.planeswalkerAbility4Cost.rawValue) as String? ?? ""
	planeswalkerStartingLoyalty = aDecoder.decodeObject(of: NSString.self, forKey: Keys.planeswalkerStartingLoyalty.rawValue) as String? ?? ""
    
    watermark = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.watermark.rawValue)
  
    watermarkOpacity = aDecoder.decodeDouble(forKey: Keys.watermarkOpacity.rawValue)
    
    etbTapped = aDecoder.decodeBool(forKey: Keys.etbTapped.rawValue)
    
    childCard = aDecoder.decodeObject(of: Card.self, forKey: Keys.childCard.rawValue)
    
    isDoubleSided = aDecoder.decodeBool(forKey: Keys.isDoubleSided.rawValue)
    
    artZoomFactor = aDecoder.decodeDouble(forKey: Keys.artZoomFactor.rawValue) == 0.0 ? 1.0 : aDecoder.decodeDouble(forKey: Keys.artZoomFactor.rawValue)
    
    artOffsetX = aDecoder.decodeDouble(forKey: Keys.artOffsetX.rawValue)
    
    artOffsetY = aDecoder.decodeDouble(forKey: Keys.artOffsetY.rawValue)
    
    artRotation = aDecoder.decodeFloat(forKey: Keys.artRotation.rawValue)
    
    processedArtCache = aDecoder.decodeObject(of: NSImage.self, forKey: Keys.processedArtCache.rawValue)
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(artData, forKey: Keys.artData.rawValue)
    aCoder.encode(name, forKey: Keys.name.rawValue)
    aCoder.encode(manaCost, forKey: Keys.manaCost.rawValue)
    aCoder.encode(cardType, forKey: Keys.cardType.rawValue)
    aCoder.encode(rulesText, forKey: Keys.rulesText.rawValue)
    aCoder.encode(flavorText, forKey: Keys.flavourText.rawValue)
    aCoder.encode(power, forKey: Keys.power.rawValue)
    aCoder.encode(toughness, forKey: Keys.toughness.rawValue)
    aCoder.encode(artistName, forKey: Keys.artistName.rawValue)
    aCoder.encode(rarityCode, forKey: Keys.rarityCode.rawValue)
    aCoder.encode(promoText, forKey: Keys.promoText.rawValue)
    aCoder.encode(centerRulesText, forKey: Keys.centerRulesText.rawValue)
    aCoder.encode(colorFlags, forKey: Keys.colorFlags.rawValue)
    aCoder.encode(borderColor.rawValue, forKey: Keys.borderColor.rawValue)
    aCoder.encode(dateOverlay, forKey: Keys.dateOverlay.rawValue)
    aCoder.encode(colorIndicator, forKey: Keys.colorIndicator.rawValue)
    aCoder.encode(expansionSymbol, forKey: Keys.expansionSymbol.rawValue)
    aCoder.encode(template.rawValue, forKey: Keys.template.rawValue)
    aCoder.encode(notes, forKey: Keys.notes.rawValue)
    aCoder.encode(useManaSymbol, forKey: Keys.useManaSymbol.rawValue)
    aCoder.encode(baseFontSize, forKey: Keys.baseFontSize.rawValue)
    aCoder.encode(planeswalkerAbility1, forKey: Keys.planeswalkerAbility1.rawValue)
    aCoder.encode(planeswalkerAbility2, forKey: Keys.planeswalkerAbility2.rawValue)
    aCoder.encode(planeswalkerAbility3, forKey: Keys.planeswalkerAbility3.rawValue)
    aCoder.encode(planeswalkerAbility4, forKey: Keys.planeswalkerAbility4.rawValue)
    aCoder.encode(planeswalkerAbility1Cost, forKey: Keys.planeswalkerAbility1Cost.rawValue)
    aCoder.encode(planeswalkerAbility2Cost, forKey: Keys.planeswalkerAbility2Cost.rawValue)
    aCoder.encode(planeswalkerAbility3Cost, forKey: Keys.planeswalkerAbility3Cost.rawValue)
    aCoder.encode(planeswalkerAbility4Cost, forKey: Keys.planeswalkerAbility4Cost.rawValue)
    aCoder.encode(planeswalkerStartingLoyalty, forKey: Keys.planeswalkerStartingLoyalty.rawValue)
    aCoder.encode(watermark, forKey: Keys.watermark.rawValue)
    aCoder.encode(watermarkOpacity, forKey: Keys.watermarkOpacity.rawValue)
    aCoder.encode(etbTapped, forKey: Keys.etbTapped.rawValue)
    aCoder.encode(childCard, forKey: Keys.childCard.rawValue)
    aCoder.encode(isDoubleSided, forKey: Keys.isDoubleSided.rawValue)
    aCoder.encode(artZoomFactor, forKey: Keys.artZoomFactor.rawValue)
    aCoder.encode(artOffsetX, forKey: Keys.artOffsetX.rawValue)
    aCoder.encode(artOffsetY, forKey: Keys.artOffsetY.rawValue)
    aCoder.encode(artRotation, forKey: Keys.artRotation.rawValue)
    aCoder.encode(processedArtCache, forKey: Keys.processedArtCache.rawValue)
  }
  
  var isToken: Bool {
    switch template {
    case .token:
      fallthrough
    case .fullArtToken:
      return true
    default: return false
    }
  }
  
  var types: [String] {
    return cardType.components(separatedBy: " ")
  }
  
  var isLand: Bool {
    return types.contains("Land") ||
           template == .fullArtBasicLand ||
           template == .fullArtNonbasicLand
  }
  
  var isBasic: Bool {
    return types.contains("Basic") ||
           template == .fullArtBasicLand
  }
  
  var isBasicLand: Bool {
    return isBasic && isLand
  }
  
  var isNonbasicLand: Bool {
    return !isBasic && isLand
  }
  
  var isEnchantment: Bool {
    return types.contains("Enchantment")
  }
  
  var isArtifact: Bool {
    return types.contains("Artifact")
  }
  
  var isVehicle: Bool {
    return types.contains("Vehicle")
  }
  
  var isHybrid: Bool {
    return
      manaCost.contains("{W/U}") ||
      manaCost.contains("{U/B}") ||
      manaCost.contains("{B/R}") ||
      manaCost.contains("{R/G}") ||
      manaCost.contains("{G/W}") ||
      manaCost.contains("{W/B}") ||
      manaCost.contains("{U/R}") ||
      manaCost.contains("{B/G}") ||
      manaCost.contains("{R/W}") ||
      manaCost.contains("{G/U}")
  }
  
  var isWhite: Bool {
    if colorFlags.colorless {
      return false
    }
    
    return
      manaCost.contains("W") ||
      colorFlags.allColors == true ||
      colorFlags.white == true ||
      (isLand && cardType.contains("Plains"))
  }
  
  var isBlue: Bool {
    if colorFlags.colorless {
      return false
    }
    
    return
      manaCost.contains("U") ||
      colorFlags.allColors == true ||
      colorFlags.blue == true ||
      (isLand && cardType.contains("Island"))
  }
  
  var isBlack: Bool {
    if colorFlags.colorless {
      return false
    }
    
    return
      manaCost.contains("B") ||
      colorFlags.allColors == true ||
      colorFlags.black == true ||
      (isLand && cardType.contains("Swamp"))
  }
  
  var isRed: Bool {
    if colorFlags.colorless {
      return false
    }
    
    return
      manaCost.contains("R") ||
      colorFlags.allColors == true ||
      colorFlags.red == true ||
      (isLand && cardType.contains("Mountain"))
  }
  
  var isGreen: Bool {
    if colorFlags.colorless {
      return false
    }
    
    return
      manaCost.contains("G") ||
      colorFlags.allColors == true ||
      colorFlags.green == true ||
      (isLand && cardType.contains("Forest"))
  }
  
  var isMulticolor: Bool {
    if colorFlags.colorless {
      return false
    }
    
    if colorFlags.allColors {
      return true
    }
    
    if isHybrid {
      return false
    }
    
    return colors > 1
  }
  
  var isColorless: Bool {
    
    if colorFlags.colorless {
      return true
    }
    
    if colorFlags.allColors {
      return false
    }
    
    return colors == 0
  }

  var colors: Int {
    var count = 0
    
    if colorFlags.colorless {
      return 0
    }
    
    if colorFlags.allColors {
      return 5
    }
    
    for color in [isWhite, isBlue, isBlack, isRed, isGreen] {
      if color {
        count += 1
      }
    }
    
    return count
  }
  
  var cmc: Int {
    
    var cmc = 0
    
    let symbols = manaCost.tokenizeMana().map { text in
        return ManaSymbol(string: text)
    }
    
    for symbol in symbols {
      if let symbol = symbol {
        cmc += symbol.cmc
      }
    }
    
    return cmc
  }
}
