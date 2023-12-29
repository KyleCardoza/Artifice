//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class ToughnessTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
  override func controlTextDidChange(_ obj: Notification) {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
      let card = doc.card else {
        return
    }
    card.toughness = doc.toughnessField.stringValue
    doc.cardView.activeTemplate?.updatePTBox(card: card)
    
    if let row = doc.searchResults.index(of: card) {
      let rowIndex = IndexSet(integer: row)
      let columnIndex = IndexSet(integer: 4)
      doc.cardsTable.reloadData(forRowIndexes: rowIndex, columnIndexes: columnIndex)
    }
    
    doc.updateChangeCount(.changeDone)
  }
}
