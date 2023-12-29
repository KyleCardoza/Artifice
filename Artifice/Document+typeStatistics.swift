//
//  Document+typeStatistics.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-30.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension CardSet {
  var creatureCount: Int {
    return cards.filter { $0.cardType.contains("Creature") }.count
  }
  var instantCount: Int {
    return cards.filter { $0.cardType.contains("Instant") }.count
  }
  var sorceryCount: Int {
    return cards.filter { $0.cardType.contains("Sorcery") }.count
  }
  var artifactCount: Int {
    return cards.filter { $0.cardType.contains("Artifact") }.count
  }
  var enchantmentCount: Int {
    return cards.filter { $0.cardType.contains("Enchantment") }.count
  }
  var planeswalkerCount: Int {
    return cards.filter { $0.cardType.contains("Planeswalker") }.count
  }
  var landTypeCount: Int {
    return cards.filter { $0.cardType.contains("Land") }.count
  }
}

extension Document {
  
  var typeBarUnit: CGFloat {
    let maxHeight = CGFloat(220.0)
    let counts = [
      set.commonCount,
      set.instantCount,
      set.sorceryCount,
      set.artifactCount,
      set.enchantmentCount,
      set.planeswalkerCount,
      set.landTypeCount
    ]
    guard let maxCount = counts.max() else { return 0.0 }
    
    if maxCount == 0 {
      return 0.0
    } else {
      return maxHeight / CGFloat(maxCount)
    }
  }
  
  func updateTypeCountLabels() {
    creatureCount.intValue = Int32(set.creatureCount)
    instantCount.intValue = Int32(set.instantCount)
    sorceryCount.intValue = Int32(set.sorceryCount)
    artifactCount.intValue = Int32(set.artifactCount)
    enchantmentCount.intValue = Int32(set.enchantmentCount)
    planeswalkerCount.intValue = Int32(set.planeswalkerCount)
    landTypeCount.intValue = Int32(set.landTypeCount)
  }
  
  func updateTypeBars() {
    creatureBarHeightConstraint.constant = CGFloat(set.creatureCount) * typeBarUnit
    instantBarHeightConstraint.constant = CGFloat(set.instantCount) * typeBarUnit
    sorceryBarHeightConstraint.constant = CGFloat(set.sorceryCount) * typeBarUnit
    artifactBarHeightConstraint.constant = CGFloat(set.artifactCount) * typeBarUnit
    enchantmentBarHeightConstraint.constant = CGFloat(set.enchantmentCount) * typeBarUnit
    planeswalkerBarHeightConstraint.constant = CGFloat(set.planeswalkerCount) * typeBarUnit
    landTypeBarHeightConstraint.constant = CGFloat(set.landTypeCount) * typeBarUnit
  }
  
  func updateTypeStatisticsView() {
    updateTypeCountLabels()
    updateTypeBars()
  }
}

