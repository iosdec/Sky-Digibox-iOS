//
//  MenuTableViewCell.h
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import <UIKit/UIKit.h>

#define kMenuTableCellID @"menu_cell"

@interface MenuTableViewCell : UITableViewCell

@property (nonatomic, assign) NSInteger rowNumber;
@property (strong, nonatomic) NSString *item;

- (void)reloadContents;

#pragma mark    -   Outlets: -

@property (weak, nonatomic) IBOutlet UILabel *rowNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
