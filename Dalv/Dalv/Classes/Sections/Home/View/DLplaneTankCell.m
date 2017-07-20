//
//  DLplaneTankCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLplaneTankCell.h"

@interface DLplaneTankCell ()

@end

@implementation DLplaneTankCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

/// 
- (IBAction)orderBtnClick:(id)sender {
    
}

- (void)configureCell:(DLPlaneListDetailModel *)planeListDetailModelData{
    
    self.tankLabel.text = planeListDetailModelData.seatMsg;
    self.disCountLabel.text = planeListDetailModelData.agio;
    self.CustomerMoneyLabel.text = planeListDetailModelData.parPrice;
    self.agencyMoneyLabel.text = planeListDetailModelData.settlePrice;
    self.ownMoneyLabel.text = planeListDetailModelData.earnPrice;
    //self.ticketCountLabel.text = planeListDetailModelData.
}

@end
