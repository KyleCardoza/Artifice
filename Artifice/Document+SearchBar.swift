//
//  Document+SearchBar.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension Document {
  
  func updateSearchResults(){
    if searchField.stringValue == "" {
      searchResults = set.cards
    } else {
      searchResults = set.cards.filter { card in
        (card.artistName as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound ||
        (card.cardType as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound ||
        (card.flavorText as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound ||
        (card.name as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound ||
        (card.planeswalkerAbility1 as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound ||
        (card.planeswalkerAbility2 as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound ||
        (card.planeswalkerAbility3 as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound ||
        (card.planeswalkerAbility4 as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound ||
        (card.manaCost as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound ||
        (card.rulesText as NSString).range(of: searchField.stringValue, options: .caseInsensitive).location != NSNotFound
      }
    }
  }
  
  @IBAction func searchBarStringChanged(_ sender: NSSearchField) {
    updateSearchResults()
    cardsTable.reloadData()
    if searchResults.count > 0 {
      let idx = IndexSet(integer: 0)
      cardsTable.selectRowIndexes(idx, byExtendingSelection: false)
      cardsTable.scrollRowToVisible(0)
      card = searchResults[0]
      updateForm()
      if let card = card {
        cardView.update(card: card, set: set)
      }
    }
  }
}
