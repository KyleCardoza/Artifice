//
//  Template.swift
//  Project Urza
//
//  Created by Kyle Cardoza on 2016-07-28.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

import Cocoa

enum CardTemplate: String {
  case standard
  case token
  case fullArtToken
  case fullArtBasicLand
  case fullArtNonbasicLand
  case planeswalker3ability
  case planeswalker4ability
  case transparentStandard
  case gameDay
  case miracle
  case split
  
  var aspectRatio: CGFloat {
    switch self {
    case .standard, .miracle:
      return StandardTemplateCardView.artAspectRatio
    case .token:
      return TokenTemplateCardView.artAspectRatio
    case .fullArtToken:
      return FullArtTokenTemplateCardView.artAspectRatio
    case .fullArtBasicLand:
      return FullArtBasicLandTemplateCardView.artAspectRatio
    case .fullArtNonbasicLand:
      return FullArtNonbasicLandTemplateCardView.artAspectRatio
    case .planeswalker3ability, .planeswalker4ability:
      return PlaneswalkerTemplateCardView.artAspectRatio
    case .transparentStandard:
      return TransparentStandardTemplateCardView.artAspectRatio
    case .gameDay:
      return GameDayTemplateCardView.artAspectRatio
    case .split:
      return SplitCardTemplateCardView.artAspectRatio
    }
  }
}
