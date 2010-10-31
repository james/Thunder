//
//  ThunderAppDelegate.m
//  Thunder
//
//  Created by James Darling on 30/10/2010.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "ThunderAppDelegate.h"
#import "ThunderViewController.h"

@implementation ThunderAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
