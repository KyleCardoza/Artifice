//
//  parseManaStrings.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-02.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

func replaceCardName(string: NSMutableString, with name: String) {
  
  let shortname = name
    .components(separatedBy: " ")[0]
    .components(separatedBy: ",")[0]
  
  string.replaceOccurrences(of: "{CARDNAME}",
                            with: name,
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: string.length))
  
  string.replaceOccurrences(of: "{SHORTNAME}",
                            with: shortname,
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: string.length))
}

func replaceDashes(string: NSMutableString) {
  string.replaceOccurrences(of: "--",
                            with: "—",
                            options: .literal,
                            range: NSRange(
                              location: 0,
                              length: string.length))
}

func filterEmphasis(italic: Bool, string: NSMutableAttributedString, size: CGFloat, align: NSTextAlignment) {
  
  let regularFont: NSFont! = CardTemplateView.Font.mplantin(size: size).nsFont
  let italicFont: NSFont! = CardTemplateView.Font.mplantinItalic(size: size).nsFont
  let boldFont: NSFont! = CardTemplateView.Font.mplantinBold(size: size).nsFont
  
  let emphasisFont: NSFont!
  
  if italic {
    emphasisFont = italicFont
  } else {
    emphasisFont = regularFont
  }
  
  do {
    var regex: NSRegularExpression
    
    regex = try NSRegularExpression(pattern: "<em>.*<\\/em>", options: .anchorsMatchLines)
    
    regex.enumerateMatches(in: string.mutableString as String,
                           options: .reportCompletion,
                           range: NSRange(
                            location: 0,
                            length: string.length)) { result, flags, stop in
                              
                              if let result = result {
                                string.addAttribute(NSAttributedStringKey.font,
                                                    value: emphasisFont,
                                                    range: result.range)
                              }
    }
    
    regex = try NSRegularExpression(pattern: "<b>.*<\\/b>", options: .anchorsMatchLines)
    
    regex.enumerateMatches(in: string.mutableString as String,
                           options: .reportCompletion,
                           range: NSRange(
                            location: 0,
                            length: string.length)) { result, flags, stop in
                              
                              if let result = result {
                                string.addAttribute(NSAttributedStringKey.font,
                                                    value: boldFont,
                                                    range: result.range)
                              }
    }
    
    regex = try NSRegularExpression(pattern: "<i>.*<\\/i>", options: .anchorsMatchLines)
    
    regex.enumerateMatches(in: string.mutableString as String,
                           options: .reportCompletion,
                           range: NSRange(
                            location: 0,
                            length: string.length)) { result, flags, stop in
                              
                              if let result = result {
                                string.addAttribute(NSAttributedStringKey.font,
                                                    value: italicFont,
                                                    range: result.range)
                              }
    }
    
    regex = try NSRegularExpression(pattern: "<r>.*<\\/r>", options: .anchorsMatchLines)
    
    regex.enumerateMatches(in: string.mutableString as String,
                           options: .reportCompletion,
                           range: NSRange(
                            location: 0,
                            length: string.length)) { result, flags, stop in
                              
                              if let result = result {
                                string.addAttribute(NSAttributedStringKey.font,
                                                    value: regularFont,
                                                    range: result.range)
                              }
    }
    
    string.mutableString.replaceOccurrences(of: "<b>", with: "", options: NSString.CompareOptions.literal, range: NSRange(location: 0, length:string.mutableString.length))
    string.mutableString.replaceOccurrences(of: "</b>", with: "", options: NSString.CompareOptions.literal, range: NSRange(location: 0, length:string.mutableString.length))
    
    string.mutableString.replaceOccurrences(of: "<em>", with: "", options: NSString.CompareOptions.literal, range: NSRange(location: 0, length:string.mutableString.length))
    string.mutableString.replaceOccurrences(of: "</em>", with: "", options: NSString.CompareOptions.literal, range: NSRange(location: 0, length:string.mutableString.length))
    
    string.mutableString.replaceOccurrences(of: "<r>", with: "", options: NSString.CompareOptions.literal, range: NSRange(location: 0, length:string.mutableString.length))
    string.mutableString.replaceOccurrences(of: "</r>", with: "", options: NSString.CompareOptions.literal, range: NSRange(location: 0, length:string.mutableString.length))
    
    string.mutableString.replaceOccurrences(of: "<i>", with: "", options: NSString.CompareOptions.literal, range: NSRange(location: 0, length:string.mutableString.length))
    string.mutableString.replaceOccurrences(of: "</i>", with: "", options: NSString.CompareOptions.literal, range: NSRange(location: 0, length:string.mutableString.length))
  }
  catch {
    
  }
}


func parseBodyText(string: NSMutableAttributedString, size: CGFloat, align: NSTextAlignment) {
  
  func replace(_ substring: String, with replacement: NSAttributedString) {
    while string.mutableString.range(of: substring).location != NSNotFound {
      let range = string.mutableString.range(of: substring)
      string.replaceCharacters(in: range, with: replacement)
    }
  }
  
  replaceDashes(string: string.mutableString)
  
  do {
    
    let font: NSFont! = CardTemplateView.Font.mplantinItalic(size: size).nsFont
    
    var regex = try NSRegularExpression(pattern: "\\([^\\(]*\\)", options: .useUnixLineSeparators)
  
    regex.enumerateMatches(in: string.mutableString as String,
                           options: .reportCompletion,
                           range: NSRange(
                            location: 0,
                            length: string.length)) { result, flags, stop in
      
                              if let result = result {
                                string.addAttribute(NSAttributedStringKey.font,
                                                    value: font,
                                                    range: result.range)
                              }
            
    }
    
    regex = try NSRegularExpression(pattern: "^[^\n]+— ", options: .anchorsMatchLines)
    
    regex.enumerateMatches(in: string.mutableString as String,
                           options: .reportCompletion,
                           range: NSRange(
                            location: 0,
                            length: string.length)) { result, flags, stop in
                              
                              if let result = result {
                                string.addAttribute(NSAttributedStringKey.font,
                                                    value: font,
                                                    range: result.range)
                              }
                              
    }
    
  }
  catch {
    
  }
  
  replace("{T}", with: ManaSymbol(type: .tap).attributedString(size: size, align: align))
  replace("{Q}", with: ManaSymbol(type: .untap).attributedString(size: size, align: align))
  
  replace("{W}", with: ManaSymbol(type: .normal(.white)).attributedString(size: size, align: align))
  replace("{U}", with: ManaSymbol(type: .normal(.blue)).attributedString(size: size, align: align))
  replace("{B}", with: ManaSymbol(type: .normal(.black)).attributedString(size: size, align: align))
  replace("{R}", with: ManaSymbol(type: .normal(.red)).attributedString(size: size, align: align))
  replace("{G}", with: ManaSymbol(type: .normal(.green)).attributedString(size: size, align: align))
  replace("{C}", with: ManaSymbol(type: .colorless).attributedString(size: size, align: align))
  
  replace("{2/W}", with: ManaSymbol(type: .hybridColorless(.white)).attributedString(size: size, align: align))
  replace("{2/U}", with: ManaSymbol(type: .hybridColorless(.blue)).attributedString(size: size, align: align))
  replace("{2/B}", with: ManaSymbol(type: .hybridColorless(.black)).attributedString(size: size, align: align))
  replace("{2/R}", with: ManaSymbol(type: .hybridColorless(.red)).attributedString(size: size, align: align))
  replace("{2/G}", with: ManaSymbol(type: .hybridColorless(.green)).attributedString(size: size, align: align))
  
  replace("{W/P}", with: ManaSymbol(type: .phyrexian(.white)).attributedString(size: size, align: align))
  replace("{U/P}", with: ManaSymbol(type: .phyrexian(.blue)).attributedString(size: size, align: align))
  replace("{B/P}", with: ManaSymbol(type: .phyrexian(.black)).attributedString(size: size, align: align))
  replace("{R/P}", with: ManaSymbol(type: .phyrexian(.red)).attributedString(size: size, align: align))
  replace("{G/P}", with: ManaSymbol(type: .phyrexian(.green)).attributedString(size: size, align: align))
  
  replace("{W/U}", with: ManaSymbol(type: .hybrid(.white, .blue)).attributedString(size: size, align: align))
  replace("{W/B}", with: ManaSymbol(type: .hybrid(.white, .black)).attributedString(size: size, align: align))
  replace("{U/B}", with: ManaSymbol(type: .hybrid(.blue, .black)).attributedString(size: size, align: align))
  replace("{U/R}", with: ManaSymbol(type: .hybrid(.blue, .red)).attributedString(size: size, align: align))
  replace("{B/R}", with: ManaSymbol(type: .hybrid(.black, .red)).attributedString(size: size, align: align))
  replace("{B/G}", with: ManaSymbol(type: .hybrid(.black, .green)).attributedString(size: size, align: align))
  replace("{R/G}", with: ManaSymbol(type: .hybrid(.red, .green)).attributedString(size: size, align: align))
  replace("{R/W}", with: ManaSymbol(type: .hybrid(.red, .white)).attributedString(size: size, align: align))
  replace("{G/W}", with: ManaSymbol(type: .hybrid(.green, .white)).attributedString(size: size, align: align))
  replace("{G/U}", with: ManaSymbol(type: .hybrid(.green, .blue)).attributedString(size: size, align: align))
  
  replace("{X}", with: ManaSymbol(type: .variable).attributedString(size: size, align: align))
  
  replace("{Y}", with: ManaSymbol(type: .variableY).attributedString(size: size, align: align))
  
  replace("{S}", with: ManaSymbol(type: .snow).attributedString(size: size, align: align))
  
  for i in 0...20 {
    replace("{\(i)}", with: ManaSymbol(type: .generic(i)).attributedString(size: size, align: align))
    
    replace("{E}", with: ManaSymbol(type: .energyCounter).attributedString(size: size, align: align))
  }
}

