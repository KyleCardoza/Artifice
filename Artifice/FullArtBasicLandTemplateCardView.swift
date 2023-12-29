//
//  StandardTemplateCardView.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-31.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class FullArtBasicLandTemplateCardView: CardTemplateView {
  
  @IBOutlet weak var contentView: NSView!
  
  @IBOutlet weak var background: NSImageView!
  @IBOutlet weak var border: NSImageView!
  @IBOutlet weak var name: NSTextField!
  @IBOutlet weak var backgroundTexture: NSImageView!
  @IBOutlet weak var frameBorder: NSImageView!
  @IBOutlet weak var titlebarAndTypeLine: NSImageView!
  @IBOutlet weak var cardType: NSTextField!
  @IBOutlet weak var cardSubtype: NSTextField!
  @IBOutlet weak var copyright: NSTextField!
  @IBOutlet weak var artistName: NSTextField!
  @IBOutlet weak var setCode: NSTextField!
  @IBOutlet weak var rarityCode: NSTextField!
  @IBOutlet weak var promoText: NSTextField!
  @IBOutlet weak var paintbrushIcon: NSImageView!
  @IBOutlet weak var dateOverlay: NSTextField!
  @IBOutlet weak var manaSymbol: NSImageView!
  
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
      .loadNibNamed(NSNib.Name(rawValue: "FullArtBasicLandTemplateCardView"), owner: self, topLevelObjects: nil)
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
    if card.isWhite {
      manaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land White Mana"))
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land White Frame Border"))
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land White Titlebar & Type Line"))
    } else if card.isBlue {
      manaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Blue Mana"))
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Blue Frame Border"))
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Blue Titlebar & Type Line"))
    } else if card.isBlack {
      manaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Black Mana"))
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Black Frame Border"))
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Black Titlebar & Type Line"))
    } else if card.isRed {
      manaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Red Mana"))
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Red Frame Border"))
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Red Titlebar & Type Line"))
    } else if card.isGreen {
      manaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Green Mana"))
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Green Frame Border"))
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Green Titlebar & Type Line"))
    } else {
      manaSymbol.image = NSImage(named: NSImage.Name(rawValue: "Standard Basic Land Colorless Mana"))
      frameBorder.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Colorless Frame Border"))
      titlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Full Art Basic Land Colorless Titlebar & Type Line"))
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
    cardSubtype.font = Font.belerenBold(size: 21).nsFont
    
    
    let type = card.cardType.components(separatedBy: "--")
    
    cardType.stringValue = type[0]
    if type.count > 1 {
      cardSubtype.stringValue = type[1]
    } else {
      cardSubtype.stringValue = ""
    }
  }
  
  override func updateExpansionSymbol(card: Card, set: CardSet) {
    if let expansionSymbol = card.expansionSymbol {
      self.expansionSymbol.image = expansionSymbol
    } else {
      expansionSymbol.image = set.expansionSymbol.common
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
