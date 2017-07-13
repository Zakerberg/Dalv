//
//  DLPlaneTicketsListCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLPlaneTicketsListCell.h"

@interface DLPlaneTicketsListCell ()
/*
 @property (weak, nonatomic) IBOutlet UILabel *startTimeLabel; /// 出发时间
 @property (weak, nonatomic) IBOutlet UILabel *startPlaceLabel; /// 出发机场
 @property (weak, nonatomic) IBOutlet UILabel *arriveTimeLabel; /// 到达时间
 @property (weak, nonatomic) IBOutlet UILabel *arrivePlaceLabel; /// 到达机场
 @property (weak, nonatomic) IBOutlet UILabel *airlinesLabel; /// 航空公司
 @property (weak, nonatomic) IBOutlet UIButton *detailBtn; /// 详情Btn
 */
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
    
    self.startTimeLabel.text = planeListDetailModelData.depTime;
    self.startPlaceLabel.text = planeListDetailModelData.orgJetquay;
    self.arriveTimeLabel.text = planeListDetailModelData.arriTime;
    self.arrivePlaceLabel.text = planeListDetailModelData.dstJetquay;
   // self.airlinesLabel.text = planeListDetailModelData.
    
    
    
}




@end
