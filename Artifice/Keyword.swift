//
//  Keyword.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-09.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Foundation

// When you give a Keyword instance a String, it will scan through it, and return a
// new string with text replaced according to the definition of the keyword and its
// reminder text.

// The base Keyword class is for keywords that do not have parameters or variants.

class Keyword: NSObject, NSCoding {
  
  // MARK: Embedded Types
  
  enum ReminderLevel: String {
    case expert
    case core
  }
  
  // MARK: - Member Variables
  
  var name: String = ""
  var tag: String = ""
  var tagReplacement = ""
  var reminderText: String = ""
  var reminderLevel: ReminderLevel
  
  // MARK: - Initializers
  
  init(name: String,
       tag: String,
       tagReplacement: String,
       reminderText: String,
       reminderLevel: ReminderLevel) {
    self.name = name
    self.tag = tag
    self.tagReplacement = tagReplacement
    self.reminderText = reminderText
    self.reminderLevel = reminderLevel
  }
  
  // MARK: - String Replacement
  
  
  /// Given a string, if that string contains our tag and the reminder level
  /// matches, replace the tag with the appropriate text, and tack the reminder
  /// text onto the end of that paragraph.
  /// - parameter string: The string to filter
  /// - parameter level: The reminder level to use.
  /// - returns: A new String instance, with the filtered text.
  func addReminderText(to string: String, level: ReminderLevel) -> String {
    switch level {
    case .core where reminderLevel == .core, .expert:
      return string.components(separatedBy: "\n").map { substring in
        return substring
          .replacingOccurrences(of: tag, with: tagReplacement)
          .appending(reminderText)
      }.joined(separator: "\n")
    default:
      return string
    }
  }
  
  func replaceTag(in string: String) -> String {
    return string
  }
  
  func appendReminderText(in string: String) -> String {
    return string
  }
  
  // MARK: - NSCoding Conformance
  
  enum Keys: String {
    case name
    case tag
    case reminderText
    case reminderLevel
  }
  
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(of: NSString.self,
                                 forKey: Keys.name.rawValue) as String? ?? ""
    
    tag = aDecoder.decodeObject(of: NSString.self,
                                forKey: Keys.tag.rawValue) as String? ?? ""
    
    reminderText = aDecoder.decodeObject(of: NSString.self,
                                         forKey: Keys.reminderText.rawValue) as String? ?? ""
    
    switch aDecoder.decodeObject(of: NSString.self,
                                 forKey: Keys.reminderLevel.rawValue) as String? {
    case ReminderLevel.core.rawValue?:
      reminderLevel = .core
    case ReminderLevel.expert.rawValue?:
      reminderLevel = .expert
    default:
      reminderLevel = .core
    }
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: Keys.name.rawValue)
    aCoder.encode(tag, forKey: Keys.tag.rawValue)
    aCoder.encode(reminderText, forKey: Keys.reminderText.rawValue)
    aCoder.encode(reminderLevel.rawValue, forKey: Keys.reminderLevel.rawValue)
  }
  
}
