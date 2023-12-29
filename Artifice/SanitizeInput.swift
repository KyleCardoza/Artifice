//
//  SanitizeInput.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-05.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

func sanitizePowerToughness(string sourceString: String) -> String {
  // Filters out any text that isn't a number or an * or a -
  do {
    
    let sourceString: NSString = sourceString as NSString
    
    var destinationString: NSString = ""
    
    let regex = try NSRegularExpression(pattern: "[0-9|\\-|\\*]*", options: .useUnixLineSeparators)
    
    
    regex.enumerateMatches(in: sourceString as String,
                           options: .reportCompletion,
                           range: NSRange(
                            location: 0,
                            length: sourceString.length)) { result, _, _ in
                              
                              if let result = result {
                                destinationString = destinationString.appending(sourceString.substring(with: result.range)) as NSString
                                
                              }
                              
    }
    
    return destinationString as String
  }
  catch {
    return ""
  }
}

func sanitizeManaCost(string sourceString: String) -> String {
  // Filters out any text in a string not between {} brackets.
  do {
  
    let sourceString: NSString = sourceString as NSString
    
    var destinationString: NSString = ""

    let regex = try NSRegularExpression(pattern: "\\{[^\\{]*\\}", options: .useUnixLineSeparators)
    
    
    regex.enumerateMatches(in: sourceString as String,
                           options: .reportCompletion,
                           range: NSRange(
                            location: 0,
                            length: sourceString.length)) { result, _, _ in
                              
                              if let result = result {
                                destinationString = destinationString.appending(sourceString.substring(with: result.range)) as NSString
                                
                              }
                              
    }
    
    return destinationString as String
  }
  catch {
    return ""
  }
}
