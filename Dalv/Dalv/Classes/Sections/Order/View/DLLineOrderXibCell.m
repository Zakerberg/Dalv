//
//  DLLineOrderXibCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderXibCell.h"

@interface DLLineOrderXibCell ()

@end

@implementation DLLineOrderXibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUI];
}



#pragma mark  ------  setUI  ------------
-(void)setUI{
    

    
}


#pragma mark - configure


- (void)configureCell:(DLlineOrderModel *)lineOrderModelData {
    
    self.lineOrderPicture.image = lineOrderModelData.cover_pic;
    
    self.lineOrderNameLabel.text = lineOrderModelData.name;
    
    self.lineOrderTimeLabel.text = lineOrderModelData.start_time;
    
    self.lineOrderPriceLabel.text = lineOrderModelData.price_payable;
    
    self.lineOrderStateLabel.text = lineOrderModelData.state;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
