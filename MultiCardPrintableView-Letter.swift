//
//  MultiCardPrintableView-Letter.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-18.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Foundation
//
//  StandardTemplateCardView.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-31.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

class MultiCardPrintableViewLetter: NSView {
  
  @IBOutlet weak var contentView: NSView!
  
  @IBOutlet weak var topLeftView: NSImageView!
  @IBOutlet weak var topRightView: NSImageView!
  @IBOutlet weak var middleLeftView: NSImageView!
  @IBOutlet weak var middleRightView: NSImageView!
  @IBOutlet weak var bottomLeftView: NSImageView!
  @IBOutlet weak var bottomRightView: NSImageView!
  
  @IBOutlet weak var setName: NSTextField!
  @IBOutlet weak var pageNumber: NSTextField!
  
  @IBOutlet weak var expansionSymbol: NSImageView!
  
  var topLeft: NSImage? {
    get {
      return topLeftView.image
    }
    set {
      topLeftView.image = newValue
    }
  }
  
  var topRight: NSImage? {
    get {
      return topRightView.image
    }
    set {
      topRightView.image = newValue
    }
  }
  
  var middleLeft: NSImage? {
    get {
      return middleLeftView.image
    }
    set {
      middleLeftView.image = newValue
    }
  }
  
  var middleRight: NSImage? {
    get {
      return middleRightView.image
    }
    set {
      middleRightView.image = newValue
    }
  }
  
  var bottomLeft: NSImage? {
    get {
      return bottomLeftView.image
    }
    set {
      bottomLeftView.image = newValue
    }
  }
  
  var bottomRight: NSImage? {
    get {
      return bottomRightView.image
    }
    set {
      bottomRightView.image = newValue
    }
  }
  
  subscript(index: Int) -> NSImage? {
    get {
      switch index {
      case 0:
        return bottomLeft
      case 1:
        return middleLeft
      case 2:
        return topLeft
      case 3:
        return bottomRight
      case 4:
        return middleRight
      case 5:
        return topRight
      default:
        return nil
      }
    }
    set {
      switch index {
      case 0:
        bottomLeft = newValue
      case 1:
        middleLeft = newValue
      case 2:
        topLeft = newValue
      case 3:
        bottomRight = newValue
      case 4:
        middleRight = newValue
      case 5:
        topRight = newValue
      default:
        return
      }
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initSubviews()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initSubviews()
  }
  
  func initSubviews() {
    Bundle(for: type(of: self))
      .loadNibNamed(NSNib.Name(rawValue: "MultiCardPrintableView-Letter"), owner: self, topLevelObjects: nil)
    contentView.frame = bounds
    addSubview(contentView)
  }
  
}
