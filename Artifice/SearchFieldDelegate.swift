//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class SearchFieldDelegate: NSObject, NSControlTextEditingDelegate {
/*
  override func controlTextDidChange(_ obj: Notification) {
    guard let doc = NSDocumentController.shared().currentDocument as? Document,
          let sender = obj.object as? NSSearchField else {
        return
    }
    if sender.stringValue == "" {
      doc.searchResults = doc.set.cards
    } else {
      doc.searchResults = doc.set.cards.filter { card in
        card.artistName.lowercased().contains(sender.stringValue.lowercased()) ||
          card.cardType.lowercased().contains(sender.stringValue.lowercased()) ||
          card.artistName.lowercased().contains(sender.stringValue.lowercased()) ||
          card.flavorText.lowercased().contains(sender.stringValue.lowercased()) ||
          card.name.lowercased().contains(sender.stringValue.lowercased()) ||
          card.planeswalkerAbility1.lowercased().contains(sender.stringValue.lowercased()) ||
          card.planeswalkerAbility2.lowercased().contains(sender.stringValue.lowercased()) ||
          card.planeswalkerAbility3.lowercased().contains(sender.stringValue.lowercased()) ||
          card.planeswalkerAbility4.lowercased().contains(sender.stringValue.lowercased()) ||
          card.rulesText.lowercased().contains(sender.stringValue.lowercased())
      }
    }
    doc.cardsTable.reloadData()
  }
*/
}
