//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class RulesTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
  func control(_ control: NSControl,
               textView: NSTextView,
               doCommandBy commandSelector: Selector) -> Bool {
    if commandSelector == #selector(control.insertNewline(_:)) {
      textView.insertNewlineIgnoringFieldEditor(self)
      return true
    } else {
      return false
    }
  }
  
  override func controlTextDidChange(_ obj: Notification) {
    guard let doc = NSDocumentController.shared.currentDocument as? Document,
          let card = doc.card else {
        return
    }
    card.rulesText = doc.rulesTextField.stringValue
    doc.cardView.activeTemplate?.updateTextBoxVisibility(card: card)
    doc.cardView.activeTemplate?.updateRulesText(card: card)
    
    doc.updateChangeCount(.changeDone)
  }
}
