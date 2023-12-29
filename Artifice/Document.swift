//
//  Document.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa
import Quartz

@objc
class Document: NSDocument {
  
  var set = CardSet()
  var card: Card?

  var searchResults = [Card]()

  @IBOutlet weak var docWindow: NSWindow!
  
  @IBOutlet weak var searchField: NSSearchField!
  
  @IBOutlet weak var setTitleLabel: NSTextField!
  @IBOutlet weak var statusbarLabel: NSTextField!
  
  var isFullscreen = false
  
  @IBOutlet weak var cardsTable: NSTableView!
  
  @IBOutlet weak var progressSheet: NSWindow!
  
  @IBOutlet weak var progressLabel: NSTextField!
  @IBOutlet weak var progressLabelBottom: NSTextField!
  
  @IBOutlet weak var progressBar: NSProgressIndicator!
  
  @IBOutlet weak var progressSpinner: NSProgressIndicator!
  
  @IBOutlet weak var shareButtonContextMenu: NSMenu!
  
  @IBOutlet weak var cardNameField: NSTextField!
  @IBOutlet weak var manaCostField: NSTextField!
  @IBOutlet weak var typeLineField: NSTextField!
  @IBOutlet weak var rulesTextField: NSTextField!
  @IBOutlet weak var flavorTextField: NSTextField!
  @IBOutlet weak var rarityPopUpButton: NSPopUpButton!
  @IBOutlet weak var powerField: NSTextField!
  @IBOutlet weak var toughnessField: NSTextField!
  @IBOutlet weak var artistNameField: NSTextField!
  @IBOutlet weak var centerRulesTextButton: NSButton!
  
  @IBOutlet weak var cardBorderBlackRadioButton: NSButton!
  @IBOutlet weak var cardBorderWhiteRadioButton: NSButton!
  @IBOutlet weak var cardBorderSilverRadioButton: NSButton!
  @IBOutlet weak var cardBorderGoldRadioButton: NSButton!
  
  @IBOutlet weak var useColorIndicatorButton: NSButton!
  @IBOutlet weak var isAllColorsCheckButton: NSButton!
  @IBOutlet weak var isColorlessCheckButton: NSButton!
  @IBOutlet weak var isWhiteCheckButton: NSButton!
  @IBOutlet weak var isBlueCheckButton: NSButton!
  @IBOutlet weak var isBlackCheckButton: NSButton!
  @IBOutlet weak var isRedCheckButton: NSButton!
  @IBOutlet weak var isGreenCheckButton: NSButton!
  @IBOutlet weak var cardNotesField: NSTextField!
  @IBOutlet weak var useManaSymbolCheckButton: NSButton!
  
  @IBOutlet weak var setBorderBlackRadioButton: NSButton!
  @IBOutlet weak var setBorderWhiteRadioButton: NSButton!
  @IBOutlet weak var setBorderSilverRadioButton: NSButton!
  @IBOutlet weak var setBorderGoldRadioButton: NSButton!
  
  @IBOutlet weak var promoTextField: NSTextField!
  @IBOutlet weak var dateOverlayField: NSTextField!
  @IBOutlet weak var cardExpansionSymbolButton: NSButton!
  @IBOutlet weak var cardTemplateSelectionPopUpButton: NSPopUpButton!
  @IBOutlet weak var cardWatermarkButton: NSButton!
  @IBOutlet weak var cardClearWatermarkButton: NSButton!
  
  @IBOutlet weak var cardWatermarkOpacitySlider: NSSlider!
  @IBOutlet weak var cardWatermarkOpacityPercent: NSTextField!
  @IBOutlet weak var splitCardWatermarkOpacityPercent: NSTextField!
  
  @IBOutlet weak var etbTappedCheckButton: NSButton!
  
  
  @IBOutlet weak var setNameField: NSTextField!
  @IBOutlet weak var setDescriptionField: NSTextField!
  @IBOutlet weak var setCodeField: NSTextField!
  @IBOutlet weak var yearField: NSTextField!
  @IBOutlet weak var copyrightField: NSTextField!
  @IBOutlet weak var commonExpansionSymbolButton: NSButton!
  @IBOutlet weak var uncommonExpansionSymbolButton: NSButton!
  @IBOutlet weak var rareExpansionSymbolButton: NSButton!
  @IBOutlet weak var mythicRareExpansionSymbolButton: NSButton!
  @IBOutlet weak var specialRarityExpansionSymbolButton: NSButton!
  @IBOutlet weak var bonusRarityExpansionSymbolButton: NSButton!
  @IBOutlet weak var setLanguagePopUpButton: NSPopUpButton!
  @IBOutlet weak var exportResolutionPopUpButton: NSPopUpButton!
  @IBOutlet weak var pngExportWideBorderButton: NSButton!
  @IBOutlet weak var hideExpansionSymbolButton: NSButton!
  @IBOutlet weak var setDefaultPromoTextField: NSTextField!
  
  @IBOutlet weak var tabs: NSTabView!
  
  @IBOutlet var planeswalkerInfoTabItem: NSTabViewItem!
  @IBOutlet var planeswalkerInfoView: NSView!
  
  @IBOutlet weak var startingLoyaltyTextField: NSTextField!
  
  @IBOutlet weak var planeswalkerAbility1Cost: NSTextField!
  @IBOutlet weak var planeswalkerAbility2Cost: NSTextField!
  @IBOutlet weak var planeswalkerAbility3Cost: NSTextField!
  @IBOutlet weak var planeswalkerAbility4Cost: NSTextField!
  
  @IBOutlet weak var planeswalkerAbility1rulesText: NSTextField!
  @IBOutlet weak var planeswalkerAbility2rulesText: NSTextField!
  @IBOutlet weak var planeswalkerAbility3rulesText: NSTextField!
  @IBOutlet weak var planeswalkerAbility4rulesText: NSTextField!
  
  
  @IBOutlet weak var statisticsSheet: NSWindow!
  
  @IBOutlet weak var statisticsDoneButton: NSButton!
  
  var statisticsVisible: Bool = false
  
  @IBOutlet weak var commonBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var uncommonBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var rareBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var mythicBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var specialBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var bonusBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var basicLandBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var tokenBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var promoBarHeightConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var commonCount: NSTextField!
  @IBOutlet weak var uncommonCount: NSTextField!
  @IBOutlet weak var rareCount: NSTextField!
  @IBOutlet weak var mythicCount: NSTextField!
  @IBOutlet weak var specialCount: NSTextField!
  @IBOutlet weak var bonusCount: NSTextField!
  @IBOutlet weak var basicLandCount: NSTextField!
  @IBOutlet weak var tokenCount: NSTextField!
  @IBOutlet weak var promoCount: NSTextField!
  
  
  @IBOutlet weak var whiteBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var blueBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var blackBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var redBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var greenBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var colorlessBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var multicoloredBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var landBarHeightConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var whiteCount: NSTextField!
  @IBOutlet weak var blueCount: NSTextField!
  @IBOutlet weak var blackCount: NSTextField!
  @IBOutlet weak var redCount: NSTextField!
  @IBOutlet weak var greenCount: NSTextField!
  @IBOutlet weak var colorlessCount: NSTextField!
  @IBOutlet weak var multicoloredCount: NSTextField!
  @IBOutlet weak var landCount: NSTextField!
  
  @IBOutlet weak var creatureBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var sorceryBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var instantBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var artifactBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var enchantmentBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var planeswalkerBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var landTypeBarHeightConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var creatureCount: NSTextField!
  @IBOutlet weak var sorceryCount: NSTextField!
  @IBOutlet weak var instantCount: NSTextField!
  @IBOutlet weak var artifactCount: NSTextField!
  @IBOutlet weak var enchantmentCount: NSTextField!
  @IBOutlet weak var planeswalkerCount: NSTextField!
  @IBOutlet weak var landTypeCount: NSTextField!
  
  @IBOutlet weak var artZoomView: NSImageView!
  @IBOutlet weak var artZoomSlider: NSSlider!
  @IBOutlet weak var artOffsetXSlider: NSSlider!
  @IBOutlet weak var artOffsetYSlider: NSSlider!
  @IBOutlet weak var artRotation: NSSlider!
  
  @IBOutlet weak var setInfoSheet: NSWindow!
  
  @IBOutlet weak var portraitCardViewWrapper: NSView!
  @IBOutlet weak var landscapeCardViewWrapper: NSView!
  
  @IBOutlet weak var portraitCardView: CardView!
  @IBOutlet weak var landscapeCardView: CardView!

  @IBOutlet weak var splitCardRightNameTextField: NSTextField!
  @IBOutlet weak var splitCardRightManaCostTextField: NSTextField!
  @IBOutlet weak var splitCardRightCardTypeTextField: NSTextField!
  @IBOutlet weak var splitCardRightRulesTextTextField: NSTextField!
  @IBOutlet weak var splitCardRightArtistNameTextField: NSTextField!
  @IBOutlet weak var splitCardRightCenterRulesTextButton: NSButton!
  
  @IBOutlet weak var splitCardRightIncreaseFontSizeButton: NSButton!
  @IBOutlet weak var splitCardRightDecreaseFontSizeButton: NSButton!
  
  var cardView: CardView! {
    if let card = card {
      if card.template == .split {
        return landscapeCardView
      }
      return portraitCardView
    }
    return nil
  }
  
  @IBOutlet weak var portraitCardViewLeadingSpace: NSLayoutConstraint!
  @IBOutlet weak var landscapeCardViewLeadingSpace: NSLayoutConstraint!
  
  @IBOutlet var splitCardInfoTabItem: NSTabViewItem!
  @IBOutlet var splitCardArtTabItem: NSTabViewItem!
  @IBOutlet var splitCardInfoView: NSView!
  @IBOutlet var splitCardArtView: NSView!
  
  @IBOutlet weak var splitCardArtZoomSlider: NSSlider!
  @IBOutlet weak var splitCardArtOffsetXSlider: NSSlider!
  @IBOutlet weak var splitCardArtOffsetYSlider: NSSlider!
  @IBOutlet weak var splitCardArtRotationSlider: NSSlider!
  @IBOutlet weak var splitCardArtZoomView: NSImageView!
  
  @IBOutlet weak var shareButton: NSSegmentedControl!
  @IBOutlet weak var shareMenu: NSMenu!
  
  var setInfoVisible: Bool = false
  
  override func defaultDraftName() -> String {
    return "Untitled Set"
  }
  
  override init() {
      super.init()
    // Add your subclass-specific initialization here.
    set = CardSet()
    displayName = set.name
    
    hasUndoManager = true
    
  }

  override var windowNibName: NSNib.Name? {
    // Returns the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
	return NSNib.Name(rawValue: "Document")
  }

  override class var autosavesInPlace: Bool {
    return true
  }

  override func data(ofType typeName: String) throws -> Data {
    // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
    
    return NSKeyedArchiver.archivedData(withRootObject: set)
  }

  override func read(from data: Data, ofType typeName: String) throws {
    // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
    // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
    
    guard let set = NSKeyedUnarchiver.unarchiveObject(with: data) as? CardSet  else {
      return
    }
    
    self.set = set
    if set.cards.count > 0 {
      card = set.cards[0]
    }
    self.searchResults = set.cards
    displayName = set.name
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    cardsTable.selectRowIndexes(IndexSet(integer: 0), byExtendingSelection: false)
    let index = cardsTable.selectedRow
    if index >= 0 {
      card = searchResults[index]
      updateForm()
      if let card = card {
        if card.template == .split {
          showLandscape()
        } else {
          showPortrait()
        }
        cardView.update(card: card, set: set)
      }
    }
    planeswalkerInfoTabItem.label = "Planeswalker Info"
    planeswalkerInfoTabItem.view = planeswalkerInfoView
    splitCardInfoTabItem.label = "Split Card Info"
    splitCardInfoTabItem.view = splitCardInfoView
    splitCardArtTabItem.label = "Split Card Art"
    splitCardArtTabItem.view = splitCardArtView
    
    shareButton.setMenu(shareMenu, forSegment: 0)
  }
  
  
  @IBAction func exportCurrentSetToGathererText(_ sender: AnyObject) {
    let dialog = NSSavePanel()
    dialog.allowedFileTypes = ["txt"]
    dialog.nameFieldStringValue = set.name
    guard let window = windowForSheet else { return }
    dialog.beginSheetModal(for: window) { [unowned self] response in
      guard let url = dialog.url else {
        return
      }
      do {
        try self.set.gathererText.write(to: url,
                                        atomically: false,
                                        encoding: .utf8)
      }
      catch {
        
      }
    }
  }
  
  
  @IBAction func exportCurrentSetToCockatriceCustomSet(_ sender: AnyObject) {let dialog = NSOpenPanel()
    
    dialog.canChooseFiles = false
    dialog.canCreateDirectories = true
    dialog.canChooseDirectories = true
    
    self.progressLabel.stringValue = "Exporting \(self.set.name) to Cockatrice"
    self.progressLabel.needsDisplay = true
    
    guard let window = windowForSheet else { return }
    
    dialog.beginSheetModal(for: window) { [unowned self] response in
      guard let baseUrl = dialog.url else {
        return
      }
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      
      dialog.close()
      
        DispatchQueue.global().async {
        
        window.beginSheet(self.progressSheet, completionHandler: nil)
        
        self.progressSpinner.startAnimation(nil)
        
        self.progressBar.minValue = 0.0
        self.progressBar.maxValue = Double(self.set.cards.count)
        self.progressBar.doubleValue = 0.0
        
        let cards = self.set.cards.filter { card in
          card.rarityCode != "T"
        }
        
        let exportSize = NSSize(width: 413, height: 563)
        
        for card in cards {
          DispatchQueue.main.sync {
            var name = card.name
            
            if card.template == .split {
              if let child = card.childCard {
                name += " // " + child.name
              }
            }
            
            if card.template == .split {
              self.landscapeCardView.update(card: card, set: self.set)
            } else {
              self.portraitCardView.update(card: card, set: self.set)
            }
            self.progressLabelBottom.stringValue = "\(name)"
            self.progressLabelBottom.needsDisplay = true
          }
          
          var name = card.name
          
          if card.template == .split {
            if let child = card.childCard {
              name += child.name
            }
          }
          
          let nameMT = NSMutableString(string: name)
          
          nameMT.replaceOccurrences(of: "“",
                                    with: "",
                                    options: .literal,
                                    range: NSRange(
                                      location: 0,
                                      length: nameMT.length))
          
          nameMT.replaceOccurrences(of: "”",
                                    with: "",
                                    options: .literal,
                                    range: NSRange(
                                      location: 0,
                                      length: nameMT.length))
          
          nameMT.replaceOccurrences(of: "‘",
                                    with: "\'",
                                    options: .literal,
                                    range: NSRange(
                                      location: 0,
                                      length: nameMT.length))
          
          nameMT.replaceOccurrences(of: "’",
                                    with: "\'",
                                    options: .literal,
                                    range: NSRange(
                                      location: 0,
                                      length: nameMT.length))
          
          let filteredName = nameMT as String
          
          let filename = "\(filteredName).png"
          
          let pngUrl = baseUrl.appendingPathComponent(filename)
          
          DispatchQueue.main.sync {
            let data: Data
            
            if card.template == .split {
              guard let pngData = self.landscapeCardView.pngRepresentation(size: exportSize) else {
              return
              }
              data = pngData
            } else {
              guard let pngData = self.portraitCardView.pngRepresentation(size: exportSize) else {
                return
              }
              data = pngData
            }
            
            do {
              try data.write(to: pngUrl)
            }
            catch {
              return
            }
            
            self.progressBar.increment(by: 1.0)
            self.progressBar.needsDisplay = true
          }
        }
        
        DispatchQueue.main.sync {
          if let card = self.card {
            self.cardView.update(card: card, set: self.set)
          }
        }
        
        DispatchQueue.main.sync {
          self.progressLabelBottom.stringValue = "Cockatrice XML Database"
          self.progressLabelBottom.needsDisplay = true
        }
        
        let xmlURL = baseUrl.appendingPathComponent("01.customcards.xml")
        
        do {
          try self.set.cockatriceXML.write(to: xmlURL,
                                           atomically: false,
                                           encoding: .utf8)
        }
        catch {
          
        }
        self.progressSpinner.stopAnimation(nil)
        window.endSheet(self.progressSheet)
      }
    }
  }
  
  @IBAction func exportCurrentCardToPDF(_ sender: AnyObject) {
    
    let dialog = NSSavePanel()
    dialog.allowedFileTypes = ["pdf"]
    if let name = card?.name {
      dialog.nameFieldStringValue = name
    }
    guard let window = windowForSheet else { return }
    dialog.beginSheetModal(for: window) { [unowned self] response in
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      
      guard let url = dialog.url else {
        return
      }
      
      self.exportToPDF(cardView: self.cardView, url: url)
    }
  }
  
  func exportToPDF(cardView: CardView, url: URL) {
    
    guard let data = cardView.pdfRepresentation() else {
      return
    }
    
    do {
      try data.write(to: url)
    }
    catch {
      return
    }
  }
  
  @IBAction func exportSetToPDF(_ sender: AnyObject) {
    
    let dialog = NSOpenPanel()
    dialog.canChooseFiles = false
    dialog.canCreateDirectories = true
    dialog.canChooseDirectories = true
    
    guard let window = windowForSheet else {
      return
    }
    
    self.progressLabel.stringValue = "Exporting \(set.name) to PDF"
    self.progressLabel.needsDisplay = true
    
    dialog.beginSheetModal(for: window) { [unowned self]response in
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      
      dialog.close()
      
      DispatchQueue.global().async {
        
        window.beginSheet(self.progressSheet, completionHandler: nil)
        
        self.progressSpinner.startAnimation(nil)
        
        self.progressBar.minValue = 0.0
        self.progressBar.maxValue = Double(self.set.cards.count)
        self.progressBar.doubleValue = 0.0
        
        for card in self.set.cards {
          
          DispatchQueue.main.sync {
            self.landscapeCardView.update(card: card, set: self.set)
            self.portraitCardView.update(card: card, set: self.set)
            self.progressLabelBottom.stringValue = "\(card.name)"
            self.progressLabelBottom.needsDisplay = true
          }
          
          guard let activeTemplate = self.cardView.activeTemplate else {
            return
          }
          
          let filename: String
          
          if !card.isToken {
            filename = "\(activeTemplate.collectorNumber.stringValue.replacingOccurrences(of: "/", with: " of ")) - \(card.name).pdf"
          } else {
            filename = "Token \(activeTemplate.collectorNumber.stringValue.replacingOccurrences(of: "/", with: " of ")) - \(card.name).pdf"
          }
          
          guard let url = dialog.url?.appendingPathComponent(filename) else {
            return
          }
          
          DispatchQueue.main.sync {
            if card.template == .split {
              self.exportToPDF(cardView: self.landscapeCardView, url: url)
            } else {
              self.exportToPDF(cardView: self.portraitCardView, url: url)
            }
            self.progressBar.increment(by: 1.0)
            self.progressBar.needsDisplay = true
          }
        }
        DispatchQueue.main.sync {
          if let card = self.card {
            self.cardView.update(card: card, set: self.set)
          }
        }
        
        self.progressSpinner.stopAnimation(nil)
        window.endSheet(self.progressSheet)
      }
    }
  }
  
  @IBAction func exportSetToPNG(_ sender: AnyObject) {
    
    let dialog = NSOpenPanel()
    dialog.canChooseFiles = false
    dialog.canCreateDirectories = true
    dialog.canChooseDirectories = true
    
    guard let window = windowForSheet else {
      return
    }
    self.progressLabel.stringValue = "Exporting \(set.name) to PNG"
    self.progressLabel.needsDisplay = true
    
    dialog.beginSheetModal(for: window) { [unowned self] response in
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      
      guard let baseUrl = dialog.url else {
        return
      }
      
      dialog.close()
      
      DispatchQueue.global().async {
        
        window.beginSheet(self.progressSheet, completionHandler: nil)
        
        self.progressSpinner.startAnimation(nil)
        
        self.progressBar.minValue = 0.0
        self.progressBar.maxValue = Double(self.set.cards.count)
        self.progressBar.doubleValue = 0.0
        
        for card in self.set.cards {
          
          DispatchQueue.main.sync {
            self.landscapeCardView.update(card: card, set: self.set)
            self.portraitCardView.update(card: card, set: self.set)
            self.progressLabelBottom.stringValue = "\(card.name)"
            self.progressLabelBottom.needsDisplay = true
          }
          
          var res: Int
          switch self.set.exportResolution {
          case .low:
            res = 72
          case .medium:
            res = 150
          case .high:
            res = 300
          case .extreme:
            res = 600
          }
          
          guard let activeTemplate = self.cardView.activeTemplate else {
            return
          }
          
          let filename: String
          
          if !card.isToken {
            filename = "\(activeTemplate.collectorNumber.stringValue.replacingOccurrences(of: "/", with: " of ")) - \(card.name) - \(res)dpi.png"
          } else {
            filename = "Token \(activeTemplate.collectorNumber.stringValue.replacingOccurrences(of: "/", with: " of ")) - \(card.name) - \(res)dpi.png"
          }
          
          let url = baseUrl.appendingPathComponent(filename)
          
          DispatchQueue.main.sync {
            let data: Data
            
            if card.template == .split {
              guard let pngdata = self.landscapeCardView.pngRepresentation(size: self.set.exportSize) else {
                return
              }
              data = pngdata
            } else {
              guard let pngdata = self.portraitCardView.pngRepresentation(size: self.set.exportSize) else {
                return
              }
              data = pngdata
            }
            
            do {
              try data.write(to: url)
            }
            catch {
              return
            }
            
            self.progressBar.increment(by: 1.0)
            self.progressBar.needsDisplay = true
          }
          
        }
        
        DispatchQueue.main.sync {
          if let card = self.card {
            self.cardView.update(card: card, set: self.set)
          }
        }
        
        self.progressSpinner.stopAnimation(nil)
        window.endSheet(self.progressSheet)
      }
    }
  }
  
  @IBAction func exportCurrentCardToPNG(_ sender: AnyObject) {
    let dialog = NSSavePanel()
    dialog.allowedFileTypes = ["png"]
    
    if let name = card?.name {
      var res: Int
      switch set.exportResolution {
      case .low:
        res = 72
      case .medium:
        res = 150
      case .high:
        res = 300
      case .extreme:
        res = 600
      }
      
      dialog.nameFieldStringValue = "\(name) - \(res)dpi"
    }
    guard let window = windowForSheet else { return }
    
    dialog.beginSheetModal(for: window) { [unowned self] response in
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      
      guard
        let url = dialog.url,
        let data = self.cardView.pngRepresentation(size: self.set.exportSize)
      else {
          return
      }
      
      do {
        try data.write(to: url)
      }
      catch {
        return
      }
    }
  }
  
  @IBAction func duplicateSelectedCardButtonClicked(_ sender: AnyObject) {
    guard let original = card else {
      return
    }
    
    let archive = NSKeyedArchiver.archivedData(withRootObject: original)
    let copy: Card = NSKeyedUnarchiver.unarchiveObject(with: archive) as! Card
    
    set.cards.append(copy)
    set.sortCards()
    updateSearchResults()
    cardsTable.reloadData()
    updateForm()
    if let card = card {
      cardView.update(card: card, set: set)
    }
  }
  
  @IBAction func copy(_ sender: AnyObject) {
    guard let original = card else {
      return
    }
    
    let archive = NSKeyedArchiver.archivedData(withRootObject: original)
    NSPasteboard.general.clearContents()
    NSPasteboard.general.declareTypes([NSPasteboard.PasteboardType(rawValue: "encodedCard"), NSPasteboard.PasteboardType(rawValue: "public.png")], owner: nil)
    NSPasteboard.general.setData(archive, forType: NSPasteboard.PasteboardType(rawValue: "encodedCard"))
    
    let image = cardView.pngRepresentation(size: set.narrowExportSize)
    NSPasteboard.general.setData(image, forType: NSPasteboard.PasteboardType(rawValue: "public.png"))
    
  }
  
  @IBAction func paste(_ sender: AnyObject) {
    
    if let archive = NSPasteboard.general.data(forType: NSPasteboard.PasteboardType(rawValue: "encodedCard")) {
  
      let copy = NSKeyedUnarchiver.unarchiveObject(with: archive) as! Card
      
      set.cards.append(copy)
      set.sortCards()
      cardsTable.reloadData()
      
      guard let idx = set.cards.index(of: copy) else {
        return
      }
      
      updateSearchResults()
      cardsTable.reloadData()
      
      let index = IndexSet(integer: idx)
      
      cardsTable.selectRowIndexes(index, byExtendingSelection: false)
      
      updateDocument()
      return
    }
    /*
	if let url = NSURL(from: NSPasteboard.general) as URL? {
      let image = NSImage(contentsOf: url, dpi: 72.0)
      
      card?.artData = image
      card?.artOffsetY = 0.0
      card?.artOffsetX = 0.0
      card?.artZoomFactor = 1.0
      card?.artRotation = 0.0
      
      updateDocument()
      return
    }
    
    let classArray = [NSImage.self]
    let options = [NSPasteboard.ReadingOptionKey: Any]()
    let ok = NSPasteboard.general.canReadObject(forClasses: classArray,
                                                  options: options)
    if ok {
      if let image = NSPasteboard.general.readObjects(forClasses: classArray,
                                                        options: options)?[0] as? NSImage {
      
        guard let ref = image.toCGImageRef() else { return }
        
        let rep = NSBitmapImageRep(cgImage: ref.takeRetainedValue())
          
        guard let imageData = rep.representation(using: .png, properties: [NSBitmapImageRep.PropertyKey : Any]()) else { return }
      
        let fixedImage = NSImage(data: imageData, dpi: 72.0)
      
        card?.artData = fixedImage
        card?.artOffsetY = 0.0
        card?.artOffsetX = 0.0
        card?.artZoomFactor = 1.0
        card?.artRotation = 0.0
      
        updateDocument()
      }
      return
    }
    */
  }
  
  @IBAction func cut(_ sender: AnyObject) {
    copy(self)
    deleteCard(self)
  }
  
  func pdfPages() -> [Data] {
    
    let cardSize = NSSize(width: 550, height: 750)
    
    let rect = NSRect(x: -10000, y: -10000, width: 1602, height: 2078)
    
    let tempWindow = NSWindow(contentRect: rect,
                              styleMask: NSWindow.StyleMask.borderless,
                              backing: .nonretained,
                              defer: false)
  
    let pageView = MultiCardPrintableViewLetter(frame: tempWindow.frame)
    
    tempWindow.contentView = pageView
    
    pageView.lockFocus()
    
    var pages = [Data]()

    for page in set.paginated() {
      for index in 0...5 {
        if index <= page.count - 1 {
          cardView.update(card: page[index], set: set)
          guard
            let rep = cardView.pngRepresentation(size: cardSize),
            let image = NSImage(data: rep) else { return pages }
            pageView[index] = image.rotated(90.0)
        } else {
          pageView[index] = NSImage(named: NSImage.Name(rawValue: "Blank Card Face - Landscape"))
        }
      }
      
      let font = CardTemplateView.Font.belerenBold(size: 48).nsFont
      pageView.setName.font = font
      pageView.pageNumber.font = font
      
      pageView.setName.stringValue = set.name
      pageView.pageNumber.stringValue = "Page \(pages.count + 1)"
      pageView.expansionSymbol.image = set.expansionSymbol.common
      
      pageView.needsDisplay = true
      let data = pageView.dataWithPDF(inside: pageView.bounds)
      pages.append(data)
    }
    
    if let card = card {
      cardView.update(card: card, set: set)
    }
    
    pageView.unlockFocus()
    
    return pages
  }
  
  @IBAction func exportSetToPagedPDF(_ sender: AnyObject) {
    
    var pages = [Data]()
    
    let pagedSet = set.paginated()
    
    let cardSize = NSSize(width: 550, height: 750)
    
    let rect = NSRect(x: -10000, y: -10000, width: 1602, height: 2078)
    
    let tempWindow = NSWindow(contentRect: rect,
                              styleMask: NSWindow.StyleMask.borderless,
                              backing: .nonretained,
                              defer: false)
    
    let pageView = MultiCardPrintableViewLetter(frame: tempWindow.frame)
    
    tempWindow.contentView = pageView
    
    let font = CardTemplateView.Font.belerenBold(size: 48).nsFont
    pageView.setName.font = font
    pageView.pageNumber.font = font
    
    //---
    
    let dialog = NSSavePanel()
    dialog.nameFieldStringValue = set.name
    dialog.allowedFileTypes = ["pdf"]
    dialog.canCreateDirectories = true
    
    self.progressLabel.stringValue = "Exporting \(set.name) to Multi-Page PDF"
    self.progressLabelBottom.stringValue = "Rendering Page 1 of \(pagedSet.count)"
    self.progressLabel.needsDisplay = true
    
    guard let window = windowForSheet else {
      return
    }
    
    dialog.beginSheetModal(for: window) { [unowned self] response in
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      
      guard let url = dialog.url else {
        return
      }
      
      dialog.close()
      
      self.progressSpinner.startAnimation(nil)
      
      self.progressBar.minValue = 0.0
      self.progressBar.maxValue = Double(pagedSet.count + 1)
      self.progressBar.doubleValue = 0.0
      
      window.beginSheet(self.progressSheet, completionHandler: nil)
      
      
      DispatchQueue.global().async {
        var pageNumber = 1
        for page in pagedSet {
          DispatchQueue.main.sync {
            for index in 0...5 {
              if index <= page.count - 1 {
                if page[index].template == .split {
                  self.landscapeCardView.update(card: page[index], set: self.set)
                  guard
                    let rep = self.landscapeCardView.pngRepresentationForPrinting(size: cardSize),
                    let image = NSImage(data: rep) else { return }
                  pageView[index] = image.rotated(90.0)
                } else {
                  self.portraitCardView.update(card: page[index], set: self.set)
                  guard
                    let rep = self.portraitCardView.pngRepresentationForPrinting(size: cardSize),
                    let image = NSImage(data: rep) else { return }
                  pageView[index] = image.rotated(90.0)
                }
              } else {
                pageView[index] = NSImage(named: NSImage.Name(rawValue: "Blank Card Face - Landscape"))
              }
            }
            
            pageView.setName.stringValue = self.set.name
            pageView.pageNumber.stringValue = "Page \(pages.count + 1)"
            pageView.expansionSymbol.image = self.set.expansionSymbol.common
            
            pageView.needsDisplay = true
            let data = pageView.dataWithPDF(inside: pageView.bounds)
            pages.append(data)
            pageNumber += 1
            if pageNumber > pagedSet.count {
              pageNumber = pagedSet.count
            }
            self.progressLabelBottom.stringValue = "Rendering Page \(pageNumber) of \(pagedSet.count)"
            self.progressLabelBottom.needsDisplay = true
            self.progressBar.increment(by: 1.0)
          }
        }
        
        guard let doc = PDFDocument(data: pages[0]) else { return }
        
        for page in pages {
          if page == pages[0] {
            continue
          }
          
          if let pdfPage = PDFPage(image: NSImage(data: page)!) {
            doc.insert(pdfPage, at: doc.pageCount)
          }
        }
        
        DispatchQueue.main.sync {
          self.progressLabelBottom.stringValue = "Writing PDF to File"
        }
        
        doc.write(to: url)
        
        DispatchQueue.main.sync {
          self.progressBar.increment(by: 1.0)
        }
        
        if let card = self.card {
          self.cardView.update(card: card, set: self.set)
        }
        
        window.endSheet(self.progressSheet)
      }
    }
  }
  
  
  func showLandscape() {
    portraitCardViewWrapper.isHidden = true
    landscapeCardViewWrapper.isHidden = false
    
    portraitCardViewLeadingSpace.constant = 182
    landscapeCardViewLeadingSpace.constant = 0
  }
  
  func showPortrait() {
    portraitCardViewWrapper.isHidden = false
    landscapeCardViewWrapper.isHidden = true
    
    portraitCardViewLeadingSpace.constant = 0
    landscapeCardViewLeadingSpace.constant = -182
  }
  
  @IBAction func showShareButtonMenu(_ sender: SegmentedControlToolbarItem) {
    let x = docWindow.frame.width - 389.0
    
    if let view = self.windowForSheet?.contentView {
      let position = NSPoint(x: x, y: view.frame.height + 1)
      shareButtonContextMenu.popUp(positioning: nil, at: position, in: view)
    }
  }
  
  // MARK: - NSWindowDelegate Conformance
  
  func windowDidEnterFullScreen(_ notification: Notification) {
    isFullscreen = true
  }
  
  func windowDidExitFullScreen(_ notification: Notification) {
    isFullscreen = false
  }
  
}
