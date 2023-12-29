//
//  AppDelegate.swift
//  Artifice
//
//  Created by Kyle Cardoza on 2016-07-29.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  @IBOutlet weak var aboutWindow: NSWindow!
  @IBOutlet weak var aboutWindowTabView: NSTabView!
  @IBOutlet weak var aboutWindowTabSelector: NSSegmentedControl!
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }
  
  @IBAction func showAboutWindow(_ sender: AnyObject) {
    aboutWindow.titleVisibility = .hidden
    aboutWindow.makeKeyAndOrderFront(self)
    aboutWindowTabView.selectTabViewItem(at: 0)
    aboutWindowTabSelector.selectSegment(withTag: 0)
  }
  
  @IBAction func aboutWindowSegmentedControlClicked(_ sender: NSSegmentedControl) {
    aboutWindowTabView.selectTabViewItem(at: sender.selectedSegment)
  }
}
