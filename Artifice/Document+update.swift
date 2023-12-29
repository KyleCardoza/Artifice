//
//  Document+updateView.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension Document {
  
  func updateDocument() {
    
    updateForm()
    
    set.sortCards()
    updateSearchResults()
    cardsTable.reloadData()
    
    if let card = card {
      cardView.update(card: card, set: set)
      if let row = set.cards.index(of: card) {
        let index = IndexSet(integer: row)
        cardsTable.selectRowIndexes(index, byExtendingSelection: false)
        cardsTable.scrollRowToVisible(row)
      }
    }
    
    self.updateChangeCount(.changeDone)
  }
  
  func updateForm() {
    
    statusbarLabel.stringValue = ""
    
    if set.cards.count == 1 {
      statusbarLabel.stringValue += "1 Card"
    } else {
      statusbarLabel.stringValue += "\(set.cards.count) Cards"
    }
    
    updateCardsTable()
    
    updateColorFlags()
    
    updateCardName()
    
    updateManaCost()
    
    updateDateOverlay()
    
    updateTypeLine()
    
    updateColorIndicator()
    
    updateExpansionSymbol()
    
    updateRulesText()
    
    updateFlavorText()
    
    updatePTBox()
    
    updateRarityCode()
    
    updatePromoText()
    
    updateCopyright()
    
    updateArtistName()
    
    updateSetInfo()
    
    updateLanguage()
    
    updateCardNotes()
    
    updateCardTemplateSelectionPopUpButton()
    
    updateUseManaSymbolCheckBox()
    
    updatePlaneswalkerInfoTab()
    
    updateSplitCardInfoTab()
    
    updatePlaneswalkerInfo()
    
    updateWatermark()
    
    updateEtbTappedButton()
    
    updateSetDefaultPromoTextField()
    
    updateZoomArtView()
    
    updateCardBorderColorRadioButtons()
  }
  
  func updateCardsTable() {
    if let card = card {
      if let row = searchResults.index(of: card) {
        let index = IndexSet(integer: row)
        cardsTable.selectRowIndexes(index, byExtendingSelection: false)
      }
    }
    
    cardsTable.reloadData()
  }
  
  func updateCardName() {
    cardNameField.stringValue = card?.name ?? ""
    if let child = card?.childCard {
      splitCardRightNameTextField.stringValue = child.name
    }
  }
  
  func updateUseManaSymbolCheckBox() {
    if let useManaSymbol = card?.useManaSymbol {
      if useManaSymbol {
        useManaSymbolCheckButton.state = NSControl.StateValue.on
      } else {
        useManaSymbolCheckButton.state = NSControl.StateValue.off
      }
    }
  }
  
  func updateManaCost() {
    switch card?.template {
    case .token?:
      fallthrough
    case .fullArtToken?:
      manaCostField.isEnabled = false
    default:
      manaCostField.isEnabled = true
    }
    
    manaCostField.stringValue = card?.manaCost ?? ""
    
    if let child = card?.childCard {
      splitCardRightManaCostTextField.stringValue = child.manaCost
    }
  }
  
  func updateDateOverlay() {
      dateOverlayField.stringValue = card?.dateOverlay ?? ""
  }
  
  func updateTypeLine() {
    typeLineField.stringValue = card?.cardType ?? ""
    
    if let child = card?.childCard {
      splitCardRightCardTypeTextField.stringValue = child.cardType
    }
  }
  
  func updateColorIndicator() {
    if let card = card {
      if card.colorIndicator {
        useColorIndicatorButton.state = NSControl.StateValue.on
      } else {
        useColorIndicatorButton.state = NSControl.StateValue.off
      }
    }
  }
  
  func updateExpansionSymbol() {
    if let expansionSymbol = card?.expansionSymbol {
      cardExpansionSymbolButton.image = expansionSymbol
    }
    commonExpansionSymbolButton.image = set.expansionSymbol.common
    uncommonExpansionSymbolButton.image = set.expansionSymbol.uncommon
    rareExpansionSymbolButton.image = set.expansionSymbol.rare
    mythicRareExpansionSymbolButton.image = set.expansionSymbol.mythic
    specialRarityExpansionSymbolButton.image = set.expansionSymbol.special
    bonusRarityExpansionSymbolButton.image = set.expansionSymbol.bonus
  }
  
  func updateRulesText() {
    rulesTextField.stringValue = card?.rulesText ?? ""
    
    if let child = card?.childCard {
      splitCardRightRulesTextTextField.stringValue = child.rulesText
    }
  }
  
  func updateFlavorText() {
    switch card?.template {
    case .token?:
      fallthrough
    case .fullArtToken?:
      flavorTextField.isEnabled = false
    default:
      flavorTextField.isEnabled = true
    }
    
    flavorTextField.stringValue = card?.flavorText ?? ""
  }
  
  func updatePTBox() {
      powerField.stringValue = card?.power ?? ""
      toughnessField.stringValue = card?.toughness ?? ""
  }
  
  func updateRarityCode() {
    switch card?.rarityCode {
    case "C"?:
      rarityPopUpButton.selectItem(withTag: 0)
      rarityPopUpButton.setTitle("Common")
    case "U"?:
      rarityPopUpButton.selectItem(withTag: 1)
      rarityPopUpButton.setTitle("Uncommon")
    case "R"?:
      rarityPopUpButton.selectItem(withTag: 2)
      rarityPopUpButton.setTitle("Rare")
    case "M"?:
      rarityPopUpButton.selectItem(withTag: 3)
      rarityPopUpButton.setTitle("Mythic Rare")
    case "L"?:
      rarityPopUpButton.selectItem(withTag: 4)
      rarityPopUpButton.setTitle("Basic Land")
    case "S"?:
      rarityPopUpButton.selectItem(withTag: 5)
      rarityPopUpButton.setTitle("Special")
    case "P"?:
      rarityPopUpButton.selectItem(withTag: 6)
      rarityPopUpButton.setTitle("Promo")
    case "T"?:
      rarityPopUpButton.selectItem(withTag: 7)
      rarityPopUpButton.setTitle("Token")
    case "B"?:
      rarityPopUpButton.selectItem(withTag: 8)
      rarityPopUpButton.setTitle("Bonus")
    default:
      rarityPopUpButton.selectItem(withTag: 0)
      rarityPopUpButton.setTitle("Common")
    }
  }
  
  func updatePromoText() {
    promoTextField.stringValue = card?.promoText ?? ""
  }
  
  func updateCopyright() {
    copyrightField.stringValue = set.copyright
  }
  
  func updateArtistName() {
    artistNameField.stringValue = card?.artistName ?? ""
    
    if let child = card?.childCard {
      splitCardRightArtistNameTextField.stringValue = child.artistName
    }
  }
  
  func updateColorFlags() {
    if let card = card {
      if card.colorFlags.allColors {
        isAllColorsCheckButton.state = NSControl.StateValue.on
      } else {
        isAllColorsCheckButton.state = NSControl.StateValue.off
      }
    
      if card.colorFlags.colorless {
        isColorlessCheckButton.state = NSControl.StateValue.on
      } else {
        isColorlessCheckButton.state = NSControl.StateValue.off
      }
      
      if card.colorFlags.white {
        isWhiteCheckButton.state = NSControl.StateValue.on
      } else {
        isWhiteCheckButton.state = NSControl.StateValue.off
      }
      
      if card.colorFlags.blue {
        isBlueCheckButton.state = NSControl.StateValue.on
      } else {
        isBlueCheckButton.state = NSControl.StateValue.off
      }
      
      if card.colorFlags.black {
        isBlackCheckButton.state = NSControl.StateValue.on
      } else {
        isBlackCheckButton.state = NSControl.StateValue.off
      }
      
      if card.colorFlags.red {
        isRedCheckButton.state = NSControl.StateValue.on
      } else {
        isRedCheckButton.state = NSControl.StateValue.off
      }
      
      if card.colorFlags.green {
        isGreenCheckButton.state = NSControl.StateValue.on
      } else {
        isGreenCheckButton.state = NSControl.StateValue.off
      }
    }
  }
  
  func updateSetInfo() {
    setCodeField.stringValue = set.code
    setNameField.stringValue = set.name
    setDescriptionField.stringValue = set.setDescription
    yearField.stringValue = "\(set.year)"
  }
  
  func updateLanguage() {
    switch set.language {
    case .en:
      setLanguagePopUpButton.selectItem(at: 0)
    default:
      setLanguagePopUpButton.selectItem(at: 0)
    }
  }
  
  func updateCardTemplateSelectionPopUpButton() {
    switch card?.template {
    case .standard?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 23)
    case .token?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 24)
    case .fullArtToken?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 25)
    case .fullArtBasicLand?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 26)
    case .fullArtNonbasicLand?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 27)
    case .planeswalker3ability?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 28)
    case .planeswalker4ability?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 29)
    case .transparentStandard?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 30)
    case .gameDay?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 31)
    case .miracle?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 32)
    case .split?:
      cardTemplateSelectionPopUpButton.selectItem(withTag: 55)
    default:
      return
    }
  }
  
  func updatePlaneswalkerInfoTab() {
    if let template = card?.template {
      if template == .planeswalker3ability ||
        template == .planeswalker4ability {
        if !tabs.tabViewItems.contains(planeswalkerInfoTabItem) {
          tabs.addTabViewItem(planeswalkerInfoTabItem)
        }
      } else {
        if tabs.tabViewItems.contains(planeswalkerInfoTabItem) {
          tabs.removeTabViewItem(planeswalkerInfoTabItem)
        }
      }
    }
  }
  
  func updateSplitCardInfoTab() {
    if let template = card?.template {
      if template == .split {
        if !tabs.tabViewItems.contains(splitCardInfoTabItem) {
          tabs.addTabViewItem(splitCardInfoTabItem)
        }
        if !tabs.tabViewItems.contains(splitCardArtTabItem) {
          tabs.addTabViewItem(splitCardArtTabItem)
        }
      } else {
        if tabs.tabViewItems.contains(splitCardInfoTabItem) {
          tabs.removeTabViewItem(splitCardInfoTabItem)
        }
        if tabs.tabViewItems.contains(splitCardArtTabItem) {
          tabs.removeTabViewItem(splitCardArtTabItem)
        }
      }
    }
  }
  
  func updateCardNotes() {
    cardNotesField.stringValue = card?.notes ?? ""
  }
  
  func updatePlaneswalkerInfo() {
    switch card?.template {
    case .planeswalker3ability?:
      fallthrough
    case .planeswalker4ability?:
      planeswalkerAbility1Cost.stringValue = card?.planeswalkerAbility1Cost ?? ""
      planeswalkerAbility2Cost.stringValue = card?.planeswalkerAbility2Cost ?? ""
      planeswalkerAbility3Cost.stringValue = card?.planeswalkerAbility3Cost ?? ""
      planeswalkerAbility4Cost.stringValue = card?.planeswalkerAbility4Cost ?? ""
      planeswalkerAbility1rulesText.stringValue = card?.planeswalkerAbility1 ?? ""
      planeswalkerAbility2rulesText.stringValue = card?.planeswalkerAbility2 ?? ""
      planeswalkerAbility3rulesText.stringValue = card?.planeswalkerAbility3 ?? ""
      planeswalkerAbility4rulesText.stringValue = card?.planeswalkerAbility4 ?? ""
      startingLoyaltyTextField.stringValue = card?.planeswalkerStartingLoyalty ?? ""
    default:
      break
    }
  }
  
  func updateWatermark() {
    cardWatermarkButton.image = card?.watermark
    if let card = card {
      cardWatermarkOpacityPercent.stringValue = "\(Int(card.watermarkOpacity * 100))%"
    }
    if let card = card?.childCard {
      splitCardWatermarkOpacityPercent.stringValue = "\(Int(card.watermarkOpacity * 100))%"
    }
  }
  
  func updateEtbTappedButton() {
    guard let etbTapped = card?.etbTapped else { return }
    if etbTapped {
      etbTappedCheckButton.state = NSControl.StateValue.on
    } else {
      etbTappedCheckButton.state = NSControl.StateValue.off
    }
  }
  
  func updateSetDefaultPromoTextField() {
    setDefaultPromoTextField.stringValue = set.defaultPromoText
  }
  
  func updateZoomArtView() {
    if let card = card {
      artZoomSlider.doubleValue = card.artZoomFactor
      artOffsetXSlider.doubleValue = card.artOffsetX
      artOffsetYSlider.doubleValue = card.artOffsetY
      artRotation.floatValue = card.artRotation
    }
    
    if let child = card?.childCard {
      splitCardArtZoomSlider.doubleValue = child.artZoomFactor
      splitCardArtOffsetXSlider.doubleValue = child.artOffsetX
      splitCardArtOffsetYSlider.doubleValue = child.artOffsetY
      splitCardArtRotationSlider.floatValue = child.artRotation
    }
    
    artZoomView.image = card?.processedArt
    splitCardArtZoomView.image = card?.childCard?.processedArt
  }
  
  func updateCardBorderColorRadioButtons() {
    cardBorderBlackRadioButton.state = NSControl.StateValue.off
    cardBorderWhiteRadioButton.state = NSControl.StateValue.off
    cardBorderSilverRadioButton.state = NSControl.StateValue.off
    cardBorderGoldRadioButton.state = NSControl.StateValue.off
    if let card = card {
      switch card.borderColor {
      case .black:
        cardBorderBlackRadioButton.state = NSControl.StateValue.on
      case .white:
        cardBorderWhiteRadioButton.state = NSControl.StateValue.on
      case .silver:
        cardBorderSilverRadioButton.state = NSControl.StateValue.on
      case .gold:
        cardBorderGoldRadioButton.state = NSControl.StateValue.on
      }
    }
  }
}
