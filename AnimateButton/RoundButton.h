//
//  RoundButton.h
//  iBeacon
//
//  Created by mmt on 26/2/14.
//  Copyright (c) 2014 Michael WU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame
                  borderWidth:(CGFloat)width
               forgroundColor:(UIColor *)icolor
              backgroundColor:(UIColor *)color
                         text:(NSString *)text;

@end
