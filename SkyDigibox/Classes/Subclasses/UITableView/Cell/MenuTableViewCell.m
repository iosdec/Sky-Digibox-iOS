//
//  MenuTableViewCell.m
//  SkyDigibox
//
//  Created by Declan Land on 22/11/2021.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

- (id)init {
    self = [super init];
    if (self) {
        MenuTableViewCell *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil][0];
        [view setupView];
        self = view;
    } return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setupView {
    [self reloadContents];
}

- (void)reloadContents {
    
    UIColor *background = [UIColor colorWithRed:(0/255.0) green:(37/255.0) blue:(201/255.0) alpha:1.0];
    UIColor *subcolor = [UIColor colorWithRed:(0/255.0) green:(26/255.0) blue:(143/255.0) alpha:1.0];
    UIColor *textColor = [UIColor whiteColor];
    
    NSString *row = [NSString stringWithFormat:@"%li", self.rowNumber];
    NSString *item = @"-";
    
    if (self.item.length > 0) {
        item = self.item.uppercaseString;
    }
    
    if (self.selected) {
        background = [UIColor colorWithRed:(252/255.0) green:(218/255.0) blue:(37/255.0) alpha:1.0];
        subcolor = [UIColor colorWithRed:(254/255.0) green:(194/255.0) blue:(0/255.0) alpha:1.0];
        textColor = [UIColor colorWithRed:(0/255.0) green:(37/255.0) blue:(201/255.0) alpha:1.0];
    }
    
    self.rowNumberLabel.text = row;
    self.titleLabel.text = item;
    self.contentView.backgroundColor = background;
    self.rowNumberLabel.superview.backgroundColor = subcolor;
    self.titleLabel.textColor = textColor;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
