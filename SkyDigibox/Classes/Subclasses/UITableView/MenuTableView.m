//
//  MenuTableView.m
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import "MenuTableView.h"

@interface MenuTableView() <UITableViewDelegate, UITableViewDataSource> { BOOL setup; }

@property (strong, nonatomic) NSArray <NSIndexPath *> *selectedIndexPaths;

@end

@implementation MenuTableView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupView];
}

- (void)setupView {
    
    if (self->setup) return;
    self->setup = YES;
    
    if (@available(iOS 15.0, *)) {
        self.sectionHeaderTopPadding = 0;
    }
    
    [self setShowsVerticalScrollIndicator:NO];
    [self setDataSource:self];
    [self setDelegate:self];
    [self reloadData];
    
}


#pragma mark    -   UITableView Data Source: -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 36;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMenuTableCellID];
    
    if (!cell) {
        cell = [[MenuTableViewCell alloc] init];
    }
    
    [cell setRowNumber:indexPath.section + 1];
    [cell setItem:[self.items objectAtIndex:indexPath.section]];
    [cell setSelected:([self.selectedIndexPaths containsObject:indexPath])];
    [cell reloadContents];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (![self.selectedIndexPaths containsObject:indexPath]) {
        self.selectedIndexPaths = @[indexPath];
        if (self.delegateHandler && [self.delegateHandler respondsToSelector:@selector(MenuTableViewHighlightedItem:)]) {
            [self.delegateHandler MenuTableViewHighlightedItem:[self.items objectAtIndex:indexPath.section]];
        }
    }
    
    else {
        self.selectedIndexPaths = nil;
        if (self.delegateHandler && [self.delegateHandler respondsToSelector:@selector(MenuTableViewSelectedItem:)]) {
            [self.delegateHandler MenuTableViewSelectedItem:[self.items objectAtIndex:indexPath.section]];
        }
    }
    
    [self reloadData];
    
}

@end
