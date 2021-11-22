//
//  ServicesVC.m
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import "ServicesVC.h"

static NSArray <NSString *> *items = @[@"USING SKY+", @"TELEPHONE NUMBERS", @"PARENTAL CONTROL", @"SYSTEM SETUP", @"SKY+ SETUP", @"AUTO STANDBY", @"MANUAL RECORDING", @"FAVOUROTE CHANNELS", @"OTHER CHANNELS"];

@interface ServicesVC () <MenuTableViewDelegate> { }
@end

@implementation ServicesVC

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
    [self.tabBarController setSelectedIndex:1];
}

- (IBAction)actionRight:(UIButton *)sender {
    [self.tabBarController setSelectedIndex:3];
}

@end
