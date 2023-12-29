//
//  NSImage+Rotated.h
//  Artifice
//
//  Created by Kyle Cardoza on 2016-08-18.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

#define MAGICKCORE_QUANTUM_DEPTH 16
#define MAGICKCORE_HDRI_ENABLE 0

#ifndef NSImage_Rotated_h
#define NSImage_Rotated_h

#import <Cocoa/Cocoa.h>

@interface NSImage (Rotated)
- (nonnull NSImage *)rotated:(float)degrees;
- (nullable CGImageRef)toCGImageRef;
@end

#endif /* NSImage_Rotated_h */
