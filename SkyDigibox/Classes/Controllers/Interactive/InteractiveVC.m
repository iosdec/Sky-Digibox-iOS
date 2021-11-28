//
//  InteractiveVC.m
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import "InteractiveVC.h"

static NSArray <NSString *> *items = @[@"SETTINGS", @"ABOUT SKYDIGIBOX iOS", @"SET MUSIC"];

@interface InteractiveVC () <MenuTableViewDelegate> { }

@end

@implementation InteractiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    [self.tableView setItems:items];
    [self.tableView setDelegateHandler:self];
    [self.tableView reloadData];
}

#pragma mark    -   Menu Delegate: -

- (void)MenuTableViewHighlightedItem:(NSString *)item {
    
    if ([item isEqualToString:@"SET MUSIC"]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Set music" message:@"You can manually set the background music here. Only YouTube supported currently - please enter the YouTube video ID:" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"YouTube video ID (RDPlWOA-bQw)";
        }];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Update" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *videoID = alert.textFields[0].text;
            [[NSUserDefaults standardUserDefaults] setValue:videoID forKey:@"youtube_id"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            AppDelegate *delegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
            [delegate stopAudioPlayer];
            [delegate startAudioPlayer];
            
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
}

- (void)MenuTableViewSelectedItem:(NSString *)item {
    
}

#pragma mark    -   Button Actions: -

- (IBAction)actionLeft:(UIButton *)sender {
    [self.tabBarController setSelectedIndex:2];
}

@end
