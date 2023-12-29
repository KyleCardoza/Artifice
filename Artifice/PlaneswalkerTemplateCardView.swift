//
//  StandardTemplateCardView.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-31.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class PlaneswalkerTemplateCardView: CardTemplateView {
  
  @IBOutlet weak var contentView: NSView!
  
  @IBOutlet weak var background: NSImageView!
  @IBOutlet weak var border: NSImageView!
  @IBOutlet weak var name: NSTextField!
  @IBOutlet weak var backgroundTexture: NSImageView!
  @IBOutlet weak var frameBorder: NSImageView!
  @IBOutlet weak var titlebarAndTypeLine: NSImageView!
  @IBOutlet weak var manaCost: NSTextField!
  @IBOutlet weak var cardType: NSTextField!
  @IBOutlet weak var copyright: NSTextField!
  @IBOutlet weak var artistName: NSTextField!
  @IBOutlet weak var setCode: NSTextField!
  @IBOutlet weak var rarityCode: NSTextField!
  @IBOutlet weak var promoText: NSTextField!
  @IBOutlet weak var paintbrushIcon: NSImageView!
  @IBOutlet weak var dateOverlay: NSTextField!
  @IBOutlet weak var colorIndicator: NSImageView!
  @IBOutlet weak var typeLineWithColorIndicator: NSTextField!  
  @IBOutlet weak var ability1rulesText: NSTextField!
  @IBOutlet weak var ability2rulesText: NSTextField!
  @IBOutlet weak var ability3rulesText: NSTextField!
  
  @IBOutlet weak var ability1rulesTextNoCost: NSTextField!
  @IBOutlet weak var ability2rulesTextNoCost: NSTextField!
  @IBOutlet weak var ability3rulesTextNoCost: NSTextField!
  
  @IBOutlet weak var abilityCost1Positive: NSImageView!
  @IBOutlet weak var abilityCost1Zero: NSImageView!
  @IBOutlet weak var abilityCost1Negative: NSImageView!
  @IBOutlet weak var abilityCost2Positive: NSImageView!
  @IBOutlet weak var abilityCost2Zero: NSImageView!
  @IBOutlet weak var abilityCost2Negative: NSImageView!
  @IBOutlet weak var abilityCost3Positive: NSImageView!
  @IBOutlet weak var abilityCost3Zero: NSImageView!
  @IBOutlet weak var abilityCost3Negative: NSImageView!
  
  @IBOutlet weak var startingLoyaltyGraphic: NSImageView!
  
  @IBOutlet weak var startingLoyalty: NSTextField!
  @IBOutlet weak var abilityCost1: NSTextField!
  @IBOutlet weak var abilityCost2: NSTextField!
  @IBOutlet weak var abilityCost3: NSTextField!
  
  @IBOutlet weak var ability1colonPositive: NSTextField!
  @IBOutlet weak var ability1colonZero: NSTextField!
  @IBOutlet weak var ability1colonNegative: NSTextField!
  @IBOutlet weak var ability2colonPositive: NSTextField!
  @IBOutlet weak var ability2colonZero: NSTextField!
  @IBOutlet weak var ability2colonNegative: NSTextField!
  @IBOutlet weak var ability3colonPositive: NSTextField!
  @IBOutlet weak var ability3colonZero: NSTextField!
  @IBOutlet weak var ability3colonNegative: NSTextField!
  
  static var artAspectRatio: CGFloat = 400 / 530
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initSubviews()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initSubviews()
  }
  
  func initSubviews() {
    Bundle(for: type(of: self))
      .loadNibNamed(NSNib.Name(rawValue: "PlaneswalkerTemplateCardView"), owner: self, topLevelObjects: nil)
    contentView.frame = bounds
    addSubview(contentView)
  }
  
  override func update(card: Card, set: CardSet) {
    
    updateCardFrame(card: card)
    
    updateBorder(card: card)
    
    updateCardName(card: card)
    
    updateManaCost(card: card)
    
    updateArt(card: card)
    
    updateDateOverlay(card: card)
    
    updateTypeLine(card: card)
    
    updateColorIndicator(card: card)
    
    updateExpansionSymbol(card: card, set: set)
    
    updateRarityCode(card: card)
    
    updatePromoText(card: card)
    
    updateCopyright(card: card, set: set)
    
    updateCollectorNumber(card: card, set: set)
    
    updateArtistName(card: card)
    
    updateSetInfo(card: card, set: set)
    
    updatePlaneswalkerInfo(card: card)
    
    updateExpansionSymbolVisibility(card: card, set: set)
    
  }
  
  override func updateBackgroundTexture(card: Card) {
    switch card.colors {
    case 3...5:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Multicolored Background Texture"))
      
    case 2 where !card.isHybrid:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Multicolored Background Texture"))
      
    case 2 where card.isWhite && card.isBlue:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid White Blue Background Texture"))
      
    case 2 where card.isWhite && card.isBlack:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid White Black Background Texture"))
      
    case 2 where card.isBlue && card.isBlack:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Blue Black Background Texture"))
      
    case 2 where card.isBlue && card.isRed:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Blue Red Background Texture"))
      
    case 2 where card.isBlack && card.isRed:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Black Red Background Texture"))
      
    case 2 where card.isBlack && card.isGreen:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Black Green Background Texture"))
      
    case 2 where card.isRed && card.isGreen:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Red Green Background Texture"))
      
    case 2 where card.isRed && card.isWhite:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Red White Background Texture"))
      
    case 2 where card.isGreen && card.isWhite:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Green White Background Texture"))
      
    case 2 where card.isGreen && card.isBlue:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Green Blue Background Texture"))
      
    case 1 where card.isWhite:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker White Background Texture"))
      
    case 1 where card.isBlue:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Blue Background Texture"))
      
    case 1 where card.isBlack:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Black Background Texture"))
      
    case 1 where card.isRed:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Red Background Texture"))
      
    case 1 where card.isGreen:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Green Background Texture"))
      
    default:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Colorless Background Texture"))
    }
  }
  
  override func updateTitlebarAndTypeLine(card: Card) {
    switch card.colors {
    case 2...5 where !card.isHybrid:
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Multicolored Titlebar & Type Line"))
      
    case 2:
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Titlebar & Type Line"))
      
    case 1 where card.isWhite:
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker White Titlebar & Type Line"))
      
    case 1 where card.isBlue:
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Blue Titlebar & Type Line"))
      
    case 1 where card.isBlack:
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Black Titlebar & Type Line"))
      
    case 1 where card.isRed:
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Red Titlebar & Type Line"))
      
    case 1 where card.isGreen:
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Green Titlebar & Type Line"))
      
    default:
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Colorless Titlebar & Type Line"))
    }
  }
  
  override func updateFrameBorder(card: Card) {
    switch card.colors {
    case 3...5:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Multicolored Card Frame"))
      
    case 2 where card.isWhite && card.isBlue:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid White Blue Card Frame"))
      
    case 2 where card.isWhite && card.isBlack:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid White Black Card Frame"))
      
    case 2 where card.isBlue && card.isBlack:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Blue Black Card Frame"))
      
    case 2 where card.isBlue && card.isRed:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Blue Red Card Frame"))
      
    case 2 where card.isBlack && card.isRed:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Black Red Card Frame"))
      
    case 2 where card.isBlack && card.isGreen:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Black Green Card Frame"))
      
    case 2 where card.isRed && card.isGreen:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Red Green Card Frame"))
      
    case 2 where card.isRed && card.isWhite:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Red White Card Frame"))
      
    case 2 where card.isGreen && card.isWhite:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Green White Card Frame"))
      
    case 2 where card.isGreen && card.isBlue:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Hybrid Green Blue Card Frame"))
      
    case 1 where card.isWhite:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker White Card Frame"))
      
    case 1 where card.isBlue:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Blue Card Frame"))
      
    case 1 where card.isBlack:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Black Card Frame"))
      
    case 1 where card.isRed:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Red Card Frame"))
      
    case 1 where card.isGreen:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Green Card Frame"))
      
    default:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Planeswalker Colorless Card Frame"))

    }
  }
  
  override func updateCardFrame(card: Card) {
    updateBackgroundTexture(card: card)
    updateTitlebarAndTypeLine(card: card)
    updateFrameBorder(card: card)
  }
  
  override func updateBorder(card: Card) {
    switch card.borderColor {
    case .black:
      border.image = NSImage(named:NSImage.Name(rawValue: "Planeswalker Black Border"))
    case .white:
      border.image = NSImage(named:NSImage.Name(rawValue: "Planeswalker White Border"))
    case .silver:
      border.image = NSImage(named:NSImage.Name(rawValue: "Planeswalker Silver Border"))
    case .gold:
      border.image = NSImage(named:NSImage.Name(rawValue: "Planeswalker Gold Border"))
    }
  }
  
  override func updateCardName(card: Card) {
    
    var fontSize: CGFloat = 25.0
    
    switch card.name.characters.count {
    case 1...25:
      fontSize = 25.0
    case 26...30:
      fontSize = 24.0
    default:
      fontSize = 15.0
    }
    
    
    name.font = Font.belerenBold(size: fontSize).nsFont
    name.stringValue = card.name
  }
  
  override func updateManaCost(card: Card) {
    
    let fontSize: CGFloat = 26.0
    
    manaCost.font = Font.mplantin(size: 0.01).nsFont
    
    let manaCostParagraphStyle = NSMutableParagraphStyle()
    manaCostParagraphStyle.alignment = .right
    
    
	let manaCostAttributes: [NSAttributedStringKey : Any] = [
      NSAttributedStringKey.paragraphStyle: manaCostParagraphStyle,
      NSAttributedStringKey.baselineOffset: NSNumber(value: Double(fontSize * -0.1))
      ]
    
    let manaCostAttributedString =
      NSMutableAttributedString(string: card.manaCost,
                                attributes: manaCostAttributes)
    
    manaCostAttributedString.parseManaCost(size: fontSize, align: .right, withShadow: true)
    
    
    
    manaCost.attributedStringValue = manaCostAttributedString
  }
  
  override func updateDateOverlay(card: Card) {
    dateOverlay.font = Font.belerenBold(size: 16).nsFont
    dateOverlay.stringValue = card.dateOverlay
  }
  
  override func updateTypeLine(card: Card) {
    
    cardType.font = Font.belerenBold(size: 21).nsFont
    typeLineWithColorIndicator.font = Font.belerenBold(size: 21).nsFont
    
    let string = NSMutableString(string: card.cardType)
    
    replaceDashes(string: string)
    
    cardType.stringValue = string as String
    typeLineWithColorIndicator.stringValue = string as String
  }
  
  override func updateColorIndicator(card: Card) {
    if card.colorIndicator {
      colorIndicator.isHidden = false
      cardType.isHidden = true
      typeLineWithColorIndicator.isHidden = false
      switch card.colors {
      case 3...5:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Multicolored Color Indicator"))
      case 2 where card.isWhite && card.isBlue:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "White Blue Color Indicator"))
      case 2 where card.isWhite && card.isBlack:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "White Black Color Indicator"))
      case 2 where card.isBlue && card.isBlack:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Blue Black Color Indicator"))
      case 2 where card.isBlue && card.isRed:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Blue Red Color Indicator"))
      case 2 where card.isBlack && card.isRed:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Black Red Color Indicator"))
      case 2 where card.isBlack && card.isGreen:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Black Green Color Indicator"))
      case 2 where card.isRed && card.isGreen:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Red Green Color Indicator"))
      case 2 where card.isRed && card.isWhite:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Red White Color Indicator"))
      case 2 where card.isGreen && card.isWhite:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Green White Color Indicator"))
      case 2 where card.isGreen && card.isBlue:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Green Blue Color Indicator"))
      case 1 where card.isWhite:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "White Color Indicator"))
      case 1 where card.isBlue:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Blue Color Indicator"))
      case 1 where card.isBlack:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Black Color Indicator"))
      case 1 where card.isRed:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Red Color Indicator"))
      case 1 where card.isGreen:
        colorIndicator.image = NSImage(named:NSImage.Name(rawValue: "Green Color Indicator"))
      default:
        colorIndicator.isHidden = true
      }
    } else {
      colorIndicator.isHidden = true
      cardType.isHidden = false
      typeLineWithColorIndicator.isHidden = true
    }
  }
  
  override func updateExpansionSymbol(card: Card, set: CardSet) {
    if let expansionSymbol = card.expansionSymbol {
      self.expansionSymbol.image = expansionSymbol
    } else {
      switch card.rarityCode {
      case "C":
        expansionSymbol.image = set.expansionSymbol.common
      case "U":
        expansionSymbol.image = set.expansionSymbol.uncommon
      case "R":
        expansionSymbol.image = set.expansionSymbol.rare
      case "M":
         expansionSymbol.image = set.expansionSymbol.mythic
      case "S":
        expansionSymbol.image = set.expansionSymbol.special
      case "L":
        expansionSymbol.image = set.expansionSymbol.common
      case "B":
        expansionSymbol.image = set.expansionSymbol.bonus
      default:
        expansionSymbol.image = set.expansionSymbol.common
      }
    }
  }
  
  func rulesTextFontSize(card: Card) -> CGFloat {
    
    let defaultSize = CGFloat(card.baseFontSize - 2.75)
    
    var scaleFactor: CGFloat = 1.0
    
    switch card.planeswalkerAbility1.characters.count +
           card.planeswalkerAbility2.characters.count +
           card.planeswalkerAbility3.characters.count {
      
    case 0...49:
      scaleFactor = 1.0
    case 50...99:
      scaleFactor = 0.975
    case 100...149:
      scaleFactor = 0.95
    case 150...199:
      scaleFactor = 0.925
    case 200...249:
      scaleFactor = 0.9
    case 250...299:
      scaleFactor = 0.875
    case 300...349:
      scaleFactor = 0.85
    case 350...399:
      scaleFactor = 0.825
    case 400...449:
      scaleFactor = 0.8
    default:
      scaleFactor = 0.775
    }
    
    return defaultSize * scaleFactor
  }
  
  override func updateRarityCode(card: Card) {
    rarityCode.font = Font.relay(size: 11.5).nsFont
    rarityCode.stringValue = card.rarityCode
  }
  
  override func updatePromoText(card: Card) {
    promoText.font = Font.relay(size: 11.5).nsFont
    promoText.stringValue = card.promoText
  }
  
  override func updateCopyright(card: Card, set: CardSet) {
    copyright.font = Font.mplantin(size: 11).nsFont
    copyright.stringValue = set.copyright
  }
  
  override func updateCollectorNumber(card: Card, set: CardSet) {
    collectorNumber.font = Font.relay(size: 11.5).nsFont
    collectorNumber.stringValue = set.collectorNumber(card: card)
  }
  
  override func updateArtistName(card: Card) {
    artistName.font = Font.belerenSmallCaps(size: 11.5).nsFont
    artistName.stringValue = card.artistName
  }
  
  override func updateSetInfo(card: Card, set: CardSet) {
    setCode.font = Font.relay(size: 11.5).nsFont
    setCode.stringValue = "\(set.code) • \(set.language.rawValue)"
  }
  
  override func updatePlaneswalkerInfo(card: Card) {
    
    let fontSize = rulesTextFontSize(card: card)
    
    abilityCost1.stringValue = card.planeswalkerAbility1Cost
    abilityCost2.stringValue = card.planeswalkerAbility2Cost
    abilityCost3.stringValue = card.planeswalkerAbility3Cost
    
    var font = Font.mplantin(size: fontSize).nsFont
    
    let style = NSMutableParagraphStyle()
    
    style.paragraphSpacing = 0.3 * fontSize
    style.maximumLineHeight = fontSize * 1.4
    style.paragraphSpacingBefore = 1
    
    if card.centerRulesText == true {
      style.alignment = .center
    } else {
      style.alignment = .left
    }
    
    let attributes = [
      NSAttributedStringKey.paragraphStyle: style,
      NSAttributedStringKey.baselineOffset: NSNumber(value: Double(fontSize * 0.1))
    ]
    
    let ability1attributedString = NSMutableAttributedString(string: card.planeswalkerAbility1, attributes: attributes)
    let ability2attributedString = NSMutableAttributedString(string: card.planeswalkerAbility2, attributes: attributes)
    let ability3attributedString = NSMutableAttributedString(string: card.planeswalkerAbility3, attributes: attributes)
    
    startingLoyalty.stringValue = card.planeswalkerStartingLoyalty
    
    parseBodyText(string: ability1attributedString, size: fontSize, align: .left)
    parseBodyText(string: ability2attributedString, size: fontSize, align: .left)
    parseBodyText(string: ability3attributedString, size: fontSize, align: .left)
    
    replaceCardName(string: ability1attributedString.mutableString, with: card.name)
    replaceCardName(string: ability2attributedString.mutableString, with: card.name)
    replaceCardName(string: ability3attributedString.mutableString, with: card.name)
    
    
    ability1rulesText.attributedStringValue = ability1attributedString
    ability2rulesText.attributedStringValue = ability2attributedString
    ability3rulesText.attributedStringValue = ability3attributedString
    ability1rulesTextNoCost.attributedStringValue = ability1attributedString
    ability2rulesTextNoCost.attributedStringValue = ability2attributedString
    ability3rulesTextNoCost.attributedStringValue = ability3attributedString
    
    ability1rulesText.font = font
    ability2rulesText.font = font
    ability3rulesText.font = font
    ability1rulesTextNoCost.font = font
    ability2rulesTextNoCost.font = font
    ability3rulesTextNoCost.font = font
    
    font = Font.belerenBold(size: 19).nsFont
    abilityCost1.font = font
    abilityCost2.font = font
    abilityCost3.font = font
    
    startingLoyalty.font = Font.belerenBold(size: 25).nsFont
    
    updatePlaneswakerVisibility(card: card)
    
  }

  func updatePlaneswakerVisibility(card: Card) {
    
    if card.planeswalkerAbility1Cost != "" {
      let idx = card.planeswalkerAbility1Cost.characters.startIndex
      switch card.planeswalkerAbility1Cost.characters[idx] {
      case Character("+"):
        abilityCost1.isHidden = false
        abilityCost1Positive.isHidden = false
        abilityCost1Zero.isHidden = true
        abilityCost1Negative.isHidden = true
        ability1colonPositive.isHidden = false
        ability1colonZero.isHidden = true
        ability1colonNegative.isHidden = true
        ability1rulesText.isHidden = false
        ability1rulesTextNoCost.isHidden = true
      case Character("0"):
        abilityCost1.isHidden = false
        abilityCost1Positive.isHidden = true
        abilityCost1Zero.isHidden = false
        abilityCost1Negative.isHidden = true
        ability1colonPositive.isHidden = true
        ability1colonZero.isHidden = false
        ability1colonNegative.isHidden = true
        ability1rulesText.isHidden = false
        ability1rulesTextNoCost.isHidden = true
      case Character("-"):
        abilityCost1.isHidden = false
        abilityCost1Positive.isHidden = true
        abilityCost1Zero.isHidden = true
        abilityCost1Negative.isHidden = false
        ability1colonPositive.isHidden = true
        ability1colonZero.isHidden = true
        ability1colonNegative.isHidden = false
        ability1rulesText.isHidden = false
        ability1rulesTextNoCost.isHidden = true
      default:
        abilityCost1.isHidden = true
        abilityCost1Positive.isHidden = true
        abilityCost1Zero.isHidden = true
        abilityCost1Negative.isHidden = true
        ability1colonPositive.isHidden = true
        ability1colonZero.isHidden = true
        ability1colonNegative.isHidden = true
        ability1rulesText.isHidden = true
        ability1rulesTextNoCost.isHidden = false
      }
    } else {
      abilityCost1.isHidden = true
      abilityCost1Positive.isHidden = true
      abilityCost1Zero.isHidden = true
      abilityCost1Negative.isHidden = true
      ability1colonPositive.isHidden = true
      ability1colonZero.isHidden = true
      ability1colonNegative.isHidden = true
      ability1rulesText.isHidden = true
      ability1rulesTextNoCost.isHidden = false
    }
    
    
    if card.planeswalkerAbility2Cost != "" {
      let idx = card.planeswalkerAbility2Cost.characters.startIndex
      switch card.planeswalkerAbility2Cost.characters[idx] {
      case Character("+"):
        abilityCost2.isHidden = false
        abilityCost2Positive.isHidden = false
        abilityCost2Zero.isHidden = true
        abilityCost2Negative.isHidden = true
        ability2colonPositive.isHidden = false
        ability2colonZero.isHidden = true
        ability2colonNegative.isHidden = true
        ability2rulesText.isHidden = false
        ability2rulesTextNoCost.isHidden = true
      case Character("0"):
        abilityCost2.isHidden = false
        abilityCost2Positive.isHidden = true
        abilityCost2Zero.isHidden = false
        abilityCost2Negative.isHidden = true
        ability2colonPositive.isHidden = true
        ability2colonZero.isHidden = false
        ability2colonNegative.isHidden = true
        ability2rulesText.isHidden = false
        ability2rulesTextNoCost.isHidden = true
      case Character("-"):
        abilityCost2.isHidden = false
        abilityCost2Positive.isHidden = true
        abilityCost2Zero.isHidden = true
        abilityCost2Negative.isHidden = false
        ability2colonPositive.isHidden = true
        ability2colonZero.isHidden = true
        ability2colonNegative.isHidden = false
        ability2rulesText.isHidden = false
        ability2rulesTextNoCost.isHidden = true
      default:
        abilityCost2.isHidden = true
        abilityCost2Positive.isHidden = true
        abilityCost2Zero.isHidden = true
        abilityCost2Negative.isHidden = true
        ability2colonPositive.isHidden = true
        ability2colonZero.isHidden = true
        ability2colonNegative.isHidden = true
        ability2rulesText.isHidden = true
        ability2rulesTextNoCost.isHidden = false
      }
    } else {
      abilityCost2.isHidden = true
      abilityCost2Positive.isHidden = true
      abilityCost2Zero.isHidden = true
      abilityCost2Negative.isHidden = true
      ability2colonPositive.isHidden = true
      ability2colonZero.isHidden = true
      ability2colonNegative.isHidden = true
      ability2rulesText.isHidden = true
      ability2rulesTextNoCost.isHidden = false
    }
    
    
    if card.planeswalkerAbility3Cost != "" {
      let idx = card.planeswalkerAbility3Cost.characters.startIndex
      switch card.planeswalkerAbility3Cost.characters[idx] {
      case Character("+"):
        abilityCost3.isHidden = false
        abilityCost3Positive.isHidden = false
        abilityCost3Zero.isHidden = true
        abilityCost3Negative.isHidden = true
        ability3colonPositive.isHidden = false
        ability3colonZero.isHidden = true
        ability3colonNegative.isHidden = true
        ability3rulesText.isHidden = false
        ability3rulesTextNoCost.isHidden = true
      case Character("0"):
        abilityCost3.isHidden = false
        abilityCost3Positive.isHidden = true
        abilityCost3Zero.isHidden = false
        abilityCost3Negative.isHidden = true
        ability3colonPositive.isHidden = true
        ability3colonZero.isHidden = false
        ability3colonNegative.isHidden = true
        ability3rulesText.isHidden = false
        ability3rulesTextNoCost.isHidden = true
      case Character("-"):
        abilityCost3.isHidden = false
        abilityCost3Positive.isHidden = true
        abilityCost3Zero.isHidden = true
        abilityCost3Negative.isHidden = false
        ability3colonPositive.isHidden = true
        ability3colonZero.isHidden = true
        ability3colonNegative.isHidden = false
        ability3rulesText.isHidden = false
        ability3rulesTextNoCost.isHidden = true
      default:
        abilityCost3.isHidden = true
        abilityCost3Positive.isHidden = true
        abilityCost3Zero.isHidden = true
        abilityCost3Negative.isHidden = true
        ability3colonPositive.isHidden = true
        ability3colonZero.isHidden = true
        ability3colonNegative.isHidden = true
        ability3rulesText.isHidden = true
        ability3rulesTextNoCost.isHidden = false
      }
    } else {
      abilityCost3.isHidden = true
      abilityCost3Positive.isHidden = true
      abilityCost3Zero.isHidden = true
      abilityCost3Negative.isHidden = true
      ability3colonPositive.isHidden = true
      ability3colonZero.isHidden = true
      ability3colonNegative.isHidden = true
      ability3rulesText.isHidden = true
      ability3rulesTextNoCost.isHidden = false
    }
    
    
    if card.planeswalkerStartingLoyalty != "" {
      startingLoyaltyGraphic.isHidden = false
    } else {
      startingLoyaltyGraphic.isHidden = true
    }
    
  }
  
}
