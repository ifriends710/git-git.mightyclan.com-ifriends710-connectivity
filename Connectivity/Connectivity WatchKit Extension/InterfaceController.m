//
//  InterfaceController.m
//  Connectivity WatchKit Extension
//
//  Created by ChanceJin on 9/28/15.
//  Copyright © 2015 Chance. All rights reserved.
//

#import "InterfaceController.h"
@import WatchConnectivity;



@interface InterfaceController()
{
    NSTimer *tmCounter;
    BOOL bConnected;
}
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    bConnected = YES;
    //[self refreshTimer];
    // Configure interface objects here.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotifySessionDiscon:) name:NOTIFY_SESSIONDISCON object:nil];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    if ([WCSession isSupported]) {
        WCSession *_defSession = [WCSession defaultSession];
        //bConnected = _defSession.reachable;
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SESSIONDISCON object:@(_defSession.reachable)];
    }
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)onNotifySessionDiscon:(NSNotification*)aObj{
    NSNumber *_objConnection = aObj.object;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (bConnected && ![_objConnection boolValue]) {
            [self presentControllerWithName:@"ConnectivityAlertIC" context:nil];
        }
        bConnected = [_objConnection boolValue];
    });
}

- (void)refreshTimer{
    tmCounter = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

- (void)onTimer{
    
}

@end



