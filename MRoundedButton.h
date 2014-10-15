//
//  MRoundedButton.h
//
//  Copyright (c) 2014 Michael WU. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
@property (nonatomic, assign)   CGFloat                     cornerRadius               UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign)   CGFloat                     borderWidth                UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong)   UIColor                     *borderColor               UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong)   UIColor                     *contentColor              UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong)   UIColor                     *foregroundColor           UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong)   UIColor                     *borderAnimateToColor      UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong)   UIColor                     *contentAnimateToColor     UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong)   UIColor                     *foregroundAnimateToColor  UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign)   BOOL                        restoreSelectedState       UI_APPEARANCE_SELECTOR;

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
extern NSString *const kMRoundedButtonBorderAnimateToColor;
extern NSString *const kMRoundedButtonContentAnimateToColor;
extern NSString *const kMRoundedButtonForegroundAnimateToColor;
extern NSString *const kMRoundedButtonRestoreSelectedState;

@interface MRoundedButtonAppearanceManager : NSObject

+ (void)registerAppearanceProxy:(NSDictionary *)proxy forIdentifier:(NSString *)identifier;
+ (void)unregisterAppearanceProxyIdentier:(NSString *)identifier;
+ (NSDictionary *)appearanceForIdentifier:(NSString *)identifier;

@end

@interface MRHollowBackgroundView : UIView

@property (nonatomic, strong)   UIColor *foregroundColor;

@end
