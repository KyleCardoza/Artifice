//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class ArtistNameTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
  override func controlTextDidChange(_ obj: Notification) {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
      let card = doc.card else {
        return
    }
    
    let string = doc.artistNameField.stringValue.replacingOccurrences(of: "\n", with: "")
    
    card.artistName = string
    doc.cardView.activeTemplate?.updateArtistName(card: card)
    
    doc.updateChangeCount(.changeDone)
  }
}
