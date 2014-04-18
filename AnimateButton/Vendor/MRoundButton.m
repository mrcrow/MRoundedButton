//
//  MRoundButton.m
//  iBeacon
//
//  Created by mmt on 26/2/14.
//  Copyright (c) 2014 Michael WU. All rights reserved.
//

#import "MRoundButton.h"
#import "UIImageView+LBBlurredImage.h"
#import <QuartzCore/QuartzCore.h>

@interface RoundInternal : UIView
@property (nonatomic, strong)   UILabel *textLabel;
@end

@implementation RoundInternal

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.font = [UIFont systemFontOfSize:32];
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.textLabel.textColor = self.tintColor;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.textLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame = self.bounds;
}

@end

@interface MRoundButton ()
@property (nonatomic, strong)               RoundInternal   *internalView;
@property (assign, getter = isTransformed)  BOOL            transformed;
@property (nonatomic, strong)               UIImageView     *blurredImageView;
@end

@implementation MRoundButton

- (instancetype)initWithFrame:(CGRect)frame
{
    NSAssert(CGRectGetWidth(frame) == CGRectGetHeight(frame), @"dimentions should be the same");
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        [self setup];
        self.internalView = [[RoundInternal alloc] initWithFrame:CGRectZero];
        self.internalView.backgroundColor = self.foregroundColor;
        self.internalView.textLabel.font = self.font;
        self.internalView.textLabel.textColor = self.textColor;
        [self addSubview:self.internalView];
        
        self.blurredImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.blurredImageView.backgroundColor = [UIColor clearColor];
        self.blurredImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self insertSubview:self.blurredImageView belowSubview:self.internalView];
        
        self.transformed = NO;
        self.backgroundColor = self.textColor;
        self.layer.masksToBounds = YES;
        
        self addTarget:self action:@selector(<#selector#>) forControlEvents:<#(UIControlEvents)#>
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    NSAssert(CGRectGetWidth(frame) == CGRectGetHeight(frame), @"dimentions should be the same");
    [super setFrame:frame];
}

- (void)setup
{
    _borderWidth = 2.0;
    _foregroundColor = [UIColor whiteColor];
    _font = [UIFont systemFontOfSize:16];
    _textColor = self.tintColor;
    _text = nil;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.blurredImageView.frame = self.bounds;
    self.internalView.frame = CGRectMake(self.borderWidth,
                                         self.borderWidth,
                                         CGRectGetWidth(self.bounds) - self.borderWidth * 2,
                                         CGRectGetHeight(self.bounds) - self.borderWidth * 2);
    self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2.0;
    self.blurredImageView.layer.cornerRadius = self.layer.cornerRadius;
    self.internalView.layer.cornerRadius = self.layer.cornerRadius - self.borderWidth;
}

#pragma mark - Setter and getters
- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = MIN(MAX(borderWidth, 0.0), CGRectGetWidth(self.bounds) / 2.0);
    [self setNeedsLayout];
}

- (void)setForegroundColor:(UIColor *)foregroundColor
{
    if (_foregroundColor == foregroundColor)
    {
        return;
    }
    
    _foregroundColor = foregroundColor;
    self.internalView.backgroundColor = foregroundColor;
}

- (void)setTextColor:(UIColor *)textColor
{
    if (_textColor == textColor)
    {
        return;
    }
    
    _textColor = textColor;
    self.internalView.textLabel.textColor = textColor;
}

- (void)setText:(NSString *)text
{
    if ([_text isEqualToString:text])
    {
        return;
    }
    
    _text = text;
    self.internalView.textLabel.text = text;
}

- (void)setBlurredImage:(UIImage *)blurredImage
{
    if (blurredImage == nil)
    {
        self.blurredImageView.image = nil;
        return;
    }
    
    [self.blurredImageView setImageToBlur:blurredImage completionBlock:NULL];
}

- (UIImage *)blurredImage
{
    return self.blurredImageView.image;
}

#pragma mark - Touch In / Out
BOOL RoundedRectContainsPoint(CGRect rect, CGPoint point)
{
    CGFloat radius = CGRectGetWidth(rect) / 2.0;
    CGFloat result = pow((point.x - radius) , 2) + pow((point.y - radius), 2) - pow(radius, 2);
    return result < 0;
}

- (void)transform:(id)sender
{

}

- (void)transformBack:(id)sender
{
    
}

#pragma mark - Touchs
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if (!self.isTransformed)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.internalView.backgroundColor = [UIColor clearColor];
            self.internalView.textLabel.textColor = self.foregroundColor;
        } completion:^(BOOL finished) {
            self.transformed = YES;
        }];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInView:self];
    if (RoundedRectContainsPoint(self.bounds, location))
    {
        if (!self.isTransformed)
        {
            [UIView animateWithDuration:0.2 animations:^{
                self.internalView.backgroundColor = [UIColor clearColor];
                self.internalView.textLabel.textColor = self.foregroundColor;
            } completion:^(BOOL finished) {
                self.transformed = YES;
            }];
        }
    }
    else
    {
        if (self.isTransformed)
        {
            [UIView animateWithDuration:0.2 animations:^{
                self.internalView.backgroundColor = self.foregroundColor;
                self.internalView.textLabel.textColor = self.textColor;
            } completion:^(BOOL finished) {
                self.transformed = NO;
            }];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInView:self];
    if (RoundedRectContainsPoint(self.bounds, location))
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.internalView.backgroundColor = self.foregroundColor;
            self.internalView.textLabel.textColor = self.textColor;
        } completion:^(BOOL finished) {
            self.transformed = NO;
//            if (self.actionBlock)
//            {
//                self.actionBlock();
//            }
        }];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInView:self];
    if (RoundedRectContainsPoint(self.bounds, location))
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.internalView.backgroundColor = self.foregroundColor;
            self.internalView.textLabel.textColor = self.textColor;
        } completion:^(BOOL finished) {
            self.transformed = NO;
        }];
    }
}

@end
