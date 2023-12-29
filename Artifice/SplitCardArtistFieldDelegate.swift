//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class SplitCardArtistNameTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
  override func controlTextDidChange(_ obj: Notification) {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
      let card = doc.card else {
        return
    }
    
    let string = doc.splitCardRightArtistNameTextField.stringValue.replacingOccurrences(of: "\n", with: "")
    
    card.childCard?.artistName = string
    doc.landscapeCardView.activeTemplate?.updateArtistName(card: card)
    
    doc.updateChangeCount(.changeDone)
  }
}
