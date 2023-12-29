//
//  ReplaceManaText.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-13.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension NSMutableAttributedString {
  func replacingManaText(size: CGFloat, align: NSTextAlignment) {
    func replace(_ substring: String, with replacement: NSAttributedString) {
      while self.mutableString.range(of: substring).location != NSNotFound {
        let range = self.mutableString.range(of: substring)
        self.replaceCharacters(in: range, with: replacement)
      }
    }
    
    replace("2/W", with: ManaSymbol(type: .hybridColorless(.white)).attributedString(size: size, align: align))
    
    replace("2/U", with: ManaSymbol(type: .hybridColorless(.blue)).attributedString(size: size, align: align))
    
    replace("2/B", with: ManaSymbol(type: .hybridColorless(.black)).attributedString(size: size, align: align))
    
    replace("2/R", with: ManaSymbol(type: .hybridColorless(.red)).attributedString(size: size, align: align))
    
    replace("2/G", with: ManaSymbol(type: .hybridColorless(.green)).attributedString(size: size, align: align))
    
    
    replace("W/P", with: ManaSymbol(type: .phyrexian(.white)).attributedString(size: size, align: align))
    
    replace("U/P", with: ManaSymbol(type: .phyrexian(.blue)).attributedString(size: size, align: align))
    
    replace("B/P", with: ManaSymbol(type: .phyrexian(.black)).attributedString(size: size, align: align))
    
    replace("R/P", with: ManaSymbol(type: .phyrexian(.red)).attributedString(size: size, align: align))
    
    replace("G/P", with: ManaSymbol(type: .phyrexian(.green)).attributedString(size: size, align: align))
    
    
    replace("W/U", with: ManaSymbol(type: .hybrid(.white, .blue)).attributedString(size: size, align: align))
    
    replace("W/B", with: ManaSymbol(type: .hybrid(.white, .black)).attributedString(size: size, align: align))
    
    replace("U/B", with: ManaSymbol(type: .hybrid(.blue, .black)).attributedString(size: size, align: align))
    
    replace("U/R", with: ManaSymbol(type: .hybrid(.blue, .red)).attributedString(size: size, align: align))
    
    replace("B/R", with: ManaSymbol(type: .hybrid(.black, .red)).attributedString(size: size, align: align))
    
    replace("B/G", with: ManaSymbol(type: .hybrid(.black, .green)).attributedString(size: size, align: align))
    
    replace("R/G", with: ManaSymbol(type: .hybrid(.red, .green)).attributedString(size: size, align: align))
    
    replace("R/W", with: ManaSymbol(type: .hybrid(.red, .white)).attributedString(size: size, align: align))
    
    replace("G/W", with: ManaSymbol(type: .hybrid(.green, .white)).attributedString(size: size, align: align))
    
    replace("G/U", with: ManaSymbol(type: .hybrid(.green, .blue)).attributedString(size: size, align: align))
  }
}
