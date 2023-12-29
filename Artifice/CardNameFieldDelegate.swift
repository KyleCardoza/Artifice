//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class CardNameTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
  override func controlTextDidChange(_ obj: Notification) {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
      let card = doc.card else {
        return
    }

    card.name = doc.cardNameField.stringValue
    doc.cardView.activeTemplate?.updateCardName(card: card)
    doc.cardView.activeTemplate?.updateRulesText(card: card)
    doc.cardView.activeTemplate?.updateFlavorText(card: card)
    
    if let row = doc.searchResults.index(of: card) {
      let rowIndex = IndexSet(integer: row)
      let columnIndex = IndexSet(integer: 0)
      doc.cardsTable.reloadData(forRowIndexes: rowIndex, columnIndexes: columnIndex)
    }
    
    doc.updateChangeCount(.changeDone)
  }
  
  func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
      let card = doc.card else {
        return true
    }
    
    doc.set.sortCards()
    doc.updateSearchResults()
    doc.cardsTable.reloadData()
    
    
    if let index = doc.searchResults.index(of: card) {
      let index = IndexSet(integer: index)
      doc.cardsTable.selectRowIndexes(index, byExtendingSelection: false)
      doc.cardsTable.scrollRowToVisible(doc.cardsTable.selectedRow)
    }
    
    if let card = doc.card {
      doc.cardView.update(card: card, set: doc.set)
    }
    
    return true
  }
  
}
