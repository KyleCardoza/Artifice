//
//  Document+statistics.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-30.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

extension Document {
  
  @IBAction func displayStatisticsSheet(_ sender: AnyObject) {
    updateStatisticsView()
    guard let window = windowForSheet else { return }
    statisticsVisible = true
    window.beginSheet(statisticsSheet, completionHandler: nil)
  }
  
  @IBAction func dismissStatisticsSheet(_ sender: AnyObject) {
    guard let window = windowForSheet else { return }
    statisticsVisible = false
    window.endSheet(statisticsSheet)
    statisticsSheet.orderOut(self)
  }
  
  func updateStatisticsView() {
    updateRarityStatisticsView()
    updateColorStatisticsView()
    updateTypeStatisticsView()
  }
}
