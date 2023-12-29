//
//  NSImage+DPIConversion.h
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-07.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

#define MAGICKCORE_QUANTUM_DEPTH 16
#define MAGICKCORE_HDRI_ENABLE 0

#import <MagickWand/MagickWand.h>

#import <Cocoa/Cocoa.h>

@interface NSImage (DPIConversion)
+(nullable instancetype)imageWithData:(nonnull NSData*)data DPI:(const double)dpi;
+(nullable instancetype)imageWithContentsOfURL:(nonnull NSURL*)url DPI:(const double)dpi;
@end
