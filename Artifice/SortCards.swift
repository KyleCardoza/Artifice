//
//  Sort.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

/*
 
 The card sort function is an X-step process:
 
 1. The left and right cards are each assigned a primary sort number, one of:
 
 - Bonus (group 1)
 - Special (group 2)
 - Normal (group 3)
 - Token (group 4)
 
 2. The left and right cards are each assigned a secondary sort number, one of:
 
 - Colorless non-artifact (group 1)
 - Mono-white (group 2)
 - Mono-blue (group 3)
 - Mono-black (group 4)
 - Mono-red (group 5)
 - Mono-green (group 6)
 - 2-color hybrid (group 7)
 - Multicolored (group 8)
 - Colorless Artifact (group 9)
 - Nonbasic land (group 10)
 - Basic land (group 11)
 
 3. Compare the two cards' primary sort number:
 - If the two numbers are not equal, then the cards sort by primary sort
 number, ascending
 
 4. Compare the two cards' secondary sort number
 - If the two numbers are not equal, then the cards sort by secondary sort
 number, ascending
 
 5. Compare the names of the cards
 - If the two names are not equal, then the cards sort alphabetically by name,
 ignoring initial "A ", "The ", and "Of ".

*/

import Foundation

extension Card {
  var primarySortNumber: Int {
    switch rarityCode {
    case "B":
      return 1
    case "S":
      return 2
    case "T":
      return 4
    default:
      return 3
    }
  }
  
  var secondarySortNumber: Int {
    switch colors {
    case 0...5 where isBasicLand:
      return 12
    case 0...5 where isNonbasicLand:
      return 11
    case 0 where isArtifact:
      return 10
    case 0...5 where template == .split:
      return 9
    case 3...5:
      return 8
    case 2 where !isHybrid:
      return 8
    case 2 where isHybrid:
      return 7
    case 1 where isGreen:
      return 6
    case 1 where isRed:
      return 5
    case 1 where isBlack:
      return 4
    case 1 where isBlue:
      return 3
    case 1 where isWhite:
      return 2
    default:
      return 1
    }
  }
}

func <(left: Card, right: Card) -> Bool {
  if left.primarySortNumber > right.primarySortNumber {
    return false
  } else if left.primarySortNumber < right.primarySortNumber {
    return true
  } else if left.secondarySortNumber > right.secondarySortNumber {
    return false
  } else if left.secondarySortNumber < right.secondarySortNumber {
    return true
  } else if left.template == .split && right.template == .split {
    return compareSplitCards(left: left, right: right)
  } else {
    return left.name < right.name
  }
}

func colorsInSplitCard(_ card: Card) -> Int {
  var colors = 0
  
  colors += card.colors
  
  if let child = card.childCard {
    colors += child.colors
  }
  
  return colors
}

func compareSplitCards(left: Card, right: Card) -> Bool {
  
  let leftNumber: Int = {
    switch colorsInSplitCard(left) {
    case 3...5:
      return 8
    case 2:
      return 7
    case 1 where left.isGreen:
      return 6
    case 1 where left.isRed:
      return 5
    case 1 where left.isBlack:
      return 4
    case 1 where left.isBlue:
      return 3
    case 1 where left.isWhite:
      return 2
    default:
      return 1
    }
  }()

  let rightNumber: Int = {
    switch colorsInSplitCard(right) {
    case 3...5:
      return 8
    case 2:
      return 7
    case 1 where right.isGreen:
      return 6
    case 1 where right.isRed:
      return 5
    case 1 where right.isBlack:
      return 4
    case 1 where right.isBlue:
      return 3
    case 1 where right.isWhite:
      return 2
    default:
      return 1
    }
  }()
  
  if leftNumber == rightNumber {
    var leftName = "\(left.name) //"
    
    if let child = left.childCard {
      leftName = leftName + " " + child.name
    }
    
    var rightName = "\(right.name) //"
    
    if let child = right.childCard {
      rightName = rightName + " " + child.name
    }
    
    return leftName > rightName
    
  }
  
  return leftNumber > rightNumber
}

func >(left: Card, right: Card) -> Bool {
  return !(left<right)
}

func ==(left: Card, right: Card) -> Bool {
  return !(left>right) && !(left<right)
}

extension CardSet {
  func sortCards() {
    cards.sort { left, right in
      left < right
    }
  }
}
