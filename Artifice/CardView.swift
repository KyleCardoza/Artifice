//
//  CardView.swift
//  Project Urza
//
//  Created by Kyle Cardoza on 2016-07-20.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa
import CoreGraphics

class CardView: NSView {
  
  lazy var standard_template: StandardTemplateCardView = {
    let template = StandardTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var token_template: TokenTemplateCardView = {
    let template = TokenTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var fullArtToken_template: FullArtTokenTemplateCardView = {
    let template = FullArtTokenTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var fullArtBasicLand_template: FullArtBasicLandTemplateCardView = {
    let template = FullArtBasicLandTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var fullArtNonbasicLand_template: FullArtNonbasicLandTemplateCardView = {
    let template = FullArtNonbasicLandTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var planeswalker3ability_template: PlaneswalkerTemplateCardView = {
    let template = PlaneswalkerTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var planeswalker4ability_template: Planeswalker4AbilityTemplateCardView = {
    let template = Planeswalker4AbilityTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var transparentStandard_template: TransparentStandardTemplateCardView = {
    let template = TransparentStandardTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var gameDayTemplate: GameDayTemplateCardView = {
    let template = GameDayTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var miracleTemplate: MiracleTemplateCardView = {
    let template = MiracleTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  lazy var splitCardTemplate: SplitCardTemplateCardView = {
    let template = SplitCardTemplateCardView(frame: self.bounds)
    self.addSubview(template)
    return template
  }()
  
  enum Orientation {
    case portrait
    case landscape
  }
  
  var orientation = Orientation.portrait
  
  weak var activeTemplate: CardTemplateView?
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  func activate(_ template: CardTemplateView) {
    if activeTemplate != template {
      activeTemplate?.isHidden = true
      activeTemplate = template
      activeTemplate?.isHidden = false
    }
  }
  
  func deactivate(_ template: CardTemplateView) {
    template.isHidden = true
  }
  
  func showLandscape() {
    
    guard let doc = NSDocumentController.shared.currentDocument as? Document else {
      return
    }
    orientation = .landscape
    doc.portraitCardViewWrapper.isHidden = true
    doc.landscapeCardViewWrapper.isHidden = false
    
    doc.portraitCardViewLeadingSpace.constant = 182
    doc.landscapeCardViewLeadingSpace.constant = 0
  }
  
  func showPortrait() {
    
    guard let doc = NSDocumentController.shared.currentDocument as? Document else {
      return
    }
    orientation = .portrait
    doc.portraitCardViewWrapper.isHidden = false
    doc.landscapeCardViewWrapper.isHidden = true
    
    doc.portraitCardViewLeadingSpace.constant = 0
    doc.landscapeCardViewLeadingSpace.constant = -182
  }
  
  func update(card: Card, set: CardSet) {
    
    switch card.template {
    case .standard:
      showPortrait()
      activate(standard_template)
      
    case .token:
      showPortrait()
      activate(token_template)
      
    case .fullArtToken:
      showPortrait()
      activate(fullArtToken_template)
      
    case .fullArtBasicLand:
      showPortrait()
      activate(fullArtBasicLand_template)
      
    case .fullArtNonbasicLand:
      showPortrait()
      activate(fullArtNonbasicLand_template)
      
    case .planeswalker3ability:
      showPortrait()
      activate(planeswalker3ability_template)
      
    case .planeswalker4ability:
      showPortrait()
      activate(planeswalker4ability_template)
      
    case .transparentStandard:
      showPortrait()
      activate(transparentStandard_template)
      
    case .gameDay:
      showPortrait()
      activate(gameDayTemplate)
      
    case .miracle:
      showPortrait()
      activate(miracleTemplate)
      
    case .split:
      showLandscape()
      activate(splitCardTemplate)
      
    }
    
    activeTemplate?.update(card: card, set: set)
    
  }
}
