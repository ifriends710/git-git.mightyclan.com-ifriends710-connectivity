//
//  ConnectivityAlertIC.m
//  Connectivity
//
//  Created by ChanceJin on 9/28/15.
//  Copyright © 2015 Chance. All rights reserved.
//

#import "ConnectivityAlertIC.h"

@interface ConnectivityAlertIC ()
{
//    WKAudioFilePlayer *audioFilePlayer;
}
@end

@implementation ConnectivityAlertIC

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
//    NSURL *_urlSound = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"se_tap" ofType:@"m4a"]];
//    //NSLog(@"%@",_urlSound.description);
//    WKAudioFileAsset *_assetAudio = [WKAudioFileAsset assetWithURL:_urlSound];
//    WKAudioFilePlayerItem *_playerItem = [WKAudioFilePlayerItem playerItemWithAsset:_assetAudio];
//    audioFilePlayer = [WKAudioFilePlayer playerWithPlayerItem:_playerItem];

    
    // Configure interface objects here.
}
//
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeNotification];
    //[self performSelector:@selector(playAudio) withObject:nil afterDelay:0.5];
}

- (void)playAudio{
//    NSLog(@"%d",audioFilePlayer.status);
    //if (audioFilePlayer.status == WKAudioFilePlayerStatusReadyToPlay) {
//    [audioFilePlayer play];
    //}
}
- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)onClickDismiss {
    [self dismissController];
}

@end



