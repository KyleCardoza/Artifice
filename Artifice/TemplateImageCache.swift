//
//  TemplateImageCache.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-16.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

enum Template {
  struct Mana {
    struct Colorless {
      static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Colorless Mana"))!.copy() as! NSImage }
      static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Colorless Mana (No Shadow)"))!.copy() as! NSImage }
    }
    struct White {
      static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "White Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "White Mana (No Shadow)"))!.copy() as! NSImage }
    }
    struct Blue {
      static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Blue Mana"))!.copy() as! NSImage }
      static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Blue Mana (No Shadow)"))!.copy() as! NSImage }
    }
    struct Black {
      static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Black Mana"))!.copy() as! NSImage }
      static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Black Mana (No Shadow)"))!.copy() as! NSImage }
    }
    struct Red {
      static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Red Mana"))!.copy() as! NSImage }
      static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Red Mana (No Shadow)"))!.copy() as! NSImage }
    }
    struct Green {
      static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Green Mana"))!.copy() as! NSImage }
      static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "Green Mana (No Shadow)"))!.copy() as! NSImage }
    }
    struct Generic {
      struct Zero {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "0 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "0 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct One {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "1 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "1 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Two {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "2 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "2 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Three {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "3 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "3 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Four {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "4 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "4 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Five {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "5 Generic Mana"))! }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "5 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Six {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "6 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "6 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Seven {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "7 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "7 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Eight {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "8 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "8 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Nine {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "9 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "9 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Ten {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "10 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "10 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Eleven {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "11 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "11 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Twelve {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "12 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "12 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Thirteen {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "13 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "13 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Fourteen {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "14 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "14 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Fifteen {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "15 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "15 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Sixteen {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "16 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "16 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Seventeen {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "17 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "17 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Eighteen {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "18 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "18 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Nineteen {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "19 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "19 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
      struct Twenty {
        static var shadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "20 Generic Mana"))!.copy() as! NSImage }
        static var noShadow: NSImage { return NSImage(named: NSImage.Name(rawValue: "20 Generic Mana (No Shadow)"))!.copy() as! NSImage }
      }
    }
  }
}
