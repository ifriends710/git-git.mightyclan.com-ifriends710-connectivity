//
//  ExtensionDelegate.m
//  Connectivity WatchKit Extension
//
//  Created by ChanceJin on 9/28/15.
//  Copyright © 2015 Chance. All rights reserved.
//

#import "ExtensionDelegate.h"
#import "InterfaceController.h"


@implementation ExtensionDelegate

- (void)applicationDidFinishLaunching {
    // Perform any final initialization of your application.
    [self watchKitSetup];
}

- (void)applicationDidBecomeActive {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillResignActive {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, etc.
}

- (void)watchKitSetup{
    if ([WCSession isSupported]) {
        WCSession *_defSession = [WCSession defaultSession];
        _defSession.delegate = self;
        [_defSession activateSession];
    }
}

- (void)sessionReachabilityDidChange:(WCSession*)session{
    //if (!session.reachable) {
        
    //}
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SESSIONDISCON object:@(session.reachable)];
}

@end
