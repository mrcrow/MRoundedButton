//
//  UIImage+TintColor.h
//  MRoundedButton
//
//  Created by Michael WU on 12/3/14.
//  Copyright (c) 2014 Michael WU. All rights reserved.
//

#import "UIImage+TintColor.h"

@implementation UIImage (TintColor)

- (UIImage *)imageWithTintColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [color setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

@end
