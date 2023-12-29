//
//  Document+CardManagement.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa


class CardsTable: NSTableView {}

extension Document: NSTableViewDataSource, NSTableViewDelegate {
  
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return searchResults.count
  }
  
  func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
    switch tableColumn?.identifier {
	case NSUserInterfaceItemIdentifier(rawValue: "cardNameColumn")? where searchResults[row].template == .split:
      if let child = searchResults[row].childCard,
         let card = card, card.template == .split {
        let leftName = searchResults[row].name
        let rightName = child.name
        return "\(leftName) // \(rightName)" as Any
      }
      
      return searchResults[row].name as Any
    
    case NSUserInterfaceItemIdentifier(rawValue: "cardNameColumn")?:
      return searchResults[row].name as Any
      
    case NSUserInterfaceItemIdentifier(rawValue: "manaCostColumn")? where searchResults[row].template == .split:
      let childCost: String
      
      if let child = searchResults[row].childCard {
        childCost = child.manaCost
      } else {
        childCost = ""
      }
      
      let cost = "\(searchResults[row].manaCost)/\(childCost)"
      
      let text = NSMutableAttributedString(string: cost)
      let style = NSMutableParagraphStyle()
      style.alignment = .right
      
      let font = CardTemplateView.Font.mplantin(size: 0.01).nsFont!
      
      text.addAttribute(NSAttributedStringKey.font,
                        value: font,
                        range:  NSRange(
                          location: 0,
                          length: text.length))
      
      text.parseManaCost(size: 20.0, align: .right)
      
      text.addAttribute(NSAttributedStringKey.paragraphStyle,
                        value: style,
                        range: NSRange(
                          location: 0,
                          length: text.length))
      return text
	case NSUserInterfaceItemIdentifier(rawValue: "manaCostColumn")?:
      
      let font = CardTemplateView.Font.mplantin(size: 0.01).nsFont!
      
      let text = NSMutableAttributedString(string: searchResults[row].manaCost)
      let style = NSMutableParagraphStyle()
      style.alignment = .right
      
      text.parseManaCost(size: 20.0, align: .right)
      
      text.addAttribute(NSAttributedStringKey.paragraphStyle,
                        value: style,
                        range: NSRange(
                          location: 0,
                          length: text.length))
      
      text.addAttribute(NSAttributedStringKey.font,
                        value: font,
                        range:  NSRange(
                          location: 0,
                          length: text.length))
      
      return text
    case NSUserInterfaceItemIdentifier(rawValue: "cardTypeColumn")?:
      let text = NSMutableString(string: searchResults[row].cardType)
      replaceDashes(string: text)
      return text
    case NSUserInterfaceItemIdentifier(rawValue: "rarityColumn")?:
      switch searchResults[row].rarityCode {
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
      case "T":
        return "Token"
      case "B":
        return "Bonus"
      default:
        return nil
      }
    case NSUserInterfaceItemIdentifier(rawValue: "ptColumn")?:
      
      var text = ""
      
      if searchResults[row].power != "" || searchResults[row].toughness != "" {
        text = "\(searchResults[row].power)/\(searchResults[row].toughness)"
      } else {
        text = ""
      }
      
      let attributedText = NSMutableAttributedString(string: text)
      
      let style = NSMutableParagraphStyle()
      style.alignment = .right
      
      attributedText.addAttribute(NSAttributedStringKey.paragraphStyle,
                                  value: style,
                                  range: NSRange(
                                    location: 0,
                                    length: attributedText.length))
    
      return attributedText
    default:
      return nil
    }
  }
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    let index = cardsTable.selectedRow
    if index >= 0 {
      let newCard = searchResults[index]
      if card?.template == newCard.template {
        card = newCard
        updateForm()
        if let card = card {
          cardView.activeTemplate?.update(card: card, set: set)
        }
      } else {
        card = newCard
        updateForm()
        if let card = card {
          cardView.update(card: card, set: set)
        }
      }
    }
  }
  
  @IBAction func addCard(_ sender: AnyObject) {
    let card = Card()
    card.promoText = set.defaultPromoText
    card.borderColor = set.borderColor
    set.cards.append(card)
    
    set.sortCards()
    
    updateSearchResults()
    cardsTable.reloadData()
    
    let notification = Notification(name: Notification.Name("TableViewDidAddCardNotification"))
    
    tableViewSelectionDidChange(notification)
    updateDocument()
    
    if let idx = set.cards.index(of: card) {
      let rowIndex = IndexSet(integer: idx)
      cardsTable.selectRowIndexes(rowIndex, byExtendingSelection: false)
      cardsTable.scrollRowToVisible(idx)
    }
  }
  
  @IBAction func deleteCard(_ sender: AnyObject) {
    let index = cardsTable.selectedRow
    guard let card = card,
          let row = set.cards.index(of: card) else {
            return
    
    }
    if index > -1 {
      set.cards.remove(at: row)
    }
    
    if set.cards.count == 0 {
      self.addCard(self)
    }
    
    if let template = cardView.activeTemplate, set.cards.count == 0 {
      cardView.deactivate(template)
    }
    
    updateSearchResults()
    cardsTable.reloadData()
    
    if index > set.cards.count-1 {
      let rowIndex = IndexSet(integer: index-1)
      cardsTable.selectRowIndexes(rowIndex, byExtendingSelection: false)
    }
    
    
    let notification = Notification(name: Notification.Name("TableViewDidDeleteCardNotification"))
    
    tableViewSelectionDidChange(notification)
    updateDocument()
  }
}
