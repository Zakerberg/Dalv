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
    
    if ([lineOrderModelData.state isEqualToString:@"1"]) {
        self.lineOrderStateLabel.text = @"未提交";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    } else if ([lineOrderModelData.state isEqualToString:@"2"]){
        self.lineOrderStateLabel.text = @"已提交";
        _lineOrderStateLabel.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    }else if ([lineOrderModelData.state isEqualToString:@"3"]){
        self.lineOrderStateLabel.text = @"已确认待付款";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }else if ([lineOrderModelData.state isEqualToString:@"4"]){
        self.lineOrderStateLabel.text = @"已取消";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }else if ([lineOrderModelData.state isEqualToString:@"5"]){
        self.lineOrderStateLabel.text = @"已关闭";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }else if ([lineOrderModelData.state isEqualToString:@"6"]){
        self.lineOrderStateLabel.text = @"已付预付款";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }else if ([lineOrderModelData.state isEqualToString:@"7"]){
        self.lineOrderStateLabel.text = @"已付全款";
        _lineOrderStateLabel.textColor =  [UIColor colorWithHexString:@"#5fc82b"];
    }else if ([lineOrderModelData.state isEqualToString:@"8"]){
        self.lineOrderStateLabel.text = @"已退款";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }else if ([lineOrderModelData.state isEqualToString:@"9"]){
        self.lineOrderStateLabel.text = @"取消中";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }else if ([lineOrderModelData.state isEqualToString:@"10"]){
        self.lineOrderStateLabel.text = @"取消中,待退款(供应商确认";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }else if ([lineOrderModelData.state isEqualToString:@"11"]){
        self.lineOrderStateLabel.text = @"拒绝取消订单";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }else if ([lineOrderModelData.state isEqualToString:@"12"]){
        self.lineOrderStateLabel.text = @"取消中,待退款(代理商管理确认)";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }else if ([lineOrderModelData.state isEqualToString:@"13"]){
        self.lineOrderStateLabel.text = @"已取消,已退款";
        _lineOrderStateLabel.textColor = [UIColor redColor];
    }
    
    NSURL *url = [NSURL URLWithString:lineOrderModelData.cover_pic];
    
    [self.lineOrderPicture sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
    
    self.lineOrderNameLabel.text = lineOrderModelData.name;
    
    self.lineOrderTimeLabel.text = lineOrderModelData.start_time;
    
    self.lineOrderPriceLabel.text = lineOrderModelData.price_payable;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
