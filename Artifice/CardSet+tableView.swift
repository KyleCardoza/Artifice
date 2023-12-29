//
//  Document+CardManagement.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension CardSet: NSTableViewDataSource, NSTableViewDelegate {
  func numberOfRows(in tableView: NSTableView) -> Int {
    return cards.count
  }
  
  func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
    switch tableColumn?.identifier {
    case "cardNameColumn"?:
      return cards[row].name
    case "manaCostColumn"?:
      return cards[row].manaCost
    case "cardTypeColumn"?:
      return cards[row].cardType
    case "rarityColumn"?:
      switch cards[row].rarityCode {
      case "C":
        return "Common"
      case "U":
        return "Uncommon"
      case "R":
        return "Rare"
      case "M":
        return "Mythic Rare"
      case "L":
        return "Basic Land"
      case "S":
        return "Special"
      case "P":
        return "Promo"
      default:
        return nil
      }
    case "powerColumn"?:
      return cards[row].power
    case "toughnessColumn"?:
      return cards[row].toughness
    case "numberColumn"?:
      return "\(row+1)/\(cards.count)"
    default:
      return nil
    }
  }
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    guard let cardsTable = notification.object as? NSTableView else {
      return
    }
    
  }
}
