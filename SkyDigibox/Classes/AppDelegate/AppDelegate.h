//
//  AppDelegate.h
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AVPlayerLooper *player;

@property (strong, nonatomic) AVQueuePlayer *queuePlayer;

- (void)startAudioPlayer;
- (void)stopAudioPlayer;

@end

