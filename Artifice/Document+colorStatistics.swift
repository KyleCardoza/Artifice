//
//  Document+rarityStatistics.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-30.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension CardSet {
  var whiteCount: Int {
    return cards.filter { $0.colors == 1 && $0.isWhite && !$0.isLand }.count
  }
  var blueCount: Int {
    return cards.filter { $0.colors == 1 && $0.isBlue && !$0.isLand }.count
  }
  var blackCount: Int {
    return cards.filter { $0.colors == 1 && $0.isBlack && !$0.isLand }.count
  }
  var redCount: Int {
    return cards.filter { $0.colors == 1 && $0.isRed && !$0.isLand }.count
  }
  var greenCount: Int {
    return cards.filter { $0.colors == 1 && $0.isGreen && !$0.isLand }.count
  }
  var colorlessCount: Int {
    return cards.filter { $0.isColorless && !$0.isLand }.count
  }
  var multicoloredCount: Int {
    return cards.filter { $0.colors > 1 && !$0.isLand }.count
  }
  var landCount: Int {
    return cards.filter { $0.isLand }.count
  }
}

extension Document {
  
  var colorBarUnit: CGFloat {
    let maxHeight = CGFloat(300.0)
    let counts = [
      set.whiteCount,
      set.blueCount,
      set.blackCount,
      set.redCount,
      set.greenCount,
      set.colorlessCount,
      set.multicoloredCount,
      set.landCount
    ]
    guard let maxCount = counts.max() else { return 0.0 }
    
    if maxCount == 0 {
      return 0
    } else {
      return maxHeight / CGFloat(maxCount)
    }
  }
  
  func updateColorCountLabels() {
    whiteCount.intValue = Int32(set.whiteCount)
    blueCount.intValue = Int32(set.blueCount)
    blackCount.intValue = Int32(set.blackCount)
    redCount.intValue = Int32(set.redCount)
    greenCount.intValue = Int32(set.greenCount)
    colorlessCount.intValue = Int32(set.colorlessCount)
    multicoloredCount.intValue = Int32(set.multicoloredCount)
    landCount.intValue = Int32(set.landCount)
  }
  
  func updateColorBars() {
    whiteBarHeightConstraint.constant = CGFloat(set.whiteCount) * colorBarUnit
    blueBarHeightConstraint.constant = CGFloat(set.blueCount) * colorBarUnit
    blackBarHeightConstraint.constant = CGFloat(set.blackCount) * colorBarUnit
    redBarHeightConstraint.constant = CGFloat(set.redCount) * colorBarUnit
    greenBarHeightConstraint.constant = CGFloat(set.greenCount) * colorBarUnit
    colorlessBarHeightConstraint.constant = CGFloat(set.colorlessCount) * colorBarUnit
    multicoloredBarHeightConstraint.constant = CGFloat(set.multicoloredCount) * colorBarUnit
    landBarHeightConstraint.constant = CGFloat(set.landCount) * colorBarUnit
  }
  
  func updateColorStatisticsView() {
    updateColorCountLabels()
    updateColorBars()
  }
}

