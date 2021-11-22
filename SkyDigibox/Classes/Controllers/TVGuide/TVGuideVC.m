//
//  TVGuideVC.m
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import "TVGuideVC.h"

static NSArray <NSString *> *items = @[@"ALL CHANNELS", @"ENTERTAINMENT", @"LIFESTYLE & CULTURE", @"MOVIES", @"SPORTS", @"NEWS", @"DOCUMENTARIES", @"KIDS", @"MUSIC", @"MORE..."];

static NSArray <NSString *> *moreItems = @[@"RADIO", @"SHOPPING", @"RELIGION", @"INTERNATIONAL", @"GAMING & DATING", @"SPECIALIST", @"ADULT"];

@interface TVGuideVC () <MenuTableViewDelegate> { }
@end

@implementation TVGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    [self.tableView setItems:items];
    [self.tableView reloadData];
}

- (void)MenuTableViewHighlightedItem:(NSString *)item {
    
}

- (void)MenuTableViewSelectedItem:(NSString *)item {
    
    if ([items containsObject:item] && ![item isEqualToString:@"MORE..."]) {
        
    }
    
    if ([item isEqualToString:@"MORE..."]) {
        [self.tableView setItems:moreItems];
        [self.tableView reloadData];
    }
    
}


#pragma mark    -   Button Actions: -

- (IBAction)actionRight:(UIButton *)sender {
    [self.tabBarController setSelectedIndex:1];
}

@end
