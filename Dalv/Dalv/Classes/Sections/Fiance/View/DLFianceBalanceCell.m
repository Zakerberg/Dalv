//
//  DLFianceBalanceCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFianceBalanceCell.h"

@interface DLFianceBalanceCell ()
/*****  冻结金额     ******/
@property (weak, nonatomic) IBOutlet UILabel *AmountfrozenLabel;
/*****  可用金额     ******/
@property (weak, nonatomic) IBOutlet UILabel *AvailablBbalanceLabel;
/*****  账户总额     ******/
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end

@implementation DLFianceBalanceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(DLOptionModel *)model{
    _model = model;
    
    self.AmountfrozenLabel.text = [NSString stringWithFormat:@"%@",model.freezeMoney];
    self.AvailablBbalanceLabel.text = [NSString stringWithFormat:@"%@",model.availableBalance];
    self.totalLabel.text = [NSString stringWithFormat:@"%@",model.account_balance];
    
}

@end
