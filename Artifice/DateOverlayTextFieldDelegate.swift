//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class DateOverlayTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
  override func controlTextDidChange(_ obj: Notification) {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
      let card = doc.card else {
        return
    }
    card.dateOverlay = doc.dateOverlayField.stringValue
    doc.cardView.activeTemplate?.updateDateOverlay(card: card)
    
    doc.updateChangeCount(.changeDone)
  }
}
