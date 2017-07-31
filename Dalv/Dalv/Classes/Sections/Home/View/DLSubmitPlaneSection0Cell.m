//
//  DLSubmitPlaneSection0Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLSubmitPlaneSection0Cell.h"

@implementation DLSubmitPlaneSection0Cell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


- (void)configureCell:(DLPlaneListDetailModel *)planeListDetailModelData{

    self.airlinesLabel.text = planeListDetailModelData.flightName;
    self.flightNo.text = planeListDetailModelData.flightNo;
    self.planeType.text = planeListDetailModelData.planeType;
    self.arrDate.text = planeListDetailModelData.arrDate;
    self.depname.text = planeListDetailModelData.depname;
    self.arrname.text = planeListDetailModelData.arrname;
    self.startTimeLabel.text = planeListDetailModelData.depTime;
    self.startPlaceLabel.text = planeListDetailModelData.orgCityName;
    self.fuelTax.text = planeListDetailModelData.fuelTax;
    self.airportTax.text = planeListDetailModelData.airportTax;
    self.arriveTimeLabel.text = planeListDetailModelData.arriTime;
    self.arrivePlaceLabel.text = planeListDetailModelData.dstCityName;
    self.startOrgjetquery.text = planeListDetailModelData.orgJetquay;
    self.dstJetqury.text = planeListDetailModelData.dstJetquay;
    self.settlement_price.text = planeListDetailModelData.settlement_price;
    self.settlePrice.text = planeListDetailModelData.settlePrice;
 
}

@end
