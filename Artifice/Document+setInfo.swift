//
//  Document+statistics.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-30.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class SetInfoWindow: NSWindow {
  override var canBecomeKey: Bool {
    return true
  }
}

extension Document {
  
  @IBAction func displaySetInfoSheet(_ sender: AnyObject) {
    guard let window = windowForSheet else { return }
    
    for sheet in window.sheets {
      window.endSheet(sheet)
    }
    
    setInfoVisible = true
    window.beginSheet(setInfoSheet, completionHandler: nil)
  }
  
  @IBAction func dismissSetInfoSheet(_ sender: AnyObject) {
    guard let window = windowForSheet else { return }
    setInfoVisible = false
    window.endSheet(setInfoSheet)
    statisticsSheet.orderOut(self)
  }
}
