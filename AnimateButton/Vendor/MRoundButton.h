//
//  MRoundButton.h
//  iBeacon
//
//  Created by mmt on 26/2/14.
//  Copyright (c) 2014 Michael WU. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void(^ MRoundButtonActionBlock)(void);

@interface MRoundButton : UIButton

@property (assign, nonatomic)   CGFloat     borderWidth;
@property (nonatomic, strong)   UIColor     *foregroundColor;
@property (nonatomic, strong)   UIFont      *font;
@property (nonatomic, strong)   UIColor     *textColor;
@property (nonatomic, strong)   NSString    *text;
@property (nonatomic, strong)   UIImage     *blurredImage;
//@property (copy, nonatomic)     MRoundButtonActionBlock actionBlock;

- (instancetype)initWithFrame:(CGRect)frame;

@end
