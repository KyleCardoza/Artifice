//
//  NSImage+zoomed.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-01.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension NSImage {
  
  func zoomed(by zoomFactor: Double, aspectRatio: Double, offsetX: Double, offsetY: Double) -> NSImage {
    
    let zoomFactor = CGFloat(zoomFactor)
    let aspectRatio = CGFloat(aspectRatio)
    let offsetX = CGFloat(offsetX)
    let offsetY = CGFloat(offsetY)
    
    var targetWidth: CGFloat = 0.0
    var targetHeight: CGFloat = 0.0
    
    switch (size.width, size.height, aspectRatio) {
    case let (width, height, aspect) where width > height:
      targetHeight = height * (1 / zoomFactor)
      targetWidth = targetHeight * aspect
    case let (width, height, aspect) where width == height && aspect < 1:
      targetWidth = width * (1 / zoomFactor)
      targetHeight = targetWidth / aspect
    case let (width, height, aspect) where width == height && aspect == 1:
      targetWidth = width * (1 / zoomFactor)
      targetHeight = targetWidth
    case let (width, height, aspect) where width == height && aspect > 1:
      targetHeight = height * (1 / zoomFactor)
      targetWidth = targetHeight * aspect
    case let (width, height, aspect) where width < height:
      targetWidth = width * (1 / zoomFactor)
      targetHeight = targetWidth / aspect
    default:
      break
    }
    
    
    let sourceX: CGFloat = {
      let a = ((size.width - targetWidth) / 2)
      let b = ((size.width - targetWidth) / 200 * offsetX)
      return a + b
    }()
    
    let sourceY: CGFloat = {
      let a = ((size.height - targetHeight) / 2)
      let b = ((size.height - targetHeight) / 200 * offsetY)
      return a + b
    }()
    
    let sourceRect = NSRect(x: floor(sourceX), y: floor(sourceY), width: floor(targetWidth), height: floor(targetHeight))
    let targetRect = NSRect(x: 0.0, y: 0.0, width: floor(targetWidth), height: floor(targetHeight))
    
    let targetImage = NSImage(size: targetRect.size)
    
    targetImage.lockFocus()
    
    NSGraphicsContext.saveGraphicsState()
    
    NSGraphicsContext.current?.imageInterpolation = .high
    
    representations[0]
      .draw(in: targetRect,
            from: sourceRect,
            operation: .copy,
            fraction: 1.0,
            respectFlipped: false,
            hints: nil)
    
    NSGraphicsContext.restoreGraphicsState()
    
    targetImage.unlockFocus()
    
    return targetImage
    
  }
}
