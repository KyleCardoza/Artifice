//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class ManaCostTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
  override func controlTextDidChange(_ obj: Notification) {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
      let card = doc.card else {
        return
    }
    
    card.manaCost = doc.manaCostField.stringValue
    doc.cardView.activeTemplate?.updateManaCost(card: card)
    doc.cardView.activeTemplate?.updateBackgroundTexture(card: card)
    doc.cardView.activeTemplate?.updatePTBox(card: card)
    doc.cardView.activeTemplate?.updateTextBox(card: card)
    doc.cardView.activeTemplate?.updateCardFrame(card: card)
    doc.cardView.activeTemplate?.updateFrameBorder(card: card)
    doc.cardView.activeTemplate?.updateTitlebarAndTypeLine(card: card)
    
    if let row = doc.searchResults.index(of: card) {
      let rowIndex = IndexSet(integer: row)
      let columnIndex = IndexSet(integer: 1)
      doc.cardsTable.reloadData(forRowIndexes: rowIndex, columnIndexes: columnIndex)
    }
    
    doc.updateChangeCount(.changeDone)
  }

  
  func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
          let card = doc.card else {
      return true
    }
    
    doc.card?.manaCost = sanitizeManaCost(string: control.stringValue)
    
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
    
    doc.updateDocument()
    
    return true
  }
}
 
