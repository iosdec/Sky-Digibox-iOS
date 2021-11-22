//
//  InteractiveVC.m
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import "InteractiveVC.h"

static NSArray <NSString *> *items = @[@"SETTINGS", @"ABOUT SKYDIGIBOX iOS", @"EPG MUSIC"];

@interface InteractiveVC ()

@end

@implementation InteractiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    [self.tableView setItems:items];
    [self.tableView reloadData];
}

#pragma mark    -   Menu Delegate: -

- (void)MenuTableViewHighlightedItem:(NSString *)item {
    
}

- (void)MenuTableViewSelectedItem:(NSString *)item {
    
}



#pragma mark    -   Button Actions: -

- (IBAction)actionLeft:(UIButton *)sender {
    [self.tabBarController setSelectedIndex:2];
}

@end
