//
//  Document+rarityStatistics.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-30.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension CardSet {
  var commonCount: Int {
    return cards.filter { $0.rarityCode == "C" }.count
  }
  var uncommonCount: Int {
    return cards.filter { $0.rarityCode == "U" }.count
  }
  var rareCount: Int {
    return cards.filter { $0.rarityCode == "R" }.count
  }
  var mythicCount: Int {
    return cards.filter { $0.rarityCode == "M" }.count
  }
  var specialCount: Int {
    return cards.filter { $0.rarityCode == "S" }.count
  }
  var bonusCount: Int {
    return cards.filter { $0.rarityCode == "B" }.count
  }
  var basicLandCount: Int {
    return cards.filter { $0.rarityCode == "L" }.count
  }
  var tokenCount: Int {
    return cards.filter { $0.rarityCode == "T" }.count
  }
  var promoCount: Int {
    return cards.filter { $0.rarityCode == "P" }.count
  }
}

extension Document {
  
  var rarityBarUnit: CGFloat {
    let maxHeight = CGFloat(300.0)
    let counts = [
      set.commonCount,
      set.uncommonCount,
      set.rareCount,
      set.mythicCount,
      set.specialCount,
      set.bonusCount,
      set.basicLandCount,
      set.tokenCount,
      set.promoCount
    ]
    guard let maxCount = counts.max() else { return 0.0 }
    
    if maxCount == 0 {
      return 0
    } else {
      return maxHeight / CGFloat(maxCount)
    }
  }
  
  func updateRarityCountLabels() {
    commonCount.intValue = Int32(set.commonCount)
    uncommonCount.intValue = Int32(set.uncommonCount)
    rareCount.intValue = Int32(set.rareCount)
    mythicCount.intValue = Int32(set.mythicCount)
    specialCount.intValue = Int32(set.specialCount)
    bonusCount.intValue = Int32(set.bonusCount)
    basicLandCount.intValue = Int32(set.basicLandCount)
    tokenCount.intValue = Int32(set.tokenCount)
    promoCount.intValue = Int32(set.promoCount)
  }
  
  func updateRarityBars() {
    commonBarHeightConstraint.constant = CGFloat(set.commonCount) * rarityBarUnit
    uncommonBarHeightConstraint.constant = CGFloat(set.uncommonCount) * rarityBarUnit
    rareBarHeightConstraint.constant = CGFloat(set.rareCount) * rarityBarUnit
    mythicBarHeightConstraint.constant = CGFloat(set.mythicCount) * rarityBarUnit
    specialBarHeightConstraint.constant = CGFloat(set.specialCount) * rarityBarUnit
    bonusBarHeightConstraint.constant = CGFloat(set.bonusCount) * rarityBarUnit
    basicLandBarHeightConstraint.constant = CGFloat(set.basicLandCount) * rarityBarUnit
    tokenBarHeightConstraint.constant = CGFloat(set.tokenCount) * rarityBarUnit
    promoBarHeightConstraint.constant = CGFloat(set.promoCount) * rarityBarUnit
  }
  
  func updateRarityStatisticsView() {
    updateRarityCountLabels()
    updateRarityBars()
  }
}

