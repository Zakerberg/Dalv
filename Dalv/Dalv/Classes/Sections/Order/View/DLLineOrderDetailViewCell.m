//
//  DLLineOrderDetailViewCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderDetailViewCell.h"
@interface DLLineOrderDetailViewCell ()


@end

@implementation DLLineOrderDetailViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



#pragma mark - configure
- (void)configureCell:(DLLineOrderDetailModel *)lineOrderDetailModelData {

    
//    self.lineId = lineOrderDetailModelData.lineId;
    
    self.lineOrderNameLabel.text = lineOrderDetailModelData.name;
    self.lineOrderStateLabel.text = lineOrderDetailModelData.state;
    
    self.lineOrderCreatTimeLabel.text = lineOrderDetailModelData.create_time;
    
    self.lineOrderAdultCountLabel.text = lineOrderDetailModelData.client_adult_count;
    self.lineOrderChildCountLabel.text = lineOrderDetailModelData.client_child_count;
    
    self.lineOrderPriceTotaLabel.text = lineOrderDetailModelData.price_total;
    self.lineOrderStartTimeLabel.text = lineOrderDetailModelData.start_time;
    
    self.lineOrderPriceAdjustLabel.text = lineOrderDetailModelData.price_adjus;
    
    self.lineOrderPayableLabel.text = lineOrderDetailModelData.price_payable;
    
    self.lineOrderMemoLabel.text = lineOrderDetailModelData.memo;
    
    NSURL *url = [NSURL URLWithString:lineOrderDetailModelData.cover_pic];
    
    [self.lineOrderPicImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
    
}





























@end
