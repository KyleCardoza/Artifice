//
//  DocumentTabViewDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-19.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class DocumentTabViewDelegate: NSObject, NSTabViewDelegate {
  
  func tabView(_ tabView: NSTabView, willSelect tabViewItem: NSTabViewItem?) {
    guard let doc = NSDocumentController.shared.currentDocument as? Document else {
      return
    }
    if let tabViewItem = tabViewItem {
      if tabViewItem.label == "Art" {
        doc.updateZoomArtView()
      }
    }
  }
}
