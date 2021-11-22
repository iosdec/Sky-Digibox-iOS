//
//  BoxOfficeVC.m
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import "BoxOfficeVC.h"

static NSArray <NSString *> *items = @[@"MOVIES BY START TIME", @"MOVIES A-Z", @"NEW MOVIES", @"SPORTS & EVENTS", @"PREVIEWS", @"ADULT PAY-PER-NIGHT", @"ADULT MOVIES"];

@interface BoxOfficeVC () <MenuTableViewDelegate> { }
@end

@implementation BoxOfficeVC

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









#pragma mark    -   UIButton Actions: -

- (IBAction)actionLeft:(UIButton *)sender {
    [self.tabBarController setSelectedIndex:0];
}

- (IBAction)actionRight:(UIButton *)sender {
    [self.tabBarController setSelectedIndex:2];
}

@end
