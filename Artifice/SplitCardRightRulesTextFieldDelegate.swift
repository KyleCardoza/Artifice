//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class SplitCardRightRulesTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
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
          let card = doc.card,
          let child = card.childCard else {
        return
    }
    child.rulesText = doc.splitCardRightRulesTextTextField.stringValue
    doc.landscapeCardView.activeTemplate?.updateRulesText(card: card)
    
    doc.updateChangeCount(.changeDone)
  }
}
