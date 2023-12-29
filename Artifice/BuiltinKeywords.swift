//
//  BuiltinKeywords.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-09.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Foundation

var BuiltinKeywords: [String:Keyword] = [

"Flying": Keyword(name: "Flying",
                  tag: "{flying}",
                  tagReplacement: "Flying",
                  reminderText: "This creature can’t be blocked except by creatures with flying or reach.",
                  reminderLevel: .core)
]
