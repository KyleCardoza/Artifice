//
//  parseManaCost.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-12.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension NSMutableAttributedString {
  func parseManaCost(size: CGFloat, align: NSTextAlignment, withShadow shadow: Bool = false) {
    
    func replace(_ substring: String, with replacement: NSAttributedString) {
      while self.mutableString.range(of: substring).location != NSNotFound {
        let range = self.mutableString.range(of: substring)
        self.replaceCharacters(in: range, with: replacement)
      }
    }
    
    replace("{2/W}", with: ManaSymbol(type: .hybridColorless(.white)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{2/U}", with: ManaSymbol(type: .hybridColorless(.blue)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{2/B}", with: ManaSymbol(type: .hybridColorless(.black)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{2/R}", with: ManaSymbol(type: .hybridColorless(.red)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{2/G}", with: ManaSymbol(type: .hybridColorless(.green)).attributedString(size: size, align: align, enableShadow: shadow))
    
    replace("{W/P}", with: ManaSymbol(type: .phyrexian(.white)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{U/P}", with: ManaSymbol(type: .phyrexian(.blue)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{B/P}", with: ManaSymbol(type: .phyrexian(.black)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{R/P}", with: ManaSymbol(type: .phyrexian(.red)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{G/P}", with: ManaSymbol(type: .phyrexian(.green)).attributedString(size: size, align: align, enableShadow: shadow))
    
    replace("{W/U}", with: ManaSymbol(type: .hybrid(.white, .blue)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{W/B}", with: ManaSymbol(type: .hybrid(.white, .black)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{U/B}", with: ManaSymbol(type: .hybrid(.blue, .black)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{U/R}", with: ManaSymbol(type: .hybrid(.blue, .red)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{B/R}", with: ManaSymbol(type: .hybrid(.black, .red)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{B/G}", with: ManaSymbol(type: .hybrid(.black, .green)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{R/G}", with: ManaSymbol(type: .hybrid(.red, .green)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{R/W}", with: ManaSymbol(type: .hybrid(.red, .white)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{G/W}", with: ManaSymbol(type: .hybrid(.green, .white)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{G/U}", with: ManaSymbol(type: .hybrid(.green, .blue)).attributedString(size: size, align: align, enableShadow: shadow))
    
    for i in 10...20 {
      replace("{\(i)}", with: ManaSymbol(type: .generic(i)).attributedString(size: size, align: align, enableShadow: shadow))
    }
    
    replace("{T}", with: ManaSymbol(type: .tap).attributedString(size: size, align: align))
    
    replace("{Q}", with: ManaSymbol(type: .untap).attributedString(size: size, align: align))
    
    replace("{W}", with: ManaSymbol(type: .normal(.white)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{U}", with: ManaSymbol(type: .normal(.blue)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{B}", with: ManaSymbol(type: .normal(.black)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{R}", with: ManaSymbol(type: .normal(.red)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{G}", with: ManaSymbol(type: .normal(.green)).attributedString(size: size, align: align, enableShadow: shadow))
    replace("{C}", with: ManaSymbol(type: .colorless).attributedString(size: size, align: align, enableShadow: shadow))
    
    replace("{X}", with: ManaSymbol(type: .variable).attributedString(size: size, align: align, enableShadow: shadow))
    
    replace("{Y}", with: ManaSymbol(type: .variableY).attributedString(size: size, align: align, enableShadow: shadow))
    
    replace("{S}", with: ManaSymbol(type: .snow).attributedString(size: size, align: align, enableShadow: shadow))
    
    for i in 0...9 {
      replace("{\(i)}", with: ManaSymbol(type: .generic(i)).attributedString(size: size, align: align, enableShadow: shadow))
    }
    
    replace("{E}", with: ManaSymbol(type: .energyCounter).attributedString(size: size, align: align))
  }
}
