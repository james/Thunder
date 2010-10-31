//
//  ThunderAppDelegate.h
//  Thunder
//
//  Created by James Darling on 30/10/2010.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ThunderViewController;

@interface ThunderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ThunderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ThunderViewController *viewController;

@end

