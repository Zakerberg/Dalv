//
//  DLMyRemmendCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMyRemmendCell.h"

@implementation DLMyRemmendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell:(DLMyRemmendModel *)myRemmendModelData{
    
    NSURL *url = [NSURL URLWithString:myRemmendModelData.cover_pic];
    [self.picV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
    
    self.textLabel.text = myRemmendModelData.name;
    self.priceLabel.text = myRemmendModelData.min_price;
}

@end
