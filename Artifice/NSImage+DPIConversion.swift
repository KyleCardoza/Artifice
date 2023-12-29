//
//  NSImage+DPIConversion.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-08.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension NSImage {
  convenience init?(contentsOf url: URL) {
    self.init(contentsOf: url, dpi: 72.0)
  }
}
