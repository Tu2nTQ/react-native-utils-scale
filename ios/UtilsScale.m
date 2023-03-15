#import "UtilsScale.h"

@implementation UtilsScale

RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport
{
    return @{
        @"checkTablet": @([self isTablet]),
        @"checkSmallDevice": @([self isSmallDevice]),
        @"deviceInch": @([self deviceInch]),
        @"checkhasNotch": @([self hasNotch]),
    };
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (BOOL) isTablet
{
    // TODO: Implement some actually useful functionality
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        return YES; /* Device is iPad */
    }else{
        return NO;
    }

}

- (BOOL) isSmallDevice
{
    float diagonal = [self deviceInch];

    if(diagonal < 4.8){
        return YES;
    }else{
        return NO;
    }
}

- (float) deviceInch
{
    float scale = [[UIScreen mainScreen] scale];

    NSInteger width = [[UIScreen mainScreen] bounds].size.width;
    NSInteger height = [[UIScreen mainScreen] bounds].size.height;

    NSInteger screenHeight = MAX(width, height);

         if(screenHeight >= 1366) {
          return 12.9;
        }

        if(screenHeight >= 1194) {
          return 11;
        }

        if(screenHeight >= 1180) {
          return 10.9;
        }

        if(screenHeight >= 1112) {
          return 10.5;
        }

        if(screenHeight >= 1080) {
          return 10.2;
        }

        if(screenHeight >= 926) {
          return 6.7;
        }

        if(screenHeight >= 896) {
          return 6.5;
        }

        if(screenHeight >= 844) {
          return 6.1;
        }

        if(screenHeight >= 812) {
           return 5.4;
        }

        if(screenHeight >= 736) {
           return 5.5;
        }

        if(screenHeight >= 667) {
           return scale == 3.0 ? 5.5 : 4.7;
        }

        if(screenHeight >= 568) {
           return 4;
        }

        if(screenHeight >= 480) {
           return 3.5;
        }

        if(screenHeight >= 240) {
           return 3.5;
        }

        return 6.5;
         switch (screenHeight) {
             case 240:
                 return 3.5;
}

- (BOOL) hasNotch
{
    if (@available(iOS 13.0, *)) {
        if([self keyWindow].safeAreaInsets.top > 20.0){
            return YES;
        }else {
            return NO;
        }

    }else{
        if (@available(iOS 11.0, *)) {
            if([[[UIApplication sharedApplication] delegate] window].safeAreaInsets.top > 20.0){
                return YES;
            }else {
                return NO;
            }
        } else {
            // Fallback on earlier versions
            return NO;
        }

    }
}

- (UIWindow*)keyWindow {
    UIWindow        *foundWindow = nil;
    NSArray         *windows = [[UIApplication sharedApplication]windows];
    for (UIWindow   *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    return foundWindow;
}

@end
