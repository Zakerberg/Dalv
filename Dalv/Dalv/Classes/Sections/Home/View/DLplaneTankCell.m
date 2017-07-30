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
    [self setUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setUI{
    
    [self.orderBtn setTintColor:[UIColor whiteColor]];
    [self.orderBtn.layer setMasksToBounds:YES];
    [self.orderBtn.layer setCornerRadius:8];
    [self.orderBtn setBackgroundColor:[UIColor colorWithHexString:@"#fe603b"]];
}

- (IBAction)orderBtnClick:(id)sender {
    
    if (_delegate) {
        [self.delegate fromCell:self];
    }
}

- (void)configureCell:(DLPlaneListDetailModel *)planeListDetailModelData{

    self.tankLabel.text = planeListDetailModelData.seatMsg;
    self.disCountLabel.text = planeListDetailModelData.agio;
    self.CustomerMoneyLabel.text = planeListDetailModelData.total_price;
    self.agencyMoneyLabel.text = planeListDetailModelData.settlement_price;
    self.ownMoneyLabel.text = planeListDetailModelData.earnPrice;
    self.totalMoney.text =  planeListDetailModelData.settlement_price;
    self.jisuanjiaLabel.text = planeListDetailModelData.settlePrice;

    if ([planeListDetailModelData.ticketnum isEqualToString:@"A"] || [planeListDetailModelData.ticketnum isEqualToString:@"L"] || [planeListDetailModelData.ticketnum isEqualToString:@"Q"] || [planeListDetailModelData.ticketnum isEqualToString:@"S"] || [planeListDetailModelData.ticketnum isEqualToString:@"C"] || [planeListDetailModelData.ticketnum isEqualToString:@"X"] || [planeListDetailModelData.ticketnum isEqualToString:@"Z"]) {

        [self.left setHidden:YES];
        [self.right setHidden:YES];
        [self.ticketCountLabel setHidden:YES];
        
    }else {
        
        self.ticketCountLabel.text = planeListDetailModelData.ticketnum;
    }
}

@end
