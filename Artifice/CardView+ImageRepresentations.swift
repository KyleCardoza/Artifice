//
//  CardView+ImageRepresentation.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-04.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension CardView {
  
  func pdfRepresentation() -> Data? {
    
    let targetRect: NSRect
    
    if orientation == .landscape {
      targetRect = NSRect(x: 0, y: 0, width: 2250, height: 1650)
    } else {
      targetRect = NSRect(x: 0, y: 0, width: 1650, height: 2250)
    }
    
    let scale = targetRect.size.width / bounds.size.width
    
    guard let bir = NSBitmapImageRep(bitmapDataPlanes: nil,
                               pixelsWide: Int(targetRect.size.width),
                               pixelsHigh: Int(targetRect.size.height),
                               bitsPerSample: 8,
                               samplesPerPixel: 4,
                               hasAlpha: true,
                               isPlanar: false,
                               colorSpaceName: NSColorSpaceName.calibratedRGB,
                               bytesPerRow: 4 * Int(targetRect.size.width),
                               bitsPerPixel: 32) else { return nil }
    
    // NSGraphicsContext.saveGraphicsState()
    
    let context = NSGraphicsContext(bitmapImageRep: bir)
    
    NSGraphicsContext.current = context
    
    NSGraphicsContext.current?.cgContext.scaleBy(x: scale, y: scale)
    
    displayIgnoringOpacity(bounds, in: context!)
    
    let image = NSImage(size: bir.size)
    image.addRepresentation(bir)
    
    let tempImageViewRect = NSRect(x: 0, y: 0, width: 1650, height: 2250)
    
    let tempImageView = NSImageView(frame: tempImageViewRect)
    
    if orientation == .landscape {
      tempImageView.image = image.rotated(90.0)
    } else {
      tempImageView.image = image
    }
    
    // NSGraphicsContext.restoreGraphicsState()
    
    return tempImageView.dataWithPDF(inside: tempImageViewRect)
  }
  
  
  func pngRepresentation(size: NSSize) -> Data? {
    guard
      let pdfRep = pdfRepresentation(),
      let pdfSource = NSPDFImageRep(data: pdfRep) else {
        return nil
    }
    
    pdfSource.currentPage = 1
    
    NSGraphicsContext.current?.imageInterpolation = .medium
    
    let sourceRect = NSRect(x: 100, y: 100, width: 1450, height: 2050)
    let destinationRect = NSRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
    
    let image = NSImage(size: size)
    image.lockFocus()
    
    pdfSource.draw(in: destinationRect,
                   from: sourceRect,
                   operation: .copy,
                   fraction: 1.0,
                   respectFlipped: false,
                   hints: nil)
    
    let bitmap = NSBitmapImageRep(focusedViewRect: destinationRect)
    
    image.unlockFocus()
    
    return bitmap?.representation(using: .png,
                                  properties: [NSBitmapImageRep.PropertyKey : AnyObject]())
  }
  
  
  func pngRepresentationForPrinting(size: NSSize) -> Data? {
    guard
      let pdfRep = pdfRepresentation(),
      let pdfSource = NSPDFImageRep(data: pdfRep) else {
        return nil
    }
    
    pdfSource.currentPage = 1
    
    NSGraphicsContext.current?.imageInterpolation = .medium
    
    let sourceSize = pdfSource.size
    
    let sourceRect = NSRect(x: 0.0, y: 0.0, width: sourceSize.width, height: sourceSize.height)
    let destinationRect = NSRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
    
    let image = NSImage(size: size)
    image.lockFocus()
    
    pdfSource.draw(in: destinationRect,
                   from: sourceRect,
                   operation: .copy,
                   fraction: 1.0,
                   respectFlipped: false,
                   hints: nil)
    
    let bitmap = NSBitmapImageRep(focusedViewRect: destinationRect)
    
    image.unlockFocus()
    
    return bitmap?.representation(using: .png,
                                  properties: [NSBitmapImageRep.PropertyKey : AnyObject]())
  }
}
