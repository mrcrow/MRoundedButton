//
//  AppDelegate.m
//  AnimateButton
//
//  Created by mmt on 2/3/14.
//  Copyright (c) 2014 Michael WU. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MRoundedButton.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    NSDictionary *appearanceProxy1 = @{kMRoundedButtonCornerRadius : @40,
                                       kMRoundedButtonBorderWidth  : @2,
                                       kMRoundedButtonBorderColor  : [UIColor clearColor],
                                       kMRoundedButtonContentColor : [UIColor blackColor],
                                       kMRoundedButtonContentAnimationColor : [UIColor whiteColor],
                                       kMRoundedButtonForegroundColor : [UIColor whiteColor],
                                       kMRoundedButtonForegroundAnimationColor : [UIColor clearColor]};
    NSDictionary *appearanceProxy2 = @{kMRoundedButtonCornerRadius : @25,
                                       kMRoundedButtonBorderWidth  : @1.5,
                                       kMRoundedButtonRestoreHighlightState : @NO,
                                       kMRoundedButtonBorderColor : [UIColor colorWithWhite:0.3 alpha:1.0],
                                       kMRoundedButtonBorderAnimationColor : [UIColor whiteColor],
                                       kMRoundedButtonContentColor : [UIColor grayColor],
                                       kMRoundedButtonContentAnimationColor : [UIColor whiteColor],
                                       kMRoundedButtonForegroundColor : [[UIColor whiteColor] colorWithAlphaComponent:0.5]};
    NSDictionary *appearanceProxy3 = @{kMRoundedButtonCornerRadius : @40,
                                       kMRoundedButtonBorderWidth  : @2,
                                       kMRoundedButtonRestoreHighlightState : @NO,
                                       kMRoundedButtonBorderColor : [UIColor clearColor],
                                       kMRoundedButtonBorderAnimationColor : [UIColor whiteColor],
                                       kMRoundedButtonContentColor : [UIColor whiteColor],
                                       kMRoundedButtonContentAnimationColor : [UIColor blackColor],
                                       kMRoundedButtonForegroundColor : [[UIColor blackColor] colorWithAlphaComponent:0.5],
                                       kMRoundedButtonForegroundAnimationColor : [UIColor whiteColor]};
    
    [MRoundedButtonAppearanceManager registerAppearanceProxy:appearanceProxy1 forIdentifier:@"1"];
    [MRoundedButtonAppearanceManager registerAppearanceProxy:appearanceProxy2 forIdentifier:@"2"];
    [MRoundedButtonAppearanceManager registerAppearanceProxy:appearanceProxy3 forIdentifier:@"3"];
    
    ViewController *controller = [[ViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
