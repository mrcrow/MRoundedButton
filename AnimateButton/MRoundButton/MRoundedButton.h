//
//  MRoundedButton.h
//  iBeacon
//
//  Created by mmt on 26/2/14.
//  Copyright (c) 2014 Michael WU. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MRoundedButtonStyle) {
    MRoundedButtonDefault,
    MRoundedButtonSubtitle,
    MRoundedButtonCentralImage,
    MRoundedButtonImageWithSubtitle
};

extern CGFloat const MRoundedButtonMaxValue;

@interface MRoundedButton : UIControl

@property (readonly, nonatomic) MRoundedButtonStyle         mr_buttonStyle;
@property (readonly, assign)    BOOL                        mr_buttonHighlighted;
@property (nonatomic, assign)   CGFloat                     cornerRadius;                   UI_APPEARANCE_SELECTOR
@property (nonatomic, assign)   CGFloat                     borderWidth;                    UI_APPEARANCE_SELECTOR
@property (nonatomic, strong)   UIColor                     *borderColor;               UI_APPEARANCE_SELECTOR
@property (nonatomic, strong)   UIColor                     *contentColor;                 UI_APPEARANCE_SELECTOR
@property (nonatomic, strong)   UIColor                     *foregroundColor;                 UI_APPEARANCE_SELECTOR
@property (nonatomic, strong)   UIColor                     *borderAnimationColor;      UI_APPEARANCE_SELECTOR
@property (nonatomic, strong)   UIColor                     *contentAnimationColor;     UI_APPEARANCE_SELECTOR
@property (nonatomic, strong)   UIColor                     *foregroundAnimationColor;  UI_APPEARANCE_SELECTOR
@property (nonatomic, assign)   BOOL                        restoreHighlightState;                UI_APPEARANCE_SELECTOR

@property (nonatomic, weak)     UILabel                     *textLabel;
@property (nonatomic, weak)     UILabel                     *detailTextLabel;
@property (nonatomic, weak)     UIImageView                 *imageView;
@property (nonatomic, assign)   UIEdgeInsets                contentEdgeInsets;

+ (instancetype)buttonWithFrame:(CGRect)frame
                    buttonStyle:(MRoundedButtonStyle)style
           appearanceIdentifier:(NSString *)identifier;
- (instancetype)initWithFrame:(CGRect)frame
                  buttonStyle:(MRoundedButtonStyle)style;
- (instancetype)initWithFrame:(CGRect)frame
                  buttonStyle:(MRoundedButtonStyle)style
         appearanceIdentifier:(NSString *)identifier;

@end

extern NSString *const kMRoundedButtonCornerRadius;
extern NSString *const kMRoundedButtonBorderWidth;
extern NSString *const kMRoundedButtonBorderColor;
extern NSString *const kMRoundedButtonContentColor;
extern NSString *const kMRoundedButtonForegroundColor;
extern NSString *const kMRoundedButtonBorderAnimationColor;
extern NSString *const kMRoundedButtonContentAnimationColor;
extern NSString *const kMRoundedButtonForegroundAnimationColor;
extern NSString *const kMRoundedButtonRestoreHighlightState;

@interface MRoundedButtonAppearanceManager : NSObject

+ (void)registerAppearanceProxy:(NSDictionary *)proxy forIdentifier:(NSString *)identifier;
+ (void)unregisterAppearanceProxyIdentier:(NSString *)identifier;
+ (NSDictionary *)appearanceForIdentifier:(NSString *)identifier;

@end

@interface MRHollowBackgroundView : UIView

@property (nonatomic, strong)   UIColor *foregroundColor;

@end