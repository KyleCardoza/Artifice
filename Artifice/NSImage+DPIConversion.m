//
//  NSImage+DPIConversion.m
//  Artifice
//
//  Created by Kyle Cardoza on 2016-09-07.
//  Copyright © 2016 Kyle Cardoza. All rights reserved.
//

#import "NSImage+DPIConversion.h"

@implementation NSImage (DPIConversion)

+(nullable instancetype)imageWithData:(nonnull NSData*)data DPI:(const double)dpi {
  
  if (dpi == 0) {
    return NULL;
  }
  
  MagickWandGenesis();
  
  MagickWand *m_wand = NewMagickWand();
  
  const void *blob_data = [data bytes];
  const uint blob_length = (const uint)[data length];
  
  MagickReadImageBlob(m_wand, blob_data, blob_length);
  
  MagickSetImageUnits(m_wand, PixelsPerInchResolution);
  MagickSetImageResolution(m_wand, dpi, dpi);
  
  size_t modified_blob_length;
  void *modified_blob = MagickGetImageBlob(m_wand, &modified_blob_length);
  
  if (NULL == modified_blob) {
    return NULL;
  }
  
  NSData *modified_data = [NSData dataWithBytes:modified_blob length:modified_blob_length];
  
  MagickRelinquishMemory(modified_blob);
  
  MagickWandTerminus();
  
  id image = [[self alloc] initWithData: modified_data];
  
  return image;
  
}

+(nullable instancetype)imageWithContentsOfURL:(nonnull NSURL*)url DPI:(const double)dpi {
  
  NSData *data = [NSData dataWithContentsOfURL: url];
  
  return [self imageWithData:data DPI:dpi];
}

@end
