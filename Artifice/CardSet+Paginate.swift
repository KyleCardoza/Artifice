//
//  Document+PaginateCardSet.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-18.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Foundation

extension CardSet {
  func paginated() -> [[Card]] {
    var pages = [[Card]]()
    
    var page = 0
    var index = 0
    
    for card in cards {
      if index == 0 {
        pages.append([Card]())
      }
      pages[page].append(card)
      index += 1
      if index > 5 {
        index = 0
        page += 1
      }
    }
    
    return pages
  }
}
