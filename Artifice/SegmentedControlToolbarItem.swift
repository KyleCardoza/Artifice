//
//  SegmentedControlToolbarItem.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-11.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class SegmentedControlToolbarItem: NSToolbarItem {
  override func validate() {
    if let doc = NSDocumentController.shared.currentDocument as? Document {
      switch tag {
      case 0,
           1...5 where doc.set.cards.count > 0:
        isEnabled = true
      case 6 where doc.card != nil,
           7 where doc.card != nil:
        isEnabled = true
      default:
        isEnabled = false
      }
    }
  }
}
