//
//  rulesTextFieldDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import AppKit

class CardNotesTextFieldDelegate: NSObject, NSControlTextEditingDelegate {
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
}
