//
//  CardTemplateView.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-31.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class CardTemplateView: NSView {
  
  @IBOutlet weak var collectorNumber: NSTextField!
  @IBOutlet weak var expansionSymbol: NSImageView!
  @IBOutlet weak var art: NSImageView!
  
  enum Font {
    case belerenBold(size: CGFloat)
    case belerenSmallCaps(size: CGFloat)
    case mplantin(size: CGFloat)
    case mplantinItalic(size: CGFloat)
    case mplantinBold(size: CGFloat)
    case relay(size: CGFloat)
    case phyrexian(size: CGFloat)
    
    var nsFont: NSFont! {
      switch self {
      case let .belerenBold(size):
        return NSFont(name: "JaceBeleren Bold", size: size)
      case let .belerenSmallCaps(size):
        return NSFont(name: "Beleren Small Caps Bold", size: size)
      case let .mplantin(size):
        return NSFont(name: "MPlantin", size: size)
      case let .mplantinItalic(size):
        return NSFont(name: "MPlantin-Italic", size: size)
      case let .mplantinBold(size):
        return NSFont(name: "MPlantin-Bold", size: size)
      case let .relay(size):
        return NSFont(name: "Relay-Medium", size: size)
      case let .phyrexian(size):
        return NSFont(name: "Phyrexian Regular", size: size)
      }
    }
  }
  
  func update(card: Card, set: CardSet) {}
  
  func updateCardFrame(card: Card) {}
  
  func updateBorder(card: Card) {}
  
  func updateCardName(card: Card) {}
  
  func updateManaCost(card: Card) {}
  
  func updateArt(card: Card) {
    let image = card.processedArt
    art.image = image
    if image != nil {
      if let doc = NSDocumentController.shared.currentDocument as? Document {
        doc.artZoomView.image = art.image
        doc.artZoomSlider.doubleValue = card.artZoomFactor
        doc.artRotation.floatValue = card.artRotation
        doc.artOffsetXSlider.doubleValue = card.artOffsetX
        doc.artOffsetYSlider.doubleValue = card.artOffsetY
      }
    } else {
      if let doc = NSDocumentController.shared.currentDocument as? Document {
        doc.artZoomView.image = nil
        doc.artOffsetXSlider.doubleValue = 0.0
        doc.artOffsetYSlider.doubleValue = 0.0
        doc.artZoomSlider.doubleValue = 0.0
        doc.artRotation.floatValue = 0.0
      }
    }
  }
  
  func updateDateOverlay(card: Card) {}
  
  func updateTypeLine(card: Card) {}
  
  func updateColorIndicator(card: Card) {}
  
  func updateExpansionSymbol(card: Card, set: CardSet) {}
  
  func updateTextBoxVisibility(card: Card) {}
  
  func updateRulesText(card: Card) {}
  
  func updateFlavorText(card: Card) {}
  
  func updatePTBox(card: Card) {}
  
  func updateRarityCode(card: Card) {}
  
  func updatePromoText(card: Card) {}
  
  func updateCopyright(card: Card, set: CardSet) {}
  
  func updateCollectorNumber(card: Card, set: CardSet) {}
  
  func updateArtistName(card: Card) {}
  
  func updateSetInfo(card: Card, set: CardSet) {}
  
  func updatePlaneswalkerInfo(card: Card) {}
  
  func updateTextBox(card: Card) {}
  
  func updateBackgroundTexture(card: Card) {}
  
  func updateTitlebarAndTypeLine(card: Card) {}
  
  func updateFrameBorder(card: Card) {}
  
  func updateExpansionSymbolVisibility(card: Card, set: CardSet) {
    expansionSymbol.isHidden = set.hideExpansionSymbol
  }
  
  override func performDragOperation(_ info: NSDraggingInfo) -> Bool {
    let pboard = info.draggingPasteboard()
	
	#if swift(>=4.0)
		let NSURLPboardType = NSPasteboard.PasteboardType(kUTTypeURL as String)
	#endif
	
    if pboard.types!.contains(NSURLPboardType) {
	  let fileURL = NSURL(from: pboard)! as URL
      let image = NSImage(contentsOf: fileURL)
      (NSDocumentController.shared.currentDocument as! Document).card?.artData = image
    }
    return true
  }
}
