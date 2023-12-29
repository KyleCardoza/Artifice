//
//  Document+FieldUpdates.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension Document {
  
  @IBAction func cardNameFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.name {
      card?.name = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func manaCostFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.manaCost {
      card?.manaCost = sanitizeManaCost(string: sender.stringValue)
      updateDocument()
    }
  }
  
  @IBAction func typeLineFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.cardType {
      card?.cardType = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func rulesTextFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.rulesText {
      card?.rulesText = sender.stringValue
      updateDocument()
    }
  }
  
  
  @IBAction func flavorTextFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.flavorText {
      card?.flavorText = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func powerFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.power {
      card?.power = sanitizePowerToughness(string: sender.stringValue)
      updateDocument()
    }
  }
  
  @IBAction func toughnessFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.toughness {
      card?.toughness = sanitizePowerToughness(string: sender.stringValue)
      updateDocument()
    }
  }
  
  @IBAction func artistFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.artistName {
      
      let string = artistNameField.stringValue.replacingOccurrences(of: "\n", with: "")
      
      card?.artistName = string
      updateDocument()
    }
  }
  
  @IBAction func promoTextFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.promoText {
      card?.promoText = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func setNameFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != set.name {
      set.name = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func setDescriptionFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != set.setDescription {
      set.setDescription = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func setCodeFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != set.code {
      set.code = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func yearFieldUpdated(_ sender: NSTextField) {
    if sender.intValue != Int32(set.year) {
      if let year = Int(sender.stringValue) {
        set.year = year
        updateDocument()
      }
    }
  }
  
  @IBAction func copyrightFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != set.copyright{
      set.copyright = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func centerRulesTextCheckboxUpdated(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.off {
      card?.centerRulesText = false
    } else {
      card?.centerRulesText = true
    }
    self.updateDocument()
  }
  
  @IBAction func splitCardCenterRulesTextCheckboxUpdated(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.off {
      card?.childCard?.centerRulesText = false
    } else {
      card?.childCard?.centerRulesText = true
    }
    self.updateDocument()
  }
  
  @IBAction func dateOverlayFieldUpdated(_ sender: AnyObject) {
    if sender.stringValue != card?.dateOverlay {
      card?.dateOverlay = dateOverlayField.stringValue
      updateDocument()
    }
  }
  
  @IBAction func cardBorderColorRadioButtonClicked(_ sender: NSButton!) {
    switch sender {
    case cardBorderBlackRadioButton:
      card?.borderColor = .black
    case cardBorderWhiteRadioButton:
      card?.borderColor = .white
    case cardBorderSilverRadioButton:
      card?.borderColor = .silver
    case cardBorderGoldRadioButton:
      card?.borderColor = .gold
    default:
      return
    }
    updateDocument()
  }
  
  @IBAction func setBorderColorRadioButtonClicked(_ sender: NSButton!) {
    switch sender {
    case setBorderBlackRadioButton:
      set.borderColor = .black
    case setBorderWhiteRadioButton:
      set.borderColor = .white
    case setBorderSilverRadioButton:
      set.borderColor = .silver
    case setBorderGoldRadioButton:
      set.borderColor = .gold
    default:
      return
    }
    updateDocument()
  }
  
  @IBAction func isAllColorsCheckButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.colorFlags.allColors = true
      card?.colorFlags.colorless = false
      card?.colorFlags.white = false
      card?.colorFlags.blue = false
      card?.colorFlags.black = false
      card?.colorFlags.red = false
      card?.colorFlags.green = false
      
      isColorlessCheckButton.state = NSControl.StateValue.off
      isWhiteCheckButton.state = NSControl.StateValue.off
      isBlueCheckButton.state = NSControl.StateValue.off
      isBlackCheckButton.state = NSControl.StateValue.off
      isRedCheckButton.state = NSControl.StateValue.off
      isGreenCheckButton.state = NSControl.StateValue.off
      
    } else {
      card?.colorFlags.allColors = false
    }
    
    updateDocument()
  }
  
  @IBAction func isColorlessCheckButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.colorFlags.allColors = false
      card?.colorFlags.colorless = true
      card?.colorFlags.white = false
      card?.colorFlags.blue = false
      card?.colorFlags.black = false
      card?.colorFlags.red = false
      card?.colorFlags.green = false
      
      isAllColorsCheckButton.state = NSControl.StateValue.off
      isWhiteCheckButton.state = NSControl.StateValue.off
      isBlueCheckButton.state = NSControl.StateValue.off
      isBlackCheckButton.state = NSControl.StateValue.off
      isRedCheckButton.state = NSControl.StateValue.off
      isGreenCheckButton.state = NSControl.StateValue.off
    } else {
      card?.colorFlags.colorless = false
    }
    
    updateDocument()
  }
  
  @IBAction func isWhiteCheckButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.colorFlags.colorless = false
      card?.colorFlags.white = true
      isColorlessCheckButton.state = NSControl.StateValue.off
    } else {
      card?.colorFlags.white = false
    }
    
    updateDocument()
  }
  
  @IBAction func isBlueCheckButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.colorFlags.colorless = false
      card?.colorFlags.blue = true
      isColorlessCheckButton.state = NSControl.StateValue.off
    } else {
      card?.colorFlags.blue = false
    }
    
    updateDocument()
  }
  
  @IBAction func isBlackCheckButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.colorFlags.colorless = false
      card?.colorFlags.black = true
      isColorlessCheckButton.state = NSControl.StateValue.off
    } else {
      card?.colorFlags.black = false
    }
    
    updateDocument()
  }
  
  @IBAction func isRedCheckButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.colorFlags.colorless = false
      card?.colorFlags.red = true
      isColorlessCheckButton.state = NSControl.StateValue.off
    } else {
      card?.colorFlags.red = false
    }
    
    updateDocument()
  }
  
  @IBAction func isGreenCheckButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.colorFlags.colorless = false
      card?.colorFlags.green = true
      isColorlessCheckButton.state = NSControl.StateValue.off
    } else {
      card?.colorFlags.green = false
    }
    
    updateDocument()
  }
  
  
  @IBAction func useColorIndicatorCheckButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.colorIndicator = true
    } else {
      card?.colorIndicator = false
    }
    updateDocument()
  }
  
  @IBAction func expansionSymbolButtonPressed(_ sender: NSButton) {
    
    for sheet in self.windowForSheet!.sheets {
      self.windowForSheet?.endSheet(sheet)
    }
    
    let dialog = NSOpenPanel()
    dialog.allowedFileTypes = NSImage.imageTypes
    guard let window = windowForSheet else { return }
    dialog.beginSheetModal(for: window) { [unowned self, unowned sender] response in
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      
      do {
        guard let url = dialog.url else {
          return
        }
        
        let data = try Data(contentsOf: url)
        
        if let image = NSImage(data: data) {
          switch sender {
          case self.commonExpansionSymbolButton:
            self.set.expansionSymbol.common = image
          case self.uncommonExpansionSymbolButton:
            self.set.expansionSymbol.uncommon = image
          case self.rareExpansionSymbolButton:
            self.set.expansionSymbol.rare = image
          case self.mythicRareExpansionSymbolButton:
            self.set.expansionSymbol.mythic = image
          case self.specialRarityExpansionSymbolButton:
            self.set.expansionSymbol.special = image
          case self.bonusRarityExpansionSymbolButton:
            self.set.expansionSymbol.bonus = image
          default:
            return
          }
          self.updateDocument()
        }
      }
      catch {
        return
      }
      self.displaySetInfoSheet(self)
    }
  }
  
  @IBAction func rarityPopUpButtonClicked(_ sender: NSPopUpButton) {
    switch sender.titleOfSelectedItem {
    case "Common"?:
      card?.rarityCode = "C"
    case "Uncommon"?:
      card?.rarityCode = "U"
    case "Rare"?:
      card?.rarityCode = "R"
    case "Mythic Rare"?:
      card?.rarityCode = "M"
    case "Basic Land"?:
      card?.rarityCode = "L"
    case "Special"?:
      card?.rarityCode = "S"
    case "Promo"?:
      card?.rarityCode = "P"
    case "Bonus"?:
      card?.rarityCode = "B"
    case "Token"?:
      card?.rarityCode = "T"
      card?.template = .token
      set.sortCards()
      cardsTable.reloadData()
    default:
      return
    }
    
    updateDocument()
  }
  
  @IBAction func useManaSymbolCheckButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.useManaSymbol = true
    } else {
      card?.useManaSymbol = false
    }
    updateDocument()
  }
  
  
  @IBAction func cardTemplateSelectorPopUpButtonClicked(_ sender: NSPopUpButton) {
    switch sender.titleOfSelectedItem {
    case "Standard"?:
      card?.template = .standard
    case "Token"?:
      card?.template = .token
      card?.rarityCode = "T"
    case "Full-Art Token"?:
      card?.template = .fullArtToken
      card?.rarityCode = "T"
    case "Full-Art Basic Land"?:
      card?.template = .fullArtBasicLand
      card?.rarityCode = "L"
    case "Full-Art Nonbasic Land"?:
      card?.template = .fullArtNonbasicLand
    case "Planeswalker"?:
      card?.template = .planeswalker3ability
    case "Planeswalker (4 Abilities)"?:
      card?.template = .planeswalker4ability
    case "Transparent Standard"?:
      card?.template = .transparentStandard
    case "Transparent Promo"?:
      card?.template = .gameDay
    case "Miracle"?:
      card?.template = .miracle
    case "Split"?:
      card?.template = .split
      if let card = card,
         card.childCard == nil {
        card.childCard = Card()
      }
    default:
      return
    }
    
    updateDocument()
  }
  
  
  @IBAction func exportResolutionPopUpClicked(_ sender: NSPopUpButton) {
    switch sender.indexOfSelectedItem {
    case 0:
      set.exportResolution = .medium
    case 1:
      set.exportResolution = .high
    case 2:
      set.exportResolution = .extreme
    default:
      return
    }
    updateDocument()
  }
  
  @IBAction func setLanguagePopUpButtonClicked(_ sender: NSPopUpButton) {
    switch sender.indexOfSelectedItem {
    default:
      set.language = .en
    }
    updateDocument()
  }
  
  @IBAction func cardNotesFieldUpdated(_ sender: NSTextField) {
    if sender.stringValue != card?.notes {
      card?.notes = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func clearCardExpansionSymbolButtonClicked(_ sender: NSButton) {
    if card?.expansionSymbol != nil {
      card?.expansionSymbol = nil
      updateDocument()
    }
  }
  
  @IBAction func cardExpansionSymbolButtonPressed(_ sender: NSButton) {
    let dialog = NSOpenPanel()
    dialog.allowedFileTypes = NSImage.imageTypes
    guard let window = windowForSheet else { return }
    dialog.beginSheetModal(for: window) { [unowned self] response in
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      
      do {
        guard let url = dialog.url else {
          return
        }
        
        let data = try Data(contentsOf: url)
        
        if let image = NSImage(data: data) {
          self.card?.expansionSymbol = image
          self.updateDocument()
        }
      }
      catch {
        return
      }
    }
  }
  
  @IBAction func chooseArtButtonClicked(_ sender: NSButton) {
    let dialog = NSOpenPanel()
    dialog.allowedFileTypes = NSImage.imageTypes
    guard let window = windowForSheet else { return }
    dialog.beginSheetModal(for: window) { [unowned self] response in
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      guard let url = dialog.url else {
        return
      }
      
      let image = NSImage(contentsOf: url)
      
      self.card?.artData = image
      self.card?.artOffsetY = 0.0
      self.card?.artOffsetX = 0.0
      self.card?.artZoomFactor = 1.0
      self.card?.artRotation = 0.0
      
      self.updateDocument()
    }
  }
  
  @IBAction func splitCardChooseArtButtonClicked(_ sender: NSButton) {
    let dialog = NSOpenPanel()
    dialog.allowedFileTypes = NSImage.imageTypes
    guard let window = windowForSheet else { return }
    dialog.beginSheetModal(for: window) { [unowned self] response in
      
      if response == NSApplication.ModalResponse.cancel {
        return
      }
      
      do {
        guard let url = dialog.url else {
          return
        }
        
        let data = try Data(contentsOf: url)
        
        self.card?.childCard?.artData = NSImage(data: data)
        self.card?.childCard?.artOffsetY = 0.0
        self.card?.childCard?.artOffsetX = 0.0
        self.card?.childCard?.artZoomFactor = 1.0
        self.card?.childCard?.artRotation = 0.0
        
        self.updateDocument()
      }
      catch {
        return
      }
    }
  }
  
  @IBAction func clearArtButtonClicked(_ sender: NSButton) {
    card?.artData = nil
    card?.artOffsetY = 0.0
    card?.artOffsetX = 0.0
    card?.artZoomFactor = 1.0
    card?.artRotation = 0.0
    
    self.updateDocument()
  }
  
  @IBAction func splitCardClearArtButtonClicked(_ sender: NSButton) {
    card?.childCard?.artData = nil
    card?.childCard?.artOffsetY = 0.0
    card?.childCard?.artOffsetX = 0.0
    card?.childCard?.artZoomFactor = 1.0
    card?.childCard?.artRotation = 0.0
    
    self.updateDocument()
  }
  
  @IBAction func planeswalkerAbility1CostUpdated(_ sender: NSTextField) {
    card?.planeswalkerAbility1Cost = planeswalkerAbility1Cost.stringValue
    self.updateDocument()
  }
  
  @IBAction func planeswalkerAbility2CostUpdated(_ sender: NSTextField) {
    card?.planeswalkerAbility2Cost = planeswalkerAbility2Cost.stringValue
    self.updateDocument()
  }
  
  @IBAction func planeswalkerAbility3CostUpdated(_ sender: NSTextField) {
    card?.planeswalkerAbility3Cost = planeswalkerAbility3Cost.stringValue
    self.updateDocument()
  }
  
  @IBAction func planeswalkerAbility4CostUpdated(_ sender: NSTextField) {
    card?.planeswalkerAbility4Cost = planeswalkerAbility4Cost.stringValue
    self.updateDocument()
  }
  
  @IBAction func planeswalkerAbility1rulesTextUpdated(_ sender: NSTextField) {
    card?.planeswalkerAbility1 = planeswalkerAbility1rulesText.stringValue
    self.updateDocument()
  }
  
  @IBAction func planeswalkerAbility2rulesTextUpdated(_ sender: NSTextField) {
    card?.planeswalkerAbility2 = planeswalkerAbility2rulesText.stringValue
    self.updateDocument()
  }
  
  @IBAction func planeswalkerAbility3rulesTextUpdated(_ sender: NSTextField) {
    card?.planeswalkerAbility3 = planeswalkerAbility3rulesText.stringValue
    self.updateDocument()
  }
  
  @IBAction func planeswalkerAbility4rulesTextUpdated(_ sender: NSTextField) {
    card?.planeswalkerAbility4 = planeswalkerAbility4rulesText.stringValue
    self.updateDocument()
  }
  
  @IBAction func planeswalkerStartingLoyaltyUpdated(_ sender: NSTextField) {
    card?.planeswalkerStartingLoyalty = startingLoyaltyTextField.stringValue
    self.updateDocument()
  }
  
  @IBAction func watermarkButtonClicked(_ sender: NSButton) {
    let dialog = NSOpenPanel()
    dialog.allowedFileTypes = NSImage.imageTypes
    guard let window = windowForSheet else { return }
    dialog.beginSheetModal(for: window) { [unowned self] response in
      do {
        guard let url = dialog.url else {
          return
        }
        
        let data = try Data(contentsOf: url)
        
        self.card?.watermark = NSImage(data: data)
        self.updateDocument()
      }
      catch {
        return
      }
    }
  }
  
  @IBAction func splitCardWatermarkButtonClicked(_ sender: NSButton) {
    let dialog = NSOpenPanel()
    dialog.allowedFileTypes = NSImage.imageTypes
    guard let window = windowForSheet else { return }
    dialog.beginSheetModal(for: window) { [unowned self] response in
      do {
        guard let url = dialog.url else {
          return
        }
        
        let data = try Data(contentsOf: url)
        
        self.card?.childCard?.watermark = NSImage(data: data)
        self.updateDocument()
      }
      catch {
        return
      }
    }
  }
  
  @IBAction func clearWatermarkButtonClicked(_ sender: NSButton) {
    card?.watermark = nil
    self.updateDocument()
  }
  
  @IBAction func splitCardClearWatermarkButtonClicked(_ sender: NSButton) {
    card?.childCard?.watermark = nil
    self.updateDocument()
  }
  
  @IBAction func cardWatermarkOpacitySliderUpdated(_ sender: NSSlider) {
    let opacity = sender.doubleValue
    card?.watermarkOpacity = opacity
    self.updateDocument()
  }
  
  @IBAction func splitCardWatermarkOpacitySliderUpdated(_ sender: NSSlider) {
    let opacity = sender.doubleValue
    card?.childCard?.watermarkOpacity = opacity
    self.updateDocument()
  }
  
  @IBAction func increaseFontSizeButtonClicked(_ sender: NSButton) {
    if sender == splitCardRightIncreaseFontSizeButton {
      card?.childCard?.baseFontSize += 0.25
    } else {
      card?.baseFontSize += 0.25
    }
    
    if let card = card {
      cardView.activeTemplate?.updateRulesText(card: card)
      cardView.activeTemplate?.updateFlavorText(card: card)
      cardView.activeTemplate?.updatePlaneswalkerInfo(card: card)
    }
    
    updateChangeCount(.changeDone)
  }
  
  @IBAction func decreaseFontSizeButtonClicked(_ sender: NSButton) {
    if sender == splitCardRightDecreaseFontSizeButton {
      card?.childCard?.baseFontSize -= 0.25
    } else {
      card?.baseFontSize -= 0.25
    }
    
    if let card = card {
      cardView.activeTemplate?.updateRulesText(card: card)
      cardView.activeTemplate?.updateFlavorText(card: card)
      cardView.activeTemplate?.updatePlaneswalkerInfo(card: card)
    }
    
    updateChangeCount(.changeDone)
  }
  
  @IBAction func resetFontSizeButtonClicked(_ sender: NSButton) {
    card?.baseFontSize = 20.75
    card?.childCard?.baseFontSize = 20.75
    updateDocument()
  }
  
  @IBAction func hideExpansionSymbolButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      set.hideExpansionSymbol = true
    } else {
      set.hideExpansionSymbol = false
    }
    updateDocument()
  }
  
  @IBAction func etbTappedButtonClicked(_ sender: NSButton) {
    if sender.state == NSControl.StateValue.on {
      card?.etbTapped = true
    } else {
      card?.etbTapped = false
    }
    updateDocument()
  }
  
  @IBAction func setDefaultPromoTextFieldUpdated(_ sender: NSTextField) {
    set.defaultPromoText = sender.stringValue
    self.updateDocument()
  }
  
  @IBAction func artZoomFactorSliderUpdated(_ sender: NSSlider) {
    card?.artZoomFactor = sender.doubleValue
    if let card = card {
      cardView.activeTemplate?.updateArt(card: card)
      artZoomView.image = card.processedArt
    }
    self.updateChangeCount(.changeDone)
  }
  
  @IBAction func splitCardArtZoomFactorSliderUpdated(_ sender: NSSlider) {
    card?.childCard?.artZoomFactor = sender.doubleValue
    if let card = card {
      landscapeCardView.activeTemplate?.updateArt(card: card)
      splitCardArtZoomView.image = card.childCard?.processedArt
    }
    self.updateChangeCount(.changeDone)
  }
  
  @IBAction func artOffsetXSliderUpdated(_ sender: NSSlider) {
    card?.artOffsetX = sender.doubleValue
    if let card = card {
      cardView.activeTemplate?.updateArt(card: card)
      artZoomView.image = card.processedArt
    }
    self.updateChangeCount(.changeDone)
  }
  
  @IBAction func splitCardArtOffsetXSliderUpdated(_ sender: NSSlider) {
    card?.childCard?.artOffsetX = sender.doubleValue
    if let card = card {
      landscapeCardView.activeTemplate?.updateArt(card: card)
      splitCardArtZoomView.image = card.childCard?.processedArt
    }
    self.updateChangeCount(.changeDone)
  }
  
  @IBAction func artOffsetYSliderUpdated(_ sender: NSSlider) {
    card?.artOffsetY = sender.doubleValue
    if let card = card {
      cardView.activeTemplate?.updateArt(card: card)
      artZoomView.image = card.processedArt
    }
    self.updateChangeCount(.changeDone)
  }
  
  @IBAction func splitCardArtOffsetYSliderUpdated(_ sender: NSSlider) {
    card?.childCard?.artOffsetY = sender.doubleValue
    if let card = card {
      landscapeCardView.activeTemplate?.updateArt(card: card)
      splitCardArtZoomView.image = card.childCard?.processedArt
    }
    self.updateChangeCount(.changeDone)
  }
  
  @IBAction func artRotationSliderUpdated(_ sender: NSSlider) {
    card?.artRotation = sender.floatValue
    if let card = card {
      cardView.activeTemplate?.updateArt(card: card)
      artZoomView.image = card.processedArt
    }
    self.updateChangeCount(.changeDone)
  }
  
  @IBAction func splitCardArtRotationSliderUpdated(_ sender: NSSlider) {
    card?.childCard?.artRotation = sender.floatValue
    if let card = card {
      landscapeCardView.activeTemplate?.updateArt(card: card)
      splitCardArtZoomView.image = card.childCard?.processedArt
    }
    self.updateChangeCount(.changeDone)
  }
  
  @IBAction func splitCardRightCardNameTextFieldUpdated(_ sender: NSTextField) {
    guard let card = card?.childCard else { return }
    
    if sender.stringValue != card.name {
      card.name = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func splitCardRightManaCostTextFieldUpdated(_ sender: NSTextField) {
    guard let card = card?.childCard else { return }
    
    if sender.stringValue != card.manaCost {
      card.manaCost = sanitizeManaCost(string: sender.stringValue)
      updateDocument()
    }
  }
  
  @IBAction func splitCardRightCardTypeTextFieldUpdated(_ sender: NSTextField) {
    guard let card = card?.childCard else { return }
    
    if sender.stringValue != card.cardType {
      card.cardType = sender.stringValue
      updateDocument()
    }
    
  }
  
  @IBAction func splitCardRightRulesTextFieldUpdated(_ sender: NSTextField) {
    guard let card = card?.childCard else { return }
    
    if sender.stringValue != card.rulesText {
      card.rulesText = sender.stringValue
      updateDocument()
    }
  }
  
  @IBAction func splitCardRightArtistTextFieldUpdated(_ sender: NSTextField) {
    guard let card = card?.childCard else { return }
    
    if sender.stringValue != card.artistName {
      
      let string = splitCardRightArtistNameTextField.stringValue.replacingOccurrences(of: "\n", with: "")
      
      card.artistName = string
      updateDocument()
    }
    
  }
  
  @IBAction func fontSizeToolbarButtonClicked(_ sender: NSSegmentedControl) {
    if let card = card {
      if sender.selectedSegment == 0 {
        card.childCard?.baseFontSize += 0.25
        card.baseFontSize += 0.25
      } else if sender.selectedSegment == 1 {
        card.childCard?.baseFontSize -= 0.25
        card.baseFontSize -= 0.25
      }
      
      cardView.activeTemplate?.updateRulesText(card: card)
      cardView.activeTemplate?.updateFlavorText(card: card)
      cardView.activeTemplate?.updatePlaneswalkerInfo(card: card)
      
      self.updateChangeCount(.changeDone)
    }
  }
}
