//
//  ViewController.m
//  AnimateButton
//
//  Created by mmt on 2/3/14.
//  Copyright (c) 2014 Michael WU. All rights reserved.
//

#import "ViewController.h"
#import "MRoundedButton.h"
#import "UIImageView+LBBlurredImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [imageView setImageToBlur:[UIImage imageNamed:@"pic"] completionBlock:NULL];
    [self.view addSubview:imageView];
    
    CGFloat backgroundViewHeight = ceilf(CGRectGetHeight([UIScreen mainScreen].bounds)/ 3.0);
    CGFloat backgroundViewWidth = CGRectGetWidth(self.view.bounds);
    
    NSArray *foregroundColorArray = @[[UIColor whiteColor],
                                      [[UIColor whiteColor] colorWithAlphaComponent:0.5],
                                      [[UIColor blackColor] colorWithAlphaComponent:0.5]];
    NSArray *buttonStyleArray = @[@(MRoundedButtonSubtitle),
                                  @(MRoundedButtonCentralImage),
                                  @(MRoundedButtonCentralImage)];
    for (int i = 0; i < 3; i++)
    {
        CGRect backgroundRect = CGRectMake(0,
                                           backgroundViewHeight * i,
                                           backgroundViewWidth,
                                           backgroundViewHeight);
        MRHollowBackgroundView *backgroundView = [[MRHollowBackgroundView alloc] initWithFrame:backgroundRect];
        backgroundView.foregroundColor = foregroundColorArray[i];
        [self.view addSubview:backgroundView];
        
        CGFloat buttonSize = i == 1 ? 50 : 80;
        CGRect buttonRect = CGRectMake((backgroundViewWidth - buttonSize) / 2.0,
                                       (backgroundViewHeight - buttonSize) / 2.0,
                                       buttonSize,
                                       buttonSize);
        MRoundedButton *button = [[MRoundedButton alloc] initWithFrame:buttonRect
                                                           buttonStyle:[buttonStyleArray[i] integerValue]
                                                  appearanceIdentifier:[NSString stringWithFormat:@"%d", i + 1]];
        button.backgroundColor = [UIColor clearColor];
        
        if (i == 0)
        {
            button.textLabel.text = @"7";
            button.textLabel.font = [UIFont boldSystemFontOfSize:50];
            button.detailTextLabel.text = @"P Q R S";
            button.detailTextLabel.font = [UIFont systemFontOfSize:10];
        }
        else
        {
            button.imageView.image = [UIImage imageNamed:@"twitter"];
        }
        [backgroundView addSubview:button];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
