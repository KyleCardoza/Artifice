//
//  Document+Menubar.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-24.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension Document {
  
  override func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
    switch menuItem.tag {
    case -1...0:
      menuItem.state = NSControl.StateValue.off
      return true
    case 1...7 where card != nil:
      menuItem.state = NSControl.StateValue.off
      return true
    case 8 where card?.rarityCode == "C":
      menuItem.state = NSControl.StateValue.on
      return true
    case 9 where card?.rarityCode == "U":
      menuItem.state = NSControl.StateValue.on
      return true
    case 10 where card?.rarityCode == "R":
      menuItem.state = NSControl.StateValue.on
      return true
    case 11 where card?.rarityCode == "M":
      menuItem.state = NSControl.StateValue.on
      return true
    case 12 where card?.rarityCode == "L":
      menuItem.state = NSControl.StateValue.on
      return true
    case 13 where card?.rarityCode == "S":
      menuItem.state = NSControl.StateValue.on
      return true
    case 14 where card?.rarityCode == "P":
      menuItem.state = NSControl.StateValue.on
      return true
    case 15 where card?.rarityCode == "T":
      menuItem.state = NSControl.StateValue.on
      return true
    case 16 where card?.rarityCode == "B":
      menuItem.state = NSControl.StateValue.on
      return true
    case 8...16 where card != nil:
      menuItem.state = NSControl.StateValue.off
      return true
    case 17 where card?.borderColor == .black:
      menuItem.state = NSControl.StateValue.on
      return true
    case 18 where card?.borderColor == .white:
      menuItem.state = NSControl.StateValue.on
      return true
    case 19 where card?.borderColor == .silver:
      menuItem.state = NSControl.StateValue.on
      return true
    case 20 where card?.borderColor == .gold:
      menuItem.state = NSControl.StateValue.on
      return true
    case 17...20 where card != nil:
      menuItem.state = NSControl.StateValue.off
      return true
    case 21 where card != nil:
      guard let useSymbol = card?.useManaSymbol else {
        menuItem.state = NSControl.StateValue.off
        return true
      }
      if useSymbol {
        menuItem.state = NSControl.StateValue.on
      } else {
        menuItem.state = NSControl.StateValue.off
      }
      return true
    case 22 where card != nil:
      guard let colorIndicator = card?.colorIndicator else {
        menuItem.state = NSControl.StateValue.off
        return true
      }
      if colorIndicator {
        menuItem.state = NSControl.StateValue.on
      } else {
        menuItem.state = NSControl.StateValue.off
      }
      return true
    case 23 where card?.template == .standard:
      menuItem.state = NSControl.StateValue.on
      return true
    case 24 where card?.template == .token:
      menuItem.state = NSControl.StateValue.on
      return true
    case 25 where card?.template == .fullArtToken:
      menuItem.state = NSControl.StateValue.on
      return true
    case 26 where card?.template == .fullArtBasicLand:
      menuItem.state = NSControl.StateValue.on
      return true
    case 27 where card?.template == .fullArtNonbasicLand:
      menuItem.state = NSControl.StateValue.on
      return true
    case 28 where card?.template == .planeswalker3ability:
      menuItem.state = NSControl.StateValue.on
      return true
    case 29 where card?.template == .planeswalker4ability:
      menuItem.state = NSControl.StateValue.on
      return true
    case 30 where card?.template == .transparentStandard:
      menuItem.state = NSControl.StateValue.on
      return true
    case 31 where card?.template == .gameDay:
      menuItem.state = NSControl.StateValue.on
      return true
    case 32 where card?.template == .miracle:
      menuItem.state = NSControl.StateValue.on
      return true
    case 23...32 where card != nil:
      menuItem.state = NSControl.StateValue.off
      return true
    case 33 where set.exportResolution == .low:
      menuItem.state = NSControl.StateValue.on
      return true
    case 34 where set.exportResolution == .medium:
      menuItem.state = NSControl.StateValue.on
      return true
    case 35 where set.exportResolution == .high:
      menuItem.state = NSControl.StateValue.on
      return true
    case 36 where set.exportResolution == .extreme:
      menuItem.state = NSControl.StateValue.on
      return true
    case 33...36:
      menuItem.state = NSControl.StateValue.off
      return true
    case 38...41:
      menuItem.state = NSControl.StateValue.off
      return true
    case 42 where set.borderColor == .black:
      menuItem.state = NSControl.StateValue.on
      return true
    case 43 where set.borderColor == .white:
      menuItem.state = NSControl.StateValue.on
      return true
    case 44 where set.borderColor == .silver:
      menuItem.state = NSControl.StateValue.on
      return true
    case 45 where set.borderColor == .gold:
      menuItem.state = NSControl.StateValue.on
      return true
    case 42...45:
      menuItem.state = NSControl.StateValue.off
      return true
    case 46 where set.hideExpansionSymbol:
      menuItem.state = NSControl.StateValue.on
      return true
    case 46 where !set.hideExpansionSymbol:
      menuItem.state = NSControl.StateValue.off
      return true
    case 47 where card != nil:
      guard let etbTapped = card?.etbTapped else {
        menuItem.state = NSControl.StateValue.off
        return false
      }
      if etbTapped {
        menuItem.state = NSControl.StateValue.on
        return true
      } else {
        menuItem.state = NSControl.StateValue.off
        return true
      }
    case 48:
      menuItem.state = NSControl.StateValue.off
      return true
    case 49 where set.cards.count > 0:
      menuItem.state = NSControl.StateValue.off
      return true
    case 50 where searchField.stringValue == "":
      menuItem.state = NSControl.StateValue.off
      return true
    case 51 where !statisticsVisible:
      menuItem.state = NSControl.StateValue.off
      return true
    case 52 where !setInfoVisible:
      menuItem.state = NSControl.StateValue.off
      return true
    case 53 where card != nil:
      menuItem.state = NSControl.StateValue.off
      return true
    case 54 where card != nil:
      menuItem.state = NSControl.StateValue.off
      return true
    case 55 where card != nil:
      if let template = card?.template {
        if template == .split {
          menuItem.state = NSControl.StateValue.on
        } else {
          menuItem.state = NSControl.StateValue.off
        }
      }
      return true
    case 56 where card != nil:
      if let card = card {
        if card.centerRulesText {
          menuItem.state = NSControl.StateValue.on
        } else {
          menuItem.state = NSControl.StateValue.off
        }
      }
      return true
    default:
      menuItem.state = NSControl.StateValue.off
      return false
    }
  }
  
  @IBAction func cardMenuRarityItemClicked(_ menuItem: NSMenuItem) {
    switch menuItem.tag {
    case 8:
      card?.rarityCode = "C"
    case 9:
      card?.rarityCode = "U"
    case 10:
      card?.rarityCode = "R"
    case 11:
      card?.rarityCode = "M"
    case 12:
      card?.rarityCode = "L"
    case 13:
      card?.rarityCode = "S"
    case 14:
      card?.rarityCode = "P"
    case 15:
      card?.rarityCode = "T"
    case 16:
      card?.rarityCode = "B"
    default:
      return
    }
    updateDocument()
  }
  
  @IBAction func cardMenuBorderItemClicked(_ menuItem: NSMenuItem) {
    switch menuItem.tag {
    case 17:
      card?.borderColor = .black
    case 18:
      card?.borderColor = .white
    case 19:
      card?.borderColor = .silver
    case 20:
      card?.borderColor = .gold
    default:
      return
    }
    updateDocument()
  }
  
  @IBAction func cardMenuColorIndicatorItemClicked(_ menuItem: NSMenuItem) {
    if let colorIndicator = card?.colorIndicator {
      card?.colorIndicator = !colorIndicator
      updateDocument()
    }
  }
  
  @IBAction func cardMenuLargeManaSymbolItemClicked(_ menuItem: NSMenuItem) {
    if let useSymbol = card?.useManaSymbol {
      card?.useManaSymbol = !useSymbol
      updateDocument()
    }
  }
  
  @IBAction func cardMenuTemplateItemClicked(_ menuItem: NSMenuItem) {
    switch menuItem.tag {
    case 23:
      card?.template = .standard
    case 24:
      card?.template = .token
    case 25:
      card?.template = .fullArtToken
    case 26:
      card?.template = .fullArtBasicLand
    case 27:
      card?.template = .fullArtNonbasicLand
    case 28:
      card?.template = .planeswalker3ability
    case 29:
      card?.template = .planeswalker4ability
    case 30:
      card?.template = .transparentStandard
    case 31:
      card?.template = .gameDay
    case 32:
      card?.template = .miracle
    case 55:
      card?.template = .split
    default:
      return
    }
    updateDocument()
  }
  
  @IBAction func setMenuExportResolutionItemClicked(_ menuItem: NSMenuItem) {
    switch menuItem.tag {
    case 33:
      set.exportResolution = .low
    case 34:
      set.exportResolution = .medium
    case 35:
      set.exportResolution = .high
    case 36:
      set.exportResolution = .extreme
    default:
      return
    }
    updateDocument()
  }
  
  @IBAction func setMenuBorderColorItemClicked(_ menuItem: NSMenuItem) {
    switch menuItem.tag {
    case 42:
      set.borderColor = .black
    case 43:
      set.borderColor = .white
    case 44:
      set.borderColor = .silver
    case 45:
      set.borderColor = .gold
    default:
      return
    }
    updateDocument()
  }
  
  @IBAction func setMenuHideExpansionSymbolClicked(_ menuItem: NSMenuItem) {
    set.hideExpansionSymbol = !set.hideExpansionSymbol
    updateDocument()
  }
  
  @IBAction func cardMenuEtbTappedClicked(_ menuItem: NSMenuItem) {
    guard let card = card else { return }
    card.etbTapped = !card.etbTapped
    updateDocument()
  }
  
  @IBAction func setMenuResetPromoTextItemClicked(_ menuItem: NSMenuItem) {
    for card in set.cards {
      card.promoText = set.defaultPromoText
    }
    updateDocument()
  }
  
  @IBAction func cardMenuCenterBodyTextMenuItemClicked(_ menuItem: NSMenuItem) {
    guard let card = card else { return }
    card.centerRulesText = !card.centerRulesText
    updateDocument()
  }
}
