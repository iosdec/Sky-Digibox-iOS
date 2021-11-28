//
//  AppDelegate.m
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import "AppDelegate.h"
#import "XCDYouTubeKit.h"

@interface AppDelegate () { }
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self startAudioPlayer];
    return YES;
}

- (void)startAudioPlayer {
    
    NSString *identifier = @"RDPlWOA-bQw"; // Sky Earth
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *audioIdentifier = @"youtube_id";
    
    if ([defaults valueForKey:audioIdentifier]) {
        NSString *audioSource = [defaults valueForKey:audioIdentifier];
        if (audioSource.length > 0) identifier = audioSource;
    }
    
    [[XCDYouTubeClient defaultClient] getVideoWithIdentifier:identifier completionHandler:^(XCDYouTubeVideo * _Nullable video, NSError * _Nullable error) {
        
        if (error || !video.streamURL) return;
        
        NSLog(@"got url: %@", video.streamURL);
        
        AVURLAsset *asset = [AVURLAsset URLAssetWithURL:video.streamURL options:nil];
        AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:asset];
        self.queuePlayer = [[AVQueuePlayer alloc] init];
        self.player = [AVPlayerLooper playerLooperWithPlayer:self.queuePlayer templateItem:item];
        
        [self.queuePlayer play];
        
    }];
    
}

- (void)stopAudioPlayer {
    [self.queuePlayer pause];
}

@end
