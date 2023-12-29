//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class SplitCardRightManaCostTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
  
  func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
          let card = doc.card,
          let child = card.childCard else {
      return true
    }
    
    child.manaCost = sanitizeManaCost(string: control.stringValue)
    
    doc.set.sortCards()
    doc.updateSearchResults()
    doc.cardsTable.reloadData()
    
    if let index = doc.searchResults.index(of: card) {
      let index = IndexSet(integer: index)
      doc.cardsTable.selectRowIndexes(index, byExtendingSelection: false)
      doc.cardsTable.scrollRowToVisible(doc.cardsTable.selectedRow)
    }
    
    doc.landscapeCardView.update(card: child, set: doc.set)
    
    doc.updateDocument()
    
    return true
  }
}
 
