//
//  StandardTemplateCardView.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-31.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class FullArtTokenTemplateCardView: CardTemplateView {
  
  @IBOutlet weak var contentView: NSView!
  
  @IBOutlet weak var background: NSImageView!
  @IBOutlet weak var border: NSImageView!
  @IBOutlet weak var name: NSTextField!
  @IBOutlet weak var backgroundTexture: NSImageView!
  @IBOutlet weak var frameBorder: NSImageView!
  @IBOutlet weak var titlebar: NSImageView!
  @IBOutlet weak var typeLine: NSImageView!
  @IBOutlet weak var ptBox: NSImageView!
  @IBOutlet weak var ptSlash: NSTextField!
  @IBOutlet weak var cardType: NSTextField!
  @IBOutlet weak var power: NSTextField!
  @IBOutlet weak var toughness: NSTextField!
  @IBOutlet weak var upperCopyright: NSTextField!
  @IBOutlet weak var lowerCopyright: NSTextField!
  @IBOutlet weak var artistName: NSTextField!
  @IBOutlet weak var setCode: NSTextField!
  @IBOutlet weak var rarityCode: NSTextField!
  @IBOutlet weak var promoText: NSTextField!
  @IBOutlet weak var paintbrushIcon: NSImageView!
  @IBOutlet weak var dateOverlay: NSTextField!
  
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
      .loadNibNamed(NSNib.Name(rawValue: "FullArtTokenTemplateCardView"), owner: self, topLevelObjects: nil)
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
  
  override func updateBackgroundTexture(card: Card) {
    switch card.colors {
    case 0...5 where card.isLand:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Land Background Texture"))
    case 0...5 where card.isArtifact:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Artifact Background Texture"))
    case 3...5:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Multicolored Background Texture"))
    case 2 where card.isWhite && card.isBlue:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid White Blue Background Texture"))
    case 2 where card.isWhite && card.isBlack:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid White Black Background Texture"))
    case 2 where card.isBlue && card.isBlack:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Blue Black Background Texture"))
    case 2 where card.isBlue && card.isRed:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Blue Red Background Texture"))
    case 2 where card.isBlack && card.isRed:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Black Red Background Texture"))
    case 2 where card.isBlack && card.isGreen:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Black Green Background Texture"))
    case 2 where card.isRed && card.isGreen:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Red Green Background Texture"))
    case 2 where card.isRed && card.isWhite:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Red White Background Texture"))
    case 2 where card.isGreen && card.isWhite:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Green White Background Texture"))
    case 2 where card.isGreen && card.isBlue:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Green Blue Background Texture"))
    case 1 where card.isWhite:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token White Background Texture"))
    case 1 where card.isBlue:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Blue Background Texture"))
    case 1 where card.isBlack:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Black Background Texture"))
    case 1 where card.isRed:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Red Background Texture"))
    case 1 where card.isGreen:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Green Background Texture"))
    default:
      backgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Artifact Background Texture"))
    }
  }
  
  override func updateTitlebarAndTypeLine(card: Card) {
    switch card.colors {
    case 3...5:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Multicolored Type Line"))
    case 2:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Type Line"))
    case 1 where card.isWhite:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token White Type Line"))
    case 1 where card.isBlue:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Blue Type Line"))
    case 1 where card.isBlack:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Black Type Line"))
    case 1 where card.isRed:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Red Type Line"))
    case 1 where card.isGreen:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Green Type Line"))
    case 0 where !card.isLand && card.isArtifact:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Artifact Type Line"))
    case 0 where card.isLand:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Land Type Line"))
    default:
      typeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Colorless Type Line"))
    }
  }
  
  override func updateFrameBorder(card: Card) {
    switch card.colors {
    case 3...5:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Multicolored Frame Border"))
    case 2 where card.isWhite && card.isBlue:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid White Blue Frame Border"))
    case 2 where card.isWhite && card.isBlack:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid White Black Frame Border"))
    case 2 where card.isBlue && card.isBlack:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Blue Black Frame Border"))
    case 2 where card.isBlue && card.isRed:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Blue Red Frame Border"))
    case 2 where card.isBlack && card.isRed:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Black Red Frame Border"))
    case 2 where card.isBlack && card.isGreen:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Black Green Frame Border"))
    case 2 where card.isRed && card.isGreen:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Red Green Frame Border"))
    case 2 where card.isRed && card.isWhite:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Red White Frame Border"))
    case 2 where card.isGreen && card.isWhite:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Green White Frame Border"))
    case 2 where card.isGreen && card.isBlue:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Hybrid Green Blue Frame Border"))
    case 1 where card.isWhite:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token White Frame Border"))
    case 1 where card.isBlue:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Blue Frame Border"))
    case 1 where card.isBlack:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Black Frame Border"))
    case 1 where card.isRed:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Red Frame Border"))
    case 1 where card.isGreen:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Green Frame Border"))
    case 0 where card.isArtifact:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Artifact Frame Border"))
    case 0 where card.isLand:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Colorless Land Frame Border"))
    default:
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Token Colorless Frame Border"))
    }
  }
  
  override func updateCardFrame(card: Card) {
    updateBackgroundTexture(card: card)
    updateFrameBorder(card: card)
    updateTitlebarAndTypeLine(card: card)
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
    name.font = Font.belerenSmallCaps(size: 28).nsFont
      name.stringValue = card.name
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
    
    let string = NSMutableString(string: card.cardType)
    
    replaceDashes(string: string)
    
    cardType.stringValue = string as String
  }
  
  override func updateExpansionSymbol(card: Card, set: CardSet) {
    if let expansionSymbol = card.expansionSymbol {
      self.expansionSymbol.image = expansionSymbol
    } else {
      expansionSymbol.image = set.expansionSymbol.common
    }
  }
  
  override func updatePTBox(card: Card) {
    power.font = Font.belerenBold(size: 26).nsFont
    toughness.font = Font.belerenBold(size: 26).nsFont
    
    power.stringValue = card.power
    
    toughness.stringValue = card.toughness
    
    // ptBox.image = card.ptBox
    
    switch card.colors {
    case 3...5:
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

}
