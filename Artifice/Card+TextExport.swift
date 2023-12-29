//
//  Card+TextExport.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-03.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

/*
 ======================================================================
 Name:       Abbey Matron
 Cost:       2W
 Type:       Creature — Human Cleric
 Pow/Tgh:    (1/3)
 Rules Text: {W}, {T}: Abbey Matron gets +0/+3 until end of turn.
 Set/Rarity: Homelands Common
 ======================================================================
 
 */

import Cocoa

extension CardSet {
  
  var gathererText: String {

    var text = ""
    
    for card in cards {
      var rarity = ""
      
      switch card.rarityCode {
      case "C":
        rarity = "Common"
      case "U":
        rarity = "Uncommon"
      case "R":
        rarity = "Rare"
      case "M":
        rarity = "Mythic Rare"
      case "L":
        rarity = "Basic Land"
      case "S":
        rarity = "Special"
      case "P":
        rarity = "Promo"
      case "B":
        rarity = "Bonus"
      case "T":
        rarity = "Token"
      default:
        rarity = ""
      }
      
      text.append("======================================================================\n" + card.gathererText + "Set/Rarity:       \(name) \(rarity)\n" + "======================================================================\n\n")
      
    }
    
    return text
  }
  
  var cockatriceXML: String {
    
    var setXML = "<cockatrice_carddatabase version=\"3\">\n  <cards>\n"
    
    let cards = self.cards.filter { card in
      card.template != .token &&
      card.template != .fullArtToken
    }
    
    for card in cards {
      var rarity = ""
      
      switch card.rarityCode {
      case "C":
        rarity = "Common"
      case "U":
        rarity = "Uncommon"
      case "R":
        rarity = "Rare"
      case "M":
        rarity = "Mythic Rare"
      case "L":
        rarity = "Basic Land"
      case "S":
        rarity = "Special"
      case "P":
        rarity = "Promo"
      case "B":
        rarity = "Bonus"
      case "T":
        rarity = "Token"
      default:
        rarity = ""
      }
      
      let manaCost = card.manaCost
        .replacingOccurrences(of: "{", with: "")
        .replacingOccurrences(of: "}", with: "")
      
      var powTgh = ""
      if card.power != "" || card.toughness != "" {
        powTgh = "\(card.power)/\(card.toughness)\n"
      }
      
      var bodyText: String
      
      if card.template == .planeswalker3ability {
        bodyText = "\(card.planeswalkerAbility1Cost): \(card.planeswalkerAbility1)\n\(card.planeswalkerAbility2Cost): \(card.planeswalkerAbility2)\n\(card.planeswalkerAbility3Cost): \(card.planeswalkerAbility3)"
      } else if card.template == .planeswalker4ability {
        bodyText = "\(card.planeswalkerAbility1Cost): \(card.planeswalkerAbility1)\n\(card.planeswalkerAbility1Cost): \(card.planeswalkerAbility1)\n\(card.planeswalkerAbility2Cost): \(card.planeswalkerAbility2)\n\(card.planeswalkerAbility3Cost): \(card.planeswalkerAbility3)\n\(card.planeswalkerAbility4Cost): \(card.planeswalkerAbility4)"
      } else if card.template == .split {
        if let child = card.childCard {
          bodyText = card.rulesText + "\n\n---\n\n" + child.rulesText
        } else {
          bodyText = card.rulesText
        }
      } else {
        bodyText = card.rulesText
      }
      
      var name = card.name
      
      if card.template == .split {
        if let child = card.childCard {
          name += " // \(child.name)"
        }
      }
      
      let nameMT = NSMutableString(string: name)
      
      nameMT.replaceOccurrences(of: "“",
                            with: "\"",
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: nameMT.length))
      
      nameMT.replaceOccurrences(of: "”",
                            with: "\"",
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: nameMT.length))
      
      nameMT.replaceOccurrences(of: "‘",
                            with: "\'",
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: nameMT.length))
      
      nameMT.replaceOccurrences(of: "’",
                            with: "\'",
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: nameMT.length))
      
      let filteredName = nameMT as String
      
      let mt = NSMutableString(string: bodyText)
      
      mt.replaceOccurrences(of: "{CARDNAME}",
                            with: card.name,
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: mt.length))
      
      mt.replaceOccurrences(of: "“",
                            with: "\"",
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: mt.length))
      
      mt.replaceOccurrences(of: "”",
                            with: "\"",
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: mt.length))
      
      mt.replaceOccurrences(of: "‘",
                            with: "\'",
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: mt.length))
      
      mt.replaceOccurrences(of: "’",
                            with: "\'",
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: mt.length))
      
      bodyText = (mt as String)
        .replacingOccurrences(of: "<b>", with: "")
        .replacingOccurrences(of: "</b>", with: "")
        .replacingOccurrences(of: "<i>", with: "")
        .replacingOccurrences(of: "</i>", with: "")
        .replacingOccurrences(of: "<r>", with: "")
        .replacingOccurrences(of: "</r>", with: "")
        .replacingOccurrences(of: "<em>", with: "")
        .replacingOccurrences(of: "</em>", with: "")
      
      
      var cardXML = "    <card>\n" +
        "      <name>\(filteredName)</name>\n" +
      "      <set rarity=\"\(rarity)\" picURL=\"\">\(code)</set>\n"
      //"<related> <!-- Flipped side  --> </related>"
        
      if !card.isLand {
        if card.isWhite {
          cardXML += "      <color>W</color>\n"
        }
        if card.isBlue {
          cardXML += "      <color>U</color>\n"
        }
        if card.isBlack {
          cardXML += "      <color>B</color>\n"
        }
        if card.isRed {
          cardXML += "      <color>R</color>\n"
        }
        if card.isGreen {
          cardXML += "      <color>G</color>\n"
        }
      }
      
      cardXML += "      <manacost>\(manaCost)</manacost>\n"
      
      cardXML += "      <cmc>\(card.cmc)</cmc>\n"
      
      cardXML += "      <type>\(card.cardType)</type>\n"
      
      if powTgh != "" {
        cardXML += "      <pt>\(powTgh)</pt>\n"
      }
      
      if card.planeswalkerStartingLoyalty != "" {
        cardXML += "      <loyalty>\(card.planeswalkerStartingLoyalty)</loyalty>\n"
      }
      
      if card.isLand {
        cardXML += "      <tablerow>0</tablerow>\n"
      } else if
          card.cardType.contains("Instant") ||
          card.cardType.contains("Sorcery") ||
          card.cardType.contains("Scheme") ||
          card.cardType.contains("Conspiracy") ||
            card.cardType.contains("Emblem")  {
        cardXML += "      <tablerow>3</tablerow>\n"
      
      } else if card.cardType.contains("Creature") {
        cardXML += "      <tablerow>2</tablerow>\n"
      } else {
        cardXML += "      <tablerow>1</tablerow>\n"
      }
      
      
      cardXML += "      <text>\(bodyText)</text>\n"
      
      if card.rarityCode == "T" {
        cardXML += "      <token>1</token>\n"
      }
      
      if card.etbTapped {
        cardXML += "      <cipt>1</cipt>\n"
      }

      cardXML += "    </card>\n"
      
      setXML += cardXML
      
    }
    
    
    setXML += "  </cards>\n</cockatrice_carddatabase>\n"
    
    return setXML
  }
}

extension Card {
  var gathererText: String {
    
    var powTgh = ""
    if power != "" || toughness != "" {
      powTgh = "Pow/Tgh:          (\(power)/\(toughness))\n"
    }
    
    var bodyText: String
    
    if template == .planeswalker3ability {
      bodyText = "\(planeswalkerAbility1Cost): \(planeswalkerAbility1)\n\(planeswalkerAbility2Cost): \(planeswalkerAbility2)\n\(planeswalkerAbility3Cost): \(planeswalkerAbility3)\nStarting Loyalty: \(planeswalkerStartingLoyalty)"
    } else if template == .planeswalker4ability {
      bodyText = "\(planeswalkerAbility1Cost): \(planeswalkerAbility1)\n\(planeswalkerAbility1Cost): \(planeswalkerAbility1)\n\(planeswalkerAbility2Cost): \(planeswalkerAbility2)\n\(planeswalkerAbility3Cost): \(planeswalkerAbility3)\n\(planeswalkerAbility4Cost): \(planeswalkerAbility4)\nStarting Loyalty: \(planeswalkerStartingLoyalty)"
    } else {
      bodyText = rulesText
    }
    
    bodyText = bodyText
      .replacingOccurrences(of: "<b>", with: "")
      .replacingOccurrences(of: "</b>", with: "")
      .replacingOccurrences(of: "<i>", with: "")
      .replacingOccurrences(of: "</i>", with: "")
      .replacingOccurrences(of: "<r>", with: "")
      .replacingOccurrences(of: "</r>", with: "")
      .replacingOccurrences(of: "<em>", with: "")
      .replacingOccurrences(of: "</em>", with: "")
    
    let flavorText = self.flavorText
      .replacingOccurrences(of: "<b>", with: "")
      .replacingOccurrences(of: "</b>", with: "")
      .replacingOccurrences(of: "<i>", with: "")
      .replacingOccurrences(of: "</i>", with: "")
      .replacingOccurrences(of: "<r>", with: "")
      .replacingOccurrences(of: "</r>", with: "")
      .replacingOccurrences(of: "<em>", with: "")
      .replacingOccurrences(of: "</em>", with: "")
    
    return "Name:             \(name)\nCost:             \(manaCost)\nType:             \(cardType)\n\(powTgh)Rules Text:       \(bodyText)\nFlavor Text:      \(flavorText)\n"
  }
  
}
