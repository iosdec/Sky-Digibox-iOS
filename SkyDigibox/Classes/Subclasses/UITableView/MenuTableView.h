//
//  MenuTableView.h
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import <UIKit/UIKit.h>
#import "MenuTableViewCell.h"

@class MenuTableView;

@protocol MenuTableViewDelegate <NSObject>

@optional

- (void)MenuTableViewHighlightedItem:(NSString *)item;
- (void)MenuTableViewSelectedItem:(NSString *)item;

@end

@interface MenuTableView : UITableView

@property (strong, nonatomic) NSArray <NSString *> *items;
@property (nonatomic) id <MenuTableViewDelegate> delegateHandler;

@end
