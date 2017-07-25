//
//  DLplaneTankCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLplaneTankCell.h"

@interface DLplaneTankCell ()
/// 剩余 / 张
@property (weak, nonatomic) IBOutlet UILabel *left;
@property (weak, nonatomic) IBOutlet UILabel *right;

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
    
}

- (void)configureCell:(DLPlaneListDetailModel *)planeListDetailModelData{

    self.tankLabel.text = planeListDetailModelData.seatMsg;
    self.disCountLabel.text = planeListDetailModelData.agio;
    self.CustomerMoneyLabel.text = planeListDetailModelData.parPrice;
    self.agencyMoneyLabel.text = planeListDetailModelData.settlePrice;
    self.ownMoneyLabel.text = planeListDetailModelData.earnPrice;

//    ([planeListDetailModelData.ticketnum isEqualToString:@"A"] || [planeListDetailModelData.ticketnum isEqualToString:@"L"] || [planeListDetailModelData.ticketnum isEqualToString:@"Q"] || [planeListDetailModelData.ticketnum isEqualToString:@"S"] || [planeListDetailModelData.ticketnum isEqualToString:@"C"] || [planeListDetailModelData.ticketnum isEqualToString:@"X"] || [planeListDetailModelData.ticketnum isEqualToString:@"Z"]) ?  (self.ticketCountLabel.text = @"") : (self.ticketCountLabel.text = planeListDetailModelData.ticketnum);

    if ([planeListDetailModelData.ticketnum isEqualToString:@"A"] || [planeListDetailModelData.ticketnum isEqualToString:@"L"] || [planeListDetailModelData.ticketnum isEqualToString:@"Q"] || [planeListDetailModelData.ticketnum isEqualToString:@"S"] || [planeListDetailModelData.ticketnum isEqualToString:@"C"] || [planeListDetailModelData.ticketnum isEqualToString:@"X"] || [planeListDetailModelData.ticketnum isEqualToString:@"Z"]) {

        [self.left setHidden:YES];
        [self.right setHidden:YES];
        [self.ticketCountLabel setHidden:YES];
        
    }else {
        
        self.ticketCountLabel.text = planeListDetailModelData.ticketnum;
    }
}

@end
