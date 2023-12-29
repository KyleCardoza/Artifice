//
//  StandardTemplateCardView.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-31.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class SplitCardTemplateCardView: CardTemplateView {
  
  @IBOutlet weak var contentView: NSView!
  
  @IBOutlet weak var border: NSImageView!
  
  @IBOutlet weak var leftManaCost: NSTextField!
  
  @IBOutlet weak var leftBackgroundTexture: NSImageView!
  @IBOutlet weak var leftFrameBorder: NSImageView!
  @IBOutlet weak var leftTitlebarAndTypeLine: NSImageView!
  @IBOutlet weak var leftTextBox: NSImageView!
  @IBOutlet weak var leftColorIndicator: NSImageView!
  @IBOutlet weak var leftWatermark: NSImageView!
  @IBOutlet weak var leftPaintbrushIcon: NSImageView!
  @IBOutlet weak var leftExpansionSymbol: NSImageView!
  
  @IBOutlet weak var leftArt: NSImageView!
  
  @IBOutlet weak var leftName: NSTextField!
  @IBOutlet weak var leftTypeLine: NSTextField!
  @IBOutlet weak var leftTypeLineWithColorIndicator: NSTextField!
  @IBOutlet weak var leftRulesText: NSTextField!
  @IBOutlet weak var leftArtistName: NSTextField!
  
  @IBOutlet weak var rightManaCost: NSTextField!
  
  @IBOutlet weak var rightBackgroundTexture: NSImageView!
  @IBOutlet weak var rightFrameBorder: NSImageView!
  @IBOutlet weak var rightTitlebarAndTypeLine: NSImageView!
  @IBOutlet weak var rightTextBox: NSImageView!
  @IBOutlet weak var rightColorIndicator: NSImageView!
  @IBOutlet weak var rightWatermark: NSImageView!
  @IBOutlet weak var rightPaintbrushIcon: NSImageView!
  @IBOutlet weak var rightExpansionSymbol: NSImageView!
  
  @IBOutlet weak var rightArt: NSImageView!
  
  @IBOutlet weak var rightName: NSTextField!
  @IBOutlet weak var rightTypeLine: NSTextField!
  @IBOutlet weak var rightTypeLineWithColorIndicator: NSTextField!
  @IBOutlet weak var rightRulesText: NSTextField!
  @IBOutlet weak var rightArtistName: NSTextField!

  
  @IBOutlet weak var copyright: NSTextField!
  @IBOutlet weak var setCode: NSTextField!
  @IBOutlet weak var rarityCode: NSTextField!
  @IBOutlet weak var promoText: NSTextField!
  @IBOutlet weak var dateOverlay: NSTextField!
  
  @IBOutlet weak var rightCollectorNumber: NSTextField!
  @IBOutlet weak var rightSetCode: NSTextField!
  @IBOutlet weak var rightRarityCode: NSTextField!
  
  static var artAspectRatio: CGFloat = 269 / 194
  
  
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
      .loadNibNamed(NSNib.Name(rawValue: "SplitCardTemplateCardView"), owner: self, topLevelObjects: nil)
    contentView.frame = bounds
    addSubview(contentView)
    wantsLayer = true
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
    
    updateWatermark(card: card)
    
    updateExpansionSymbolVisibility(card: card, set: set)
  }
  
  override func updateArt(card: Card) {
    leftArt.image = card.processedArt
    rightArt.image = card.childCard?.processedArt
  }
  
  override func updateExpansionSymbolVisibility(card: Card, set: CardSet) {
    if set.hideExpansionSymbol {
      leftExpansionSymbol.isHidden = true
      rightExpansionSymbol.isHidden = true
    } else {
      leftExpansionSymbol.isHidden = false
      rightExpansionSymbol.isHidden = false
    }
  }
  
  override func updateBackgroundTexture(card: Card) {
    switch card.colors {
    case 2 where !card.isHybrid, 3...5:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Multicolored Background Texture"))
    case 2 where card.isHybrid && card.isWhite && card.isBlue:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid White Blue Background Texture"))
    case 2 where card.isHybrid && card.isWhite && card.isBlack:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid White Black Background Texture"))
    case 2 where card.isHybrid && card.isBlue && card.isBlack:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Blue Black Background Texture"))
    case 2 where card.isHybrid && card.isBlue && card.isRed:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Blue Red Background Texture"))
    case 2 where card.isHybrid && card.isBlack && card.isRed:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Black Red Background Texture"))
    case 2 where card.isHybrid && card.isBlack && card.isGreen:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Black Green Background Texture"))
    case 2 where card.isHybrid && card.isRed && card.isGreen:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Red Green Background Texture"))
    case 2 where card.isHybrid && card.isRed && card.isWhite:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Red White Background Texture"))
    case 2 where card.isHybrid && card.isGreen && card.isWhite:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Green White Background Texture"))
    case 2 where card.isHybrid && card.isGreen && card.isBlue:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Green Blue Background Texture"))
    case 1 where card.isWhite:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - White Background Texture"))
    case 1 where card.isBlue:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Blue Background Texture"))
    case 1 where card.isBlack:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Black Background Texture"))
    case 1 where card.isRed:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Red Background Texture"))
    case 1 where card.isGreen:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Green Background Texture"))
    default:
      leftBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Colorless Background Texture"))
    }
    
    if let card = card.childCard {
      switch card.colors {
      case 2 where !card.isHybrid, 3...5:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Multicolored Background Texture"))
      case 2 where card.isHybrid && card.isWhite && card.isBlue:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid White Blue Background Texture"))
      case 2 where card.isHybrid && card.isWhite && card.isBlack:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid White Black Background Texture"))
      case 2 where card.isHybrid && card.isBlue && card.isBlack:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Blue Black Background Texture"))
      case 2 where card.isHybrid && card.isBlue && card.isRed:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Blue Red Background Texture"))
      case 2 where card.isHybrid && card.isBlack && card.isRed:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Black Red Background Texture"))
      case 2 where card.isHybrid && card.isBlack && card.isGreen:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Black Green Background Texture"))
      case 2 where card.isHybrid && card.isRed && card.isGreen:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Red Green Background Texture"))
      case 2 where card.isHybrid && card.isRed && card.isWhite:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Red White Background Texture"))
      case 2 where card.isHybrid && card.isGreen && card.isWhite:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Green White Background Texture"))
      case 2 where card.isHybrid && card.isGreen && card.isBlue:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Green Blue Background Texture"))
      case 1 where card.isWhite:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - White Background Texture"))
      case 1 where card.isBlue:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Blue Background Texture"))
      case 1 where card.isBlack:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Black Background Texture"))
      case 1 where card.isRed:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Red Background Texture"))
      case 1 where card.isGreen:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Green Background Texture"))
      default:
        rightBackgroundTexture.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Colorless Background Texture"))
      }
    }
  }
  
  override func updateTextBox(card: Card) {
    switch card.colors {
    case 3...5:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Multicolored Text Box"))
    case 2 where card.isWhite && card.isBlue:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid White Blue Text Box"))
    case 2 where card.isWhite && card.isBlack:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid White Black Text Box"))
    case 2 where card.isBlue && card.isBlack:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Blue Black Text Box"))
    case 2 where card.isBlue && card.isRed:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Blue Red Text Box"))
    case 2 where card.isBlack && card.isRed:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Black Red Text Box"))
    case 2 where card.isBlack && card.isGreen:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Black Green Text Box"))
    case 2 where card.isRed && card.isGreen:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Red Green Text Box"))
    case 2 where card.isRed && card.isWhite:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Red White Text Box"))
    case 2 where card.isGreen && card.isWhite:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Green White Text Box"))
    case 2 where card.isGreen && card.isBlue:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Green Blue Text Box"))
    case 1 where card.isWhite:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - White Text Box"))
    case 1 where card.isWhite:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - White Text Box"))
    case 1 where card.isBlue:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Blue Text Box"))
    case 1 where card.isBlack:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Black Text Box"))
    case 1 where card.isRed:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Red Text Box"))
    case 1 where card.isGreen:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Green Text Box"))
    default:
      leftTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Colorless Text Box"))
    }
    
    if let card = card.childCard {
      switch card.colors {
      case 3...5:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Multicolored Text Box"))
      case 2 where card.isWhite && card.isBlue:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid White Blue Text Box"))
      case 2 where card.isWhite && card.isBlack:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid White Black Text Box"))
      case 2 where card.isBlue && card.isBlack:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Blue Black Text Box"))
      case 2 where card.isBlue && card.isRed:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Blue Red Text Box"))
      case 2 where card.isBlack && card.isRed:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Black Red Text Box"))
      case 2 where card.isBlack && card.isGreen:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Black Green Text Box"))
      case 2 where card.isRed && card.isGreen:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Red Green Text Box"))
      case 2 where card.isRed && card.isWhite:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Red White Text Box"))
      case 2 where card.isGreen && card.isWhite:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Green White Text Box"))
      case 2 where card.isGreen && card.isBlue:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Green Blue Text Box"))
      case 1 where card.isWhite:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - White Text Box"))
      case 1 where card.isWhite:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - White Text Box"))
      case 1 where card.isBlue:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Blue Text Box"))
      case 1 where card.isBlack:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Black Text Box"))
      case 1 where card.isRed:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Red Text Box"))
      case 1 where card.isGreen:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Green Text Box"))
      default:
        rightTextBox.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Colorless Text Box"))
      }
    }
    
  }
  
  override func updateTitlebarAndTypeLine(card: Card) {
    
    switch card.colors {
    case 2 where !card.isHybrid, 3...5:
      leftTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Multicolored Type Line and Titlebar"))
    case 2 where card.isHybrid:
      leftTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Type Line and Titlebar"))
    case 1 where card.isWhite:
      leftTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - White Type Line and Titlebar"))
    case 1 where card.isBlue:
      leftTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Blue Type Line and Titlebar"))
    case 1 where card.isBlack:
      leftTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Black Type Line and Titlebar"))
    case 1 where card.isRed:
      leftTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Red Type Line and Titlebar"))
    case 1 where card.isGreen:
      leftTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Green Type Line and Titlebar"))
    default:
      leftTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Colorless Type Line and Titlebar"))
    }
    
    if let child = card.childCard {
      
      switch child.colors {
      case 2 where !child.isHybrid, 3...5:
        rightTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Multicolored Type Line and Titlebar"))
      case 2 where child.isHybrid:
        rightTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Type Line and Titlebar"))
      case 1 where child.isWhite:
        rightTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - White Type Line and Titlebar"))
      case 1 where child.isBlue:
        rightTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Blue Type Line and Titlebar"))
      case 1 where child.isBlack:
        rightTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Black Type Line and Titlebar"))
      case 1 where child.isRed:
        rightTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Red Type Line and Titlebar"))
      case 1 where child.isGreen:
        rightTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Green Type Line and Titlebar"))
      default:
        rightTitlebarAndTypeLine.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Colorless Type Line and Titlebar"))
      }
    }
    
  }
  
  override func updateFrameBorder(card: Card) {
    switch card.colors {
    case 3...5:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Multicolored Frame Border"))
    case 2 where card.isWhite && card.isBlue:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid White Blue Frame Border"))
    case 2 where card.isWhite && card.isBlack:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid White Black Frame Border"))
    case 2 where card.isBlue && card.isBlack:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Blue Black Frame Border"))
    case 2 where card.isBlue && card.isRed:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Blue Red Frame Border"))
    case 2 where card.isBlack && card.isRed:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Black Red Frame Border"))
    case 2 where card.isBlack && card.isGreen:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Black Green Frame Border"))
    case 2 where card.isRed && card.isGreen:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Red Green Frame Border"))
    case 2 where card.isRed && card.isWhite:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Red White Frame Border"))
    case 2 where card.isGreen && card.isWhite:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Green White Frame Border"))
    case 2 where card.isGreen && card.isBlue:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Hybrid Green Blue Frame Border"))
    case 1 where card.isWhite:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - White Frame Border"))
    case 1 where card.isBlue:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Blue Frame Border"))
    case 1 where card.isBlack:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Black Frame Border"))
    case 1 where card.isRed:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Red Frame Border"))
    case 1 where card.isGreen:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Green Frame Border"))
    default:
      leftFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Left - Colorless Frame Border"))
    }
    
    if let child = card.childCard {
      switch child.colors {
      case 3...5:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Multicolored Frame Border"))
      case 2 where child.isWhite && child.isBlue:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid White Blue Frame Border"))
      case 2 where child.isWhite && child.isBlack:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid White Black Frame Border"))
      case 2 where child.isBlue && child.isBlack:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Blue Black Frame Border"))
      case 2 where child.isBlue && child.isRed:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Blue Red Frame Border"))
      case 2 where child.isBlack && child.isRed:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Black Red Frame Border"))
      case 2 where child.isBlack && child.isGreen:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Black Green Frame Border"))
      case 2 where child.isRed && child.isGreen:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Red Green Frame Border"))
      case 2 where child.isRed && child.isWhite:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Red White Frame Border"))
      case 2 where child.isGreen && child.isWhite:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Green White Frame Border"))
      case 2 where child.isGreen && child.isBlue:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Hybrid Green Blue Frame Border"))
      case 1 where child.isWhite:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - White Frame Border"))
      case 1 where child.isBlue:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Blue Frame Border"))
      case 1 where child.isBlack:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Black Frame Border"))
      case 1 where child.isRed:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Red Frame Border"))
      case 1 where child.isGreen:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Green Frame Border"))
      default:
        rightFrameBorder.image = NSImage(named: NSImage.Name(rawValue: "Split Card - Right - Colorless Frame Border"))
      }
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
      border.image = NSImage(named: NSImage.Name(rawValue: "Landscape Black Card Background"))
    case .white:
      border.image = NSImage(named: NSImage.Name(rawValue: "Landscape White Card Background"))
    case .silver:
      border.image = NSImage(named: NSImage.Name(rawValue: "Landscape Silver Card Background"))
    case .gold:
      border.image = NSImage(named: NSImage.Name(rawValue: "Landscape Gold Card Background"))
    }
  }
  
  override func updateCardName(card: Card) {
    
    
    var fontSize: CGFloat = 22.0
    
    switch card.name.characters.count {
    case 1...25:
      fontSize = 22.0
    case 26...35:
      fontSize = 21.5
    case 36...40:
      fontSize = 20.5
    default:
      fontSize = 19.0
    }
    
    guard let font = Font.belerenBold(size: fontSize).nsFont else {
      return
    }
    
    let cardNameAttributes: [NSAttributedStringKey : Any] = [
      NSAttributedStringKey.font: font,
      NSAttributedStringKey.ligature: 2,
      ]
    
    let leftCardNameAttributedString =
      NSMutableAttributedString(string: card.name,
                                attributes: cardNameAttributes)
    
    leftName.attributedStringValue = leftCardNameAttributedString
    
    if let rightCard = card.childCard {
    
      let rightCardNameAttributedString =
        NSMutableAttributedString(string: rightCard.name,
                                attributes: cardNameAttributes)
    
      rightName.attributedStringValue = rightCardNameAttributedString
    }

  }
  
  override func updateManaCost(card: Card) {
    
    let fontSize: CGFloat = 23.0
    
    leftManaCost.font = Font.mplantin(size: 0.01).nsFont
    
    let manaCostParagraphStyle = NSMutableParagraphStyle()
    manaCostParagraphStyle.alignment = .right
    
    
    let manaCostAttributes: [NSAttributedStringKey : Any] = [
      NSAttributedStringKey.paragraphStyle: manaCostParagraphStyle,
      NSAttributedStringKey.baselineOffset: NSNumber(value: Double(fontSize * -0.1))
      ]
    
    let leftManaCostAttributedString =
      NSMutableAttributedString(string: card.manaCost,
                                attributes: manaCostAttributes)
    
    leftManaCostAttributedString.parseManaCost(size: fontSize, align: .right, withShadow: true)
    
    
    
    leftManaCost.attributedStringValue = leftManaCostAttributedString
    
    rightManaCost.font = Font.mplantin(size: 0.01).nsFont
    
    if let child = card.childCard {
      let rightManaCostAttributedString =
        NSMutableAttributedString(string: child.manaCost,
                                  attributes: manaCostAttributes)
    
      rightManaCostAttributedString.parseManaCost(size: fontSize, align: .right, withShadow: true)
    
    
    
      rightManaCost.attributedStringValue = rightManaCostAttributedString
    }
    
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
    
    leftTypeLine.font = Font.belerenBold(size: fontSize).nsFont
    leftTypeLineWithColorIndicator.font = Font.belerenBold(size: fontSize).nsFont
    
    let leftNameString = NSMutableString(string: card.cardType)
    
    replaceDashes(string: leftNameString)
    
    leftTypeLine.stringValue = leftNameString as String
    leftTypeLineWithColorIndicator.stringValue = leftNameString as String
    
    if let child = card.childCard {
      
      rightTypeLine.font = Font.belerenBold(size: fontSize).nsFont
      rightTypeLineWithColorIndicator.font = Font.belerenBold(size: fontSize).nsFont
      
      let rightNameString = NSMutableString(string: child.cardType)
      
      replaceDashes(string: leftNameString)
      
      rightTypeLine.stringValue = rightNameString as String
      rightTypeLineWithColorIndicator.stringValue = rightNameString as String    }
  }
  
  override func updateColorIndicator(card: Card) {
  
  }
  
  override func updateExpansionSymbol(card: Card, set: CardSet) {
    if let expansionSymbol = card.expansionSymbol {
      leftExpansionSymbol.image = expansionSymbol
      rightExpansionSymbol.image = expansionSymbol
    } else {
      switch card.rarityCode {
      case "C":
        leftExpansionSymbol.image = set.expansionSymbol.common
        rightExpansionSymbol.image = set.expansionSymbol.common
      case "U":
        leftExpansionSymbol.image = set.expansionSymbol.uncommon
        rightExpansionSymbol.image = set.expansionSymbol.uncommon
      case "R":
        leftExpansionSymbol.image = set.expansionSymbol.rare
        rightExpansionSymbol.image = set.expansionSymbol.rare
      case "M":
        leftExpansionSymbol.image = set.expansionSymbol.mythic
        rightExpansionSymbol.image = set.expansionSymbol.mythic
      case "S":
        leftExpansionSymbol.image = set.expansionSymbol.special
        rightExpansionSymbol.image = set.expansionSymbol.special
      case "L":
        leftExpansionSymbol.image = set.expansionSymbol.common
        rightExpansionSymbol.image = set.expansionSymbol.common
      case "B":
        leftExpansionSymbol.image = set.expansionSymbol.bonus
        rightExpansionSymbol.image = set.expansionSymbol.bonus
      default:
        leftExpansionSymbol.image = set.expansionSymbol.common
        rightExpansionSymbol.image = set.expansionSymbol.common
      }
    }
  }
  
  func rulesTextFontSize(card: Card, string: String) -> CGFloat {
    
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
      countCardname = regex.numberOfMatches(in: string,
                                            options: .reportCompletion,
                                            range: NSRange(location: 0,
                                                           length: card.rulesText.characters.count))
      excessCharacters += countCardname * (card.name.characters.count - 10)
    }
    
    if let regex = try? NSRegularExpression(pattern: "\\{.\\}", options: .useUnixLineSeparators) {
      countCardname = regex.numberOfMatches(in: string,
                                            options: .reportCompletion,
                                            range: NSRange(location: 0,
                                                           length: card.rulesText.characters.count))
      
      excessCharacters += countCardname * 3
    }
    
    if let regex = try? NSRegularExpression(pattern: "\\{...\\}", options: .useUnixLineSeparators) {
      countCardname = regex.numberOfMatches(in: string,
                                            options: .reportCompletion,
                                            range: NSRange(location: 0,
                                                           length: card.rulesText.characters.count))
      
      excessCharacters += countCardname * 5
    }
    
    if excessCharacters <= 0 {
      excessCharacters = 0
    }
    
    let defaultSize = CGFloat(card.baseFontSize - 2)
    
    var scaleFactor: CGFloat = 1.0
    
    switch string.characters.count + excessCharacters {
      
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
  
  override func updateRulesText(card: Card) {
    
    let fontSize = rulesTextFontSize(card: card, string: card.rulesText)
    
    leftRulesText.font = Font.mplantin(size: fontSize).nsFont
    
    let leftRulesTextParagraphStyle = NSMutableParagraphStyle()
    
    leftRulesTextParagraphStyle.paragraphSpacing = 0.3 * fontSize
    leftRulesTextParagraphStyle.maximumLineHeight = fontSize * 1.4
    leftRulesTextParagraphStyle.paragraphSpacingBefore = 1
    
    if card.centerRulesText == true {
      leftRulesTextParagraphStyle.alignment = .center
    } else {
      leftRulesTextParagraphStyle.alignment = .left
    }
    
    let leftRulesTextAttributes: [NSAttributedStringKey : Any] = [
      NSAttributedStringKey.paragraphStyle: leftRulesTextParagraphStyle,
      NSAttributedStringKey.baselineOffset: NSNumber(value: Double(fontSize * 0.1))
      ]
    
    let leftRulesTextAttributedString =
      NSMutableAttributedString(string: card.rulesText,
                                attributes: leftRulesTextAttributes)
    
    replaceCardName(string: leftRulesTextAttributedString.mutableString, with: card.name)
    
    parseBodyText(string: leftRulesTextAttributedString, size: fontSize, align: leftRulesTextParagraphStyle.alignment)
    
    filterEmphasis(italic: true, string: leftRulesTextAttributedString, size: fontSize, align: leftRulesTextParagraphStyle.alignment)
    
    leftRulesText.attributedStringValue = leftRulesTextAttributedString
    
    if let child = card.childCard {
      
      let fontSize = rulesTextFontSize(card: child, string: child.rulesText)
      
      rightRulesText.font = Font.mplantin(size: fontSize).nsFont
      
      let rightRulesTextParagraphStyle = NSMutableParagraphStyle()
      
      rightRulesTextParagraphStyle.paragraphSpacing = 0.3 * fontSize
      rightRulesTextParagraphStyle.maximumLineHeight = fontSize * 1.4
      rightRulesTextParagraphStyle.paragraphSpacingBefore = 1
      
      if child.centerRulesText == true {
        rightRulesTextParagraphStyle.alignment = .center
      } else {
        rightRulesTextParagraphStyle.alignment = .left
      }
      
      let rightRulesTextAttributes: [NSAttributedStringKey : Any] = [
        NSAttributedStringKey.paragraphStyle: rightRulesTextParagraphStyle,
        NSAttributedStringKey.baselineOffset: NSNumber(value: Double(fontSize * 0.1))
        ]

      
      let rightRulesTextAttributedString =
        NSMutableAttributedString(string: child.rulesText,
                                  attributes: rightRulesTextAttributes)
      
      replaceCardName(string: rightRulesTextAttributedString.mutableString, with: card.name)
      
      parseBodyText(string: rightRulesTextAttributedString, size: fontSize, align: rightRulesTextParagraphStyle.alignment)
      
      filterEmphasis(italic: true, string: rightRulesTextAttributedString, size: fontSize, align: rightRulesTextParagraphStyle.alignment)
      
      rightRulesText.attributedStringValue = rightRulesTextAttributedString
    }
  }
  
  override func updateRarityCode(card: Card) {
    rarityCode.font = Font.relay(size: 11.5).nsFont
    rightRarityCode.font = Font.relay(size: 11.5).nsFont
    rarityCode.stringValue = card.rarityCode
    rightRarityCode.stringValue = card.rarityCode
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
    rightCollectorNumber.font = Font.relay(size: 11.5).nsFont
    collectorNumber.stringValue = set.collectorNumber(card: card)
    rightCollectorNumber.stringValue = set.collectorNumber(card: card)
  }
  
  override func updateArtistName(card: Card) {
    let font = Font.belerenSmallCaps(size: 11.5).nsFont
    leftArtistName.font = font
    
    leftArtistName.stringValue = card.artistName
    
    if let child = card.childCard {
      rightArtistName.font = font
      rightArtistName.stringValue = child.artistName
    }
  }
  
  override func updateSetInfo(card: Card, set: CardSet) {
    setCode.font = Font.relay(size: 11.5).nsFont
    rightSetCode.font = Font.relay(size: 11.5).nsFont
    setCode.stringValue = "\(set.code) • \(set.language.rawValue)"
    rightSetCode.stringValue = "\(set.code) • \(set.language.rawValue)"
  }
  
  func updateWatermark(card: Card) {
    
    leftWatermark.image = card.watermark
    if card.watermark != nil {
      leftWatermark.isHidden = false
    } else {
      leftWatermark.isHidden = true
    }
    
    leftWatermark.alphaValue = CGFloat(card.watermarkOpacity)
    
    if let child = card.childCard {
      
      rightWatermark.image = child.watermark
      if child.watermark != nil {
        rightWatermark.isHidden = false
      } else {
        rightWatermark.isHidden = true
      }
      
      rightWatermark.alphaValue = CGFloat(child.watermarkOpacity)
    }
  }

}
