//
//  CardSet.swift
//  Project Urza
//
//  Created by Kyle Cardoza on 2016-07-25.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class CardSet: NSObject, NSCoding {
  
  enum Keys: String {
    case border
    case name
    case code
    case setDescription
    case credits
    case cards
    case language
    case copyright
    case borderColor
    case expansionSymbol
    case exportResolution
    case savedBy
    case hideExpansionSymbol
    case defaultPromoText
  }
  
  enum ExportResolution: String {
    case low
    case medium
    case high
    case extreme
  }
  
  var name: String {
    willSet {
      NSDocumentController.shared.currentDocument?.displayName = newValue
    }
  }
  var code: String
  var setDescription: String
  var credits: String
  var cards: [Card]
  var language = Language.en
  var year = Calendar.current.component(.year, from: Date())
  var copyright: String = "™ & © \(Calendar.current.component(.year, from: Date())) Wizards of the Coast"
  var borderColor = BorderColor.black
  var expansionSymbol: ExpansionSymbol
  var exportResolution: ExportResolution
  var savedBy: Int
  var hideExpansionSymbol: Bool
  var defaultPromoText: String
  
  var exportSize: NSSize {
    switch exportResolution {
    case .low:
      return NSSize(width: 198, height: 270)
    case .medium:
      return NSSize(width: 413, height: 563)
    case .high:
      return NSSize(width: 825, height: 1125)
    case .extreme:
      return NSSize(width: 1650, height: 2250)
    }
  }
  
  var narrowExportSize: NSSize {
    switch exportResolution {
    case .low:
      return NSSize(width: 188, height: 263)
    case .medium:
      return NSSize(width: 375, height: 525)
    case .high:
      return NSSize(width: 750, height: 1050)
    case .extreme:
      return NSSize(width: 1500, height: 2100)
    }
  }
  
  
  
  override init() {
    name = "Untitled Set"
    code = ""
    setDescription = ""
    credits = ""
    cards = [Card]()
    borderColor = .black
    language = .en
    expansionSymbol = ExpansionSymbol()
    exportResolution = ExportResolution.high
    savedBy = {
      if let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
        return Int(version) ?? 0
      } else {
        return 0
      }
    }()
    hideExpansionSymbol = false
    defaultPromoText = "Made with Artifice"
  }
  
  required init?(coder aDecoder: NSCoder) {
	if let borderColorRawValue = aDecoder.decodeObject(of: NSString.self, forKey: Keys.borderColor.rawValue) as String? {
      if let borderColor = BorderColor(rawValue: borderColorRawValue) {
        self.borderColor = borderColor
      } else {
        self.borderColor = .black
      }
    } else {
      self.borderColor = .black
    }
	name = aDecoder.decodeObject(of: NSString.self, forKey: Keys.name.rawValue) as String? ?? ""
	code = aDecoder.decodeObject(of: NSString.self, forKey: Keys.code.rawValue) as String? ?? ""
	setDescription = aDecoder.decodeObject(of: NSString.self, forKey: Keys.setDescription.rawValue) as String? ?? ""
	credits = aDecoder.decodeObject(of: NSString.self, forKey: Keys.credits.rawValue) as String? ?? ""
    cards = aDecoder.decodeObject(of: NSArray.self, forKey: Keys.cards.rawValue) as? [Card] ?? [Card]()
	if let rawValue = aDecoder.decodeObject(of: NSString.self, forKey: Keys.language.rawValue) as String? {
      if let lang = Language(rawValue: rawValue) {
        language = lang
      } else {
        language = .en
      }
    } else {
      language = .en
    }
    expansionSymbol = aDecoder.decodeObject(of: ExpansionSymbol.self, forKey: Keys.expansionSymbol.rawValue) ?? ExpansionSymbol()
	switch aDecoder.decodeObject(of: NSString.self, forKey: Keys.exportResolution.rawValue) as String? {
    case ExportResolution.low.rawValue?:
      exportResolution = .low
    case ExportResolution.medium.rawValue?:
      exportResolution = .medium
    case ExportResolution.high.rawValue?:
      exportResolution = .high
    case ExportResolution.extreme.rawValue?:
      exportResolution = .extreme
    default:
      exportResolution = .medium
    }
	copyright = aDecoder.decodeObject(of: NSString.self, forKey: Keys.copyright.rawValue) as String? ?? "™ & © \(Calendar.current.component(.year, from: Date())) Wizards of the Coast"
    savedBy = aDecoder.decodeObject(of: NSNumber.self, forKey: Keys.savedBy.rawValue) as? Int ?? 0
    hideExpansionSymbol = aDecoder.decodeBool(forKey: Keys.hideExpansionSymbol.rawValue)
	defaultPromoText = aDecoder.decodeObject(of: NSString.self, forKey: Keys.defaultPromoText.rawValue) as String? ?? "Made with Artifice"
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(borderColor.rawValue, forKey: Keys.borderColor.rawValue)
    aCoder.encode(name, forKey: Keys.name.rawValue)
    aCoder.encode(code, forKey: Keys.code.rawValue)
    aCoder.encode(setDescription, forKey: Keys.setDescription.rawValue)
    aCoder.encode(credits, forKey: Keys.credits.rawValue)
    aCoder.encode(cards, forKey: Keys.cards.rawValue)
    aCoder.encode(language.rawValue, forKey: Keys.language.rawValue)
    aCoder.encode(expansionSymbol, forKey: Keys.expansionSymbol.rawValue)
    aCoder.encode(exportResolution.rawValue, forKey: Keys.exportResolution.rawValue)
    aCoder.encode(copyright, forKey: Keys.copyright.rawValue)
    aCoder.encode(savedBy, forKey: Keys.savedBy.rawValue)
    aCoder.encode(hideExpansionSymbol, forKey: Keys.hideExpansionSymbol.rawValue)
    aCoder.encode(defaultPromoText, forKey: Keys.defaultPromoText.rawValue)
  }
  
  func collectorNumber(card: Card) -> String {
    //sortCards()
    switch card.template {
    case .token:
      fallthrough
    case .fullArtToken:
      
      let tokens = cards.filter { card in
        card.isToken
      }
      
      guard let index = tokens.index(of: card) else {
        return ""
      }
      
      let format: NSString
      
      switch tokens.count {
      case 0...999:
        format = "%03d"
      default:
        format = "%04d"
      }
      
      let collectorNumber = NSString(format: format, index + 1)
      let count = NSString(format: format, tokens.count)
      
      return "\(collectorNumber)/\(count)"
    default:
      
      let tokens = cards.filter { card in
        card.isToken
        }.count
      
      guard let index = cards.index(of: card) else {
        return ""
      }
      
      let format: NSString
      
      switch cards.count {
      case 0...999:
        format = "%03d"
      default:
        format = "%04d"
      }
      
      let collectorNumber = NSString(format: format, index + 1)
      let count = NSString(format: format, cards.count - tokens)
      
      return "\(collectorNumber)/\(count)"
    }
  }
  
}
