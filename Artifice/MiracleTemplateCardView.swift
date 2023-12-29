//
//  StandardTemplateCardView.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-31.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class MiracleTemplateCardView: CardTemplateView {
  
  @IBOutlet weak var contentView: NSView!
  
  @IBOutlet weak var background: NSImageView!
  @IBOutlet weak var border: NSImageView!
  @IBOutlet weak var name: NSTextField!
  @IBOutlet weak var backgroundTexture: NSImageView!
  @IBOutlet weak var frameBorder: NSImageView!
  @IBOutlet weak var typeLine: NSImageView!
  @IBOutlet weak var manaCost: NSTextField!
  @IBOutlet weak var titlebar: NSImageView!
  @IBOutlet weak var textBox: NSImageView!
  @IBOutlet weak var ptBox: NSImageView!
  @IBOutlet weak var ptSlash: NSTextField!
  @IBOutlet weak var cardType: NSTextField!
  @IBOutlet weak var rulesText: NSTextField!
  @IBOutlet weak var power: NSTextField!
  @IBOutlet weak var flavorText: NSTextField!
  @IBOutlet weak var toughness: NSTextField!
  @IBOutlet weak var upperCopyright: NSTextField!
  @IBOutlet weak var lowerCopyright: NSTextField!
  @IBOutlet weak var artistName: NSTextField!
  @IBOutlet weak var setCode: NSTextField!
  @IBOutlet weak var rarityCode: NSTextField!
  @IBOutlet weak var promoText: NSTextField!
  @IBOutlet weak var paintbrushIcon: NSImageView!
  @IBOutlet weak var dateOverlay: NSTextField!
  @IBOutlet weak var colorIndicator: NSImageView!
  @IBOutlet weak var typeLineWithColorIndicator: NSTextField!
  @IBOutlet weak var rulesTextNoFlavor: NSTextField!
  @IBOutlet weak var flavorTextNoRules: NSTextField!
  @IBOutlet weak var basicLandManaSymbol: NSImageView!
  @IBOutlet weak var watermark: NSImageView!
  
  
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
      .loadNibNamed(NSNib.Name(rawValue: "MiracleTemplateCardView"), owner: self, topLevelObjects: nil)
    contentView.frame = bounds
    addSubview(contentView)
    wantsLayer = true
  }
  
  override func update(card: Card, set: CardSet) {
    
    updateCardFrame(card: card)
    
    updateBorder(card: card)
    
    updateTitlebar(card: card)
    
    updateCardName(card: card)
    
    updateManaCost(card: card)
    
    updateArt(card: card)
    
    updateDateOverlay(card: card)
    
    updateTypeLine(card: card)
    
    updateColorIndicator(card: card)
    
    updateExpansionSymbol(card: card, set: set)
    
    updateTextBoxVisibility(card: card)
    
    updateRulesText(card: card)
    
    updateFlavorText(card: card)
    
    updatePTBox(card: card)
    
    updateRarityCode(card: card)
    
    updatePromoText(card: card)
    
    updateCopyright(card: card, set: set)
    
    updateCollectorNumber(card: card, set: set)
    
    updateArtistName(card: card)
    
    updateSetInfo(card: card, set: set)
    
    updateManaSymbol(card: card, set: set)
    
    updateWatermark(card: card)
    
    updateExpansionSymbolVisibility(card: card, set: set)
  }
  
  func updateManaSymbol(card: Card, set: CardSet) {
    if card.useManaSymbol && card.isLand {
      basicLandManaSymbol.isHidden = false
    } else {
      basicLandManaSymbol.isHidden = true
    }
    
    if card.cardType.contains("Plains") {
      basicLandManaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land White Mana"))
    }
    
    if card.cardType.contains("Island") {
      basicLandManaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Blue Mana"))
    }
    
    if card.cardType.contains("Swamp") {
      basicLandManaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Black Mana"))
    }
    
    if card.cardType.contains("Mountain") {
      basicLandManaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Red Mana"))
    }
    
    if card.cardType.contains("Forest") {
      basicLandManaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Green Mana"))
    }
    
    if card.cardType.contains("Wastes") {
      basicLandManaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Colorless Mana"))
    }
  }
  
  override func updateBackgroundTexture(card: Card) {
    switch card.colors {
    case 0...5 where card.isLand:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Land Background Texture"))
    case 0...5 where card.isArtifact:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Artifact Background Texture"))
    case 3...5:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Multicolored Background Texture"))
    case 2 where !card.isHybrid:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Multicolored Background Texture"))
    case 2 where card.isWhite && card.isBlue:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard White Blue Hybrid Background Texture"))
    case 2 where card.isWhite && card.isBlack:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard White Black Hybrid Background Texture"))
    case 2 where card.isBlue && card.isBlack:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Blue Black Hybrid Background Texture"))
    case 2 where card.isBlue && card.isRed:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Blue Red Hybrid Background Texture"))
    case 2 where card.isBlack && card.isRed:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Black Red Hybrid Background Texture"))
    case 2 where card.isBlack && card.isGreen:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Black Green Hybrid Background Texture"))
    case 2 where card.isRed && card.isGreen:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Red Green Hybrid Background Texture"))
    case 2 where card.isRed && card.isWhite:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Red White Hybrid Background Texture"))
    case 2 where card.isGreen && card.isWhite:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Green White Hybrid Background Texture"))
    case 2 where card.isGreen && card.isBlue:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Green Blue Hybrid Background Texture"))
    case 1 where card.isWhite:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard White Background Texture"))
    case 1 where card.isBlue:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Blue Background Texture"))
    case 1 where card.isBlack:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Black Background Texture"))
    case 1 where card.isRed:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Red Background Texture"))
    case 1 where card.isGreen:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Green Background Texture"))
    default:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Standard Artifact Background Texture"))
    }
  }
  
  override func updateTextBox(card: Card) {
    switch card.colors {
    case 0...5 where card.isArtifact:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Artifact Text Box"))
      
    case 3...5 where !card.isArtifact && !card.isLand:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Multicolored Text Box"))
    case 3...5 where !card.isArtifact && card.isLand:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Multicolored Land Text Box"))
      
    case 2 where card.isLand && card.isWhite && card.isBlue:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard White Blue Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isWhite && card.isBlue:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard White Blue Hybrid Text Box"))
      
    case 2 where card.isLand && card.isWhite && card.isBlack:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard White Black Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isWhite && card.isBlack:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard White Black Hybrid Text Box"))
      
    case 2 where card.isLand && card.isBlue && card.isBlack:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Blue Black Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isBlue && card.isBlack:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Blue Black Hybrid Text Box"))
      
    case 2 where card.isLand && card.isBlue && card.isRed:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Blue Red Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isBlue && card.isRed:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Blue Red Hybrid Text Box"))
      
    case 2 where card.isLand && card.isBlack && card.isRed:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Black Red Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isBlack && card.isRed:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Black Red Hybrid Text Box"))
      
    case 2 where card.isLand && card.isBlack && card.isGreen:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Black Green Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isBlack && card.isGreen:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Black Green Hybrid Text Box"))
      
    case 2 where card.isLand && card.isRed && card.isGreen:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Red Green Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isRed && card.isGreen:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Red Green Hybrid Text Box"))
      
    case 2 where card.isLand && card.isRed && card.isWhite:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Red White Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isRed && card.isWhite:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Red White Hybrid Text Box"))
      
    case 2 where card.isLand && card.isGreen && card.isWhite:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Green White Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isGreen && card.isWhite:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Green White Hybrid Text Box"))
      
    case 2 where card.isLand && card.isGreen && card.isBlue:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Green Blue Hybrid Land Text Box"))
    case 2 where !card.isLand && card.isGreen && card.isBlue:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Green Blue Hybrid Text Box"))
      
    case 1 where card.isLand && card.isWhite:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard White Land Text Box"))
    case 1 where !card.isLand && card.isWhite:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard White Text Box"))
      
    case 1 where card.isLand && card.isBlue:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Blue Land Text Box"))
    case 1 where !card.isLand && card.isBlue:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Blue Text Box"))
      
    case 1 where card.isLand && card.isBlack:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Black Land Text Box"))
    case 1 where !card.isLand && card.isBlack:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Black Text Box"))
      
    case 1 where card.isLand && card.isRed:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Red Land Text Box"))
    case 1 where !card.isLand && card.isRed:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Red Text Box"))
      
    case 1 where card.isLand && card.isGreen:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Green Land Text Box"))
    case 1 where !card.isLand && card.isGreen:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Green Text Box"))
      
    case 0 where card.isLand:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Colorless Land Text Box"))
      
    default:
      textBox.image = NSImage(named:NSImage.Name(rawValue: "Standard Colorless Text Box"))
    }
    
  }
  
  override func updateTitlebarAndTypeLine(card: Card) {
    switch card.colors {
    case 3...5:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Multicolored Titlebar & Type Line"))
    case 2 where !card.isHybrid && !card.isLand:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Multicolored Titlebar & Type Line"))
    case 2:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Hybrid Titlebar & Type Line"))
    case 1 where card.isWhite:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard White Titlebar & Type Line"))
    case 1 where card.isBlue:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Blue Titlebar & Type Line"))
    case 1 where card.isBlack:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Black Titlebar & Type Line"))
    case 1 where card.isRed:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Red Titlebar & Type Line"))
    case 1 where card.isGreen:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Green Titlebar & Type Line"))
    case 0 where !card.isLand && card.isArtifact:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Colorless Artifact Titlebar & Type Line"))
    case 0 where card.isLand:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Colorless Land Titlebar & Type Line"))
    default:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Standard Colorless Titlebar & Type Line"))
    }
  }
  
  func updateTitlebar(card: Card) {
    switch card.colors {
    case 3...5:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Multicolored Titlebar"))
    case 2 where !card.isHybrid && !card.isLand:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Multicolored Titlebar"))
    case 2:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid Titlebar"))
    case 1 where card.isWhite:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - White Titlebar"))
    case 1 where card.isBlue:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Blue Titlebar"))
    case 1 where card.isBlack:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Black Titlebar"))
    case 1 where card.isRed:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Red Titlebar"))
    case 1 where card.isGreen:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Green Titlebar"))
    case 0 where !card.isLand && card.isArtifact:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Colorless Artifact Titlebar"))
    case 0 where card.isLand:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Colorless Land Titlebar"))
    default:
      titlebar.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Colorless Titlebar"))
    }
  }
  
  override func updateFrameBorder(card: Card) {
    switch card.colors {
    case 3...5:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Multicolored Frame Border"))
    case 2 where card.isWhite && card.isBlue:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid White Blue Frame Border"))
    case 2 where card.isWhite && card.isBlack:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid White Black Frame Border"))
    case 2 where card.isBlue && card.isBlack:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid Blue Black Frame Border"))
    case 2 where card.isBlue && card.isRed:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid Blue Red Frame Border"))
    case 2 where card.isBlack && card.isRed:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid Black Red Frame Border"))
    case 2 where card.isBlack && card.isGreen:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid Black Green Frame Border"))
    case 2 where card.isRed && card.isGreen:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid Red Green Frame Border"))
    case 2 where card.isRed && card.isWhite:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid Red White Frame Border"))
    case 2 where card.isGreen && card.isWhite:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid Green White Frame Border"))
    case 2 where card.isGreen && card.isBlue:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Hybrid Green Blue Frame Border"))
    case 1 where card.isWhite:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - White Frame Border"))
    case 1 where card.isBlue:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Blue Frame Border"))
    case 1 where card.isBlack:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Black Frame Border"))
    case 1 where card.isRed:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Red Frame Border"))
    case 1 where card.isGreen:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Green Frame Border"))
    case 0 where card.isArtifact:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Colorless Artifact Frame Border"))
    case 0 where card.isLand:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Colorless Land Frame Border"))
    default:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Miracle - Colorless Frame Border"))
    }
  }

  override func updateCardFrame(card: Card) {
    
    updateBackgroundTexture(card: card)
    updateTextBox(card: card)
    updateTitlebarAndTypeLine(card: card)
    updateFrameBorder(card: card)
  }
  
  override func updateBorder(card: Card) {
    switch card.borderColor {
    case .black:
      border.image = NSImage(named:NSImage.Name(rawValue: "Standard Black Card Border"))
    case .white:
      border.image = NSImage(named:NSImage.Name(rawValue: "Standard White Card Border"))
    case .silver:
      border.image = NSImage(named:NSImage.Name(rawValue: "Standard Silver Card Border"))
    case .gold:
      border.image = NSImage(named:NSImage.Name(rawValue: "Standard Gold Card Border"))
    }
  }
  
  override func updateCardName(card: Card) {
    
    var fontSize: CGFloat = 25.0
    
    switch card.name.characters.count {
    case 1...25:
      fontSize = 25.0
    case 26...35:
      fontSize = 23.5
    case 36...40:
      fontSize = 22.5
    default:
      fontSize = 22.0
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
    
    var fontSize: CGFloat = 21.0
    
    switch card.cardType.characters.count {
    case 1...20:
      fontSize = 21.0
    case 21...25:
      fontSize = 21.0
    case 26...30:
      fontSize = 21.0
    case 31...35:
      fontSize = 20.25
    case 36...40:
      fontSize = 19.75
    default:
      fontSize = 19.25
    }
    
    cardType.font = Font.belerenBold(size: fontSize).nsFont
    typeLineWithColorIndicator.font = Font.belerenBold(size: fontSize).nsFont
    
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
  
  override func updateTextBoxVisibility(card: Card) {
    if card.isLand && card.useManaSymbol {
      rulesText.isHidden = true
      flavorText.isHidden = true
      rulesTextNoFlavor.isHidden = true
      flavorTextNoRules.isHidden = true
    } else if (card.rulesText == "" && card.flavorText != "") {
      rulesText.isHidden = true
      flavorText.isHidden = true
      rulesTextNoFlavor.isHidden = true
      flavorTextNoRules.isHidden = false
    } else if card.rulesText != "" && card.flavorText == "" {
      rulesText.isHidden = true
      flavorText.isHidden = true
      rulesTextNoFlavor.isHidden = false
      flavorTextNoRules.isHidden = true
    } else {
      rulesText.isHidden = false
      flavorText.isHidden = false
      rulesTextNoFlavor.isHidden = true
      flavorTextNoRules.isHidden = true
    }
  }
  
  func rulesTextFontSize(card: Card) -> CGFloat {
    
    // We need to calculate the excess characters in the attributed
    // string value, where:
    //
    //  N = the number of instances of {CARDNAME} in the raw text
    //  M = the number of characters in card.name
    //  O = N * (M - N)
    //
    // Then add O to the length of the string for the purposes of
    // calculating font size.
    
    var excessCharacters = 0
    var countCardname = 0
    
    if let regex = try? NSRegularExpression(pattern: "\\{CARDNAME\\}", options: .useUnixLineSeparators) {
      countCardname = regex.numberOfMatches(in: card.rulesText,
                                            options: .reportCompletion,
                                            range: NSRange(location: 0,
                                                           length: card.rulesText.characters.count))
      excessCharacters += countCardname * (card.name.characters.count - 10)
    }
    
    
    if let regex = try? NSRegularExpression(pattern: "\\{CARDNAME\\}", options: .useUnixLineSeparators) {
      countCardname = regex.numberOfMatches(in: card.flavorText,
                                            options: .reportCompletion,
                                            range: NSRange(location: 0,
                                                           length: card.flavorText.characters.count))
      
      excessCharacters += countCardname * (card.name.characters.count - 10)
    }
    
    if let regex = try? NSRegularExpression(pattern: "\\{.\\}", options: .useUnixLineSeparators) {
      countCardname = regex.numberOfMatches(in: card.rulesText,
                                            options: .reportCompletion,
                                            range: NSRange(location: 0,
                                                           length: card.rulesText.characters.count))
      
      excessCharacters += countCardname * 3
    }
    
    if let regex = try? NSRegularExpression(pattern: "\\{...\\}", options: .useUnixLineSeparators) {
      countCardname = regex.numberOfMatches(in: card.rulesText,
                                            options: .reportCompletion,
                                            range: NSRange(location: 0,
                                                           length: card.rulesText.characters.count))
      
      excessCharacters += countCardname * 5
    }
    
    if excessCharacters <= 0 {
      excessCharacters = 0
    }
    
    let defaultSize = CGFloat(card.baseFontSize)
    
    var scaleFactor: CGFloat = 1.0
    
    switch card.rulesText.characters.count + card.flavorText.characters.count + excessCharacters {
      
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
  
  func flavorTextFontSize(card: Card) -> CGFloat {
    return rulesTextFontSize(card: card) * 0.95
  }
  
  override func updateRulesText(card: Card) {
    
    let fontSize = rulesTextFontSize(card: card)
    
    rulesText.font = Font.mplantin(size: fontSize).nsFont
    rulesTextNoFlavor.font = Font.mplantin(size: fontSize).nsFont
    
    let rulesTextParagraphStyle = NSMutableParagraphStyle()
    
    rulesTextParagraphStyle.paragraphSpacing = 0.3 * fontSize
    rulesTextParagraphStyle.maximumLineHeight = fontSize * 1.4
    rulesTextParagraphStyle.paragraphSpacingBefore = 1
    
    if card.centerRulesText == true {
      rulesTextParagraphStyle.alignment = .center
    } else {
      rulesTextParagraphStyle.alignment = .left
    }
    
    let rulesTextAttributes = [
      NSAttributedStringKey.paragraphStyle: rulesTextParagraphStyle,
      NSAttributedStringKey.baselineOffset: NSNumber(value: Double(fontSize * 0.1))
    ]
    
    let rulesTextAttributedString =
        NSMutableAttributedString(string: card.rulesText,
                           attributes: rulesTextAttributes)
    
    replaceCardName(string: rulesTextAttributedString.mutableString, with: card.name)
    
    parseBodyText(string: rulesTextAttributedString, size: fontSize, align: rulesTextParagraphStyle.alignment)
    
    rulesText.attributedStringValue = rulesTextAttributedString
    
    rulesTextNoFlavor.attributedStringValue = rulesTextAttributedString
    
  }
  
  override func updateFlavorText(card: Card) {
    
    let fontSize = flavorTextFontSize(card: card)
    
    flavorText.font = Font.mplantinItalic(size: fontSize).nsFont
    flavorTextNoRules.font = Font.mplantinItalic(size: fontSize).nsFont
    
    let flavorTextParagraphStyle = NSMutableParagraphStyle()
    
    
    flavorTextParagraphStyle.paragraphSpacing = 0.1 * fontSize
    flavorTextParagraphStyle.maximumLineHeight = fontSize * 1.2
    
    if card.centerRulesText == true {
      flavorTextParagraphStyle.alignment = .center
    } else {
      flavorTextParagraphStyle.alignment = .left
    }
    
    let flavorTextAttributes = [
      NSAttributedStringKey.paragraphStyle: flavorTextParagraphStyle,
      NSAttributedStringKey.baselineOffset: NSNumber(value: 0.0)
    ]
    
    let flavorTextAttributedString =
      NSMutableAttributedString(string: card.flavorText,
                                attributes: flavorTextAttributes)
    
    
    parseBodyText(string: flavorTextAttributedString, size: fontSize, align: flavorTextParagraphStyle.alignment)
    
    
    flavorText.attributedStringValue = flavorTextAttributedString
    flavorTextNoRules.attributedStringValue = flavorTextAttributedString
  }
  
  override func updatePTBox(card: Card) {
    power.font = Font.belerenBold(size: 26).nsFont
    power.stringValue = card.power
    
    toughness.stringValue = card.toughness
    toughness.font = Font.belerenBold(size: 26).nsFont
    
    ptSlash.font = Font.belerenBold(size: 27).nsFont
    
    switch card.colors {
    case 3...5:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Multicolored PT Box"))
    case 2 where !card.isHybrid:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Multicolored PT Box"))
    case 2:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Hybrid PT Box"))
    case 1 where card.isWhite:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard White PT Box"))
    case 1 where card.isBlue:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Blue PT Box"))
    case 1 where card.isBlack:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Black PT Box"))
    case 1 where card.isRed:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Red PT Box"))
    case 1 where card.isGreen:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Green PT Box"))
    case 0 where card.isArtifact:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Colorless Artifact PT Box"))
    case 0 where card.isLand:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Colorless Land PT Box"))
    default:
      ptBox.image = NSImage(named: NSImage.Name(rawValue: "Standard Colorless Transparent PT Box"))
    }
    
    if power.stringValue == "" {
      power.isHidden = true
    } else {
      power.isHidden = false
    }
    
    if toughness.stringValue == "" {
      toughness.isHidden = true
    } else {
      toughness.isHidden = false
    }
    
    if power.stringValue == "" && toughness.stringValue == "" {
      ptBox.isHidden = true
      ptSlash.isHidden = true
      upperCopyright.isHidden = false
      lowerCopyright.isHidden = true
    } else {
      ptBox.isHidden = false
      ptSlash.isHidden = false
      upperCopyright.isHidden = true
      lowerCopyright.isHidden = false
    }
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
    upperCopyright.font = Font.mplantin(size: 11).nsFont
    lowerCopyright.font = Font.mplantin(size: 11).nsFont
    upperCopyright.stringValue = set.copyright
    lowerCopyright.stringValue = set.copyright
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
  
  func updateWatermark(card: Card) {
    
    watermark.image = card.watermark
    if card.watermark != nil {
      watermark.isHidden = false
    } else {
      watermark.isHidden = true
    }
    
    watermark.alphaValue = CGFloat(card.watermarkOpacity)
  }

}
