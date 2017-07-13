//
//  DLPlaneTicketsListCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ----------------- 机票列表界面Cell -----------------

#import "DLPlaneTicketsListCell.h"

@interface DLPlaneTicketsListCell ()

@end

@implementation DLPlaneTicketsListCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)detailBtnClick:(id)sender {
    
}

- (void)configureCell:(DLPlaneListDetailModel *)planeListDetailModelData{
    

//    self.startTimeLabel.text = planeListDetailModelData.depTime;
//    self.arriveTimeLabel.text = planeListDetailModelData.arriTime;
    
    NSMutableString *str = [[NSMutableString alloc] init];
    [str setString:planeListDetailModelData.depTime];
    [str insertString:@":" atIndex:2];
    self.startTimeLabel.text = str;
    
    NSMutableString *str1 = [[NSMutableString alloc] init];
    [str1 setString:planeListDetailModelData.arriTime];
    [str1 insertString:@":" atIndex:2];
    self.arriveTimeLabel.text = str1;
    
    self.startPlaceLabel.text = planeListDetailModelData.orgJetquay;
    self.arrivePlaceLabel.text = planeListDetailModelData.dstJetquay;
   // self.airlinesLabel.text = planeListDetailModelData.
    self.flightNo.text = planeListDetailModelData.flightNo;
    self.planeType.text = planeListDetailModelData.planeType;
    
}

@end
