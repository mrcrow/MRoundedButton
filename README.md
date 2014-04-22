MRoundedButton
==============

MRoundedButton is a subclass of UIControl and the appearance is like the iOS 7 **Phone** app button or the button on the **Control Center**

Four button styles are suplied:

    MRoundedButtonDefault           //  central text
    MRoundedButtonSubtitle          //  text with subtitle 
    MRoundedButtonCentralImage      //  central image
    MRoundedButtonImageWithSubtitle //  image with subtitle

MRoundedButtonAppearanceManager
===============================

MRoundedButtonAppearanceManager is the appearance manager for the MRoundedButton, the appearance information can be stored in an [NSDictionary](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSDictionary_Class/Reference/Reference.html) object:

    NSDictionary *appearanceProxy = @{kMRoundedButtonCornerRadius : @40,
                                      kMRoundedButtonBorderWidth  : @2,
                                      kMRoundedButtonBorderColor  : [UIColor clearColor],
                                      kMRoundedButtonContentColor : [UIColor blackColor],
                                      kMRoundedButtonContentAnimationColor : [UIColor whiteColor],
                                      kMRoundedButtonForegroundColor : [UIColor whiteColor],
                                      kMRoundedButtonForegroundAnimationColor : [UIColor clearColor]};
    [MRoundedButtonAppearanceManager registerAppearanceProxy:appearanceProxy1 forIdentifier:#<UNIQUE_IDENTIFIER>];
    
Lisence
=======

MRoundedButton is available under the MIT license
