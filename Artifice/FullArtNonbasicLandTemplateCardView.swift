//
//  StandardTemplateCardView.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-31.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class FullArtNonbasicLandTemplateCardView: CardTemplateView {
  
  @IBOutlet weak var contentView: NSView!
  
  @IBOutlet weak var background: NSImageView!
  @IBOutlet weak var border: NSImageView!
  @IBOutlet weak var name: NSTextField!
  @IBOutlet weak var backgroundTexture: NSImageView!
  @IBOutlet weak var frameBorder: NSImageView!
  @IBOutlet weak var titlebarAndTypeLine: NSImageView!
  @IBOutlet weak var cardType: NSTextField!
  @IBOutlet weak var copyright: NSTextField!
  @IBOutlet weak var artistName: NSTextField!
  @IBOutlet weak var setCode: NSTextField!
  @IBOutlet weak var rarityCode: NSTextField!
  @IBOutlet weak var promoText: NSTextField!
  @IBOutlet weak var paintbrushIcon: NSImageView!
  @IBOutlet weak var dateOverlay: NSTextField!
  @IBOutlet weak var rulesText: NSTextField!
  @IBOutlet weak var flavorText: NSTextField!
  @IBOutlet weak var rulesTextNoFlavor: NSTextField!
  @IBOutlet weak var flavorTextNoRules: NSTextField!
  
  static var artAspectRatio: CGFloat = 400 / 460
  
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
      .loadNibNamed(NSNib.Name(rawValue: "FullArtNonbasicLandTemplateCardView"), owner: self, topLevelObjects: nil)
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
    
    updateExpansionSymbolVisibility(card: card, set: set)
  }


  override func updateCardFrame(card: Card) {
    
    if card.colors > 2 {
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Multicolored Frame Border"))
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Multicolored Titlebar & Type Line"))
    } else if card.colors == 2 {
      if card.isWhite && card.isBlue {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid White Blue Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      } else if card.isWhite && card.isBlack {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid White Black Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      } else if card.isBlue && card.isBlack {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Blue Black Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      } else if card.isBlue && card.isRed {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Blue Red Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      } else if card.isBlack && card.isRed {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Black Red Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      } else if card.isBlack && card.isGreen {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Black Green Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      } else if card.isRed && card.isGreen {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Red Green Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      } else if card.isRed && card.isWhite {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Red White Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      } else if card.isGreen && card.isWhite {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Green White Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      } else if card.isGreen && card.isBlue {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Green Blue Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Hybrid Titlebar & Type Line"))
      }
    } else if card.colors == 1 {
      if card.isWhite{
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land White Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land White Titlebar & Type Line"))
      } else if card.isBlue {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Blue Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Blue Titlebar & Type Line"))
      } else if card.isBlack {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Black Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Black Titlebar & Type Line"))
      } else if card.isRed {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Red Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Red Titlebar & Type Line"))
      } else if card.isGreen {
        frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Green Frame Border"))
        titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Green Titlebar & Type Line"))
      }
    } else {
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Colorless Frame Border"))
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Nonbasic Land Colorless Titlebar & Type Line"))
    }
  }
  
  override func updateBorder(card: Card) {
    switch card.borderColor {
    case .black:
      border.image = NSImage(named:NSImage.Name(rawValue: "Token Black Card Border"))
    case .white:
      border.image = NSImage(named:NSImage.Name(rawValue: "Token White Card Border"))
    case .silver:
      border.image = NSImage(named:NSImage.Name(rawValue: "Token Silver Card Border"))
    case .gold:
      border.image = NSImage(named:NSImage.Name(rawValue: "Token Gold Card Border"))
    }
  }
  
  override func updateCardName(card: Card) {
    name.font = Font.belerenBold(size: 23).nsFont
      name.stringValue = card.name
  }
  
  override func updateDateOverlay(card: Card) {
    dateOverlay.font = Font.belerenBold(size: 16).nsFont
    dateOverlay.stringValue = card.dateOverlay
  }
  
  override func updateTypeLine(card: Card) {
    cardType.font = Font.belerenBold(size: 21).nsFont
    
    let string = NSMutableString(string: card.cardType)
    
    replaceDashes(string: string)
    
    cardType.stringValue = string as String

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
    let defaultSize = CGFloat(card.baseFontSize)
    
    var scaleFactor: CGFloat = 1.0
    
    switch card.rulesText.characters.count + card.flavorText.characters.count {
      
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

}
