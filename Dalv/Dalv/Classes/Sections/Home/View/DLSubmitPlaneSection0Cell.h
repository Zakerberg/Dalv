//
//  DLSubmitPlaneSection0Cell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLPlaneListDetailModel.h"

@interface DLSubmitPlaneSection0Cell : UITableViewCell
/// 出发时间
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
/// 出发机场
@property (weak, nonatomic) IBOutlet UILabel *startPlaceLabel;
/// 出发航站楼
@property (weak, nonatomic) IBOutlet UILabel *startOrgjetquery;
/// 到达航站楼
@property (weak, nonatomic) IBOutlet UILabel *dstJetqury;
/// 到达时间
@property (weak, nonatomic) IBOutlet UILabel *arriveTimeLabel;
/// 到达机场
@property (weak, nonatomic) IBOutlet UILabel *arrivePlaceLabel;
/// 航空公司
@property (weak, nonatomic) IBOutlet UILabel *airlinesLabel;
/// 航班号
@property (weak, nonatomic) IBOutlet UILabel *flightNo;
/// 机型
@property (weak, nonatomic) IBOutlet UILabel *planeType;
/// 出发城市
@property (weak, nonatomic) IBOutlet UILabel *depname;
/// 到达城市
@property (weak, nonatomic) IBOutlet UILabel *arrname;
/// 燃油费
@property (weak, nonatomic) IBOutlet UILabel *fuelTax;
/// 基建费
@property (weak, nonatomic) IBOutlet UILabel *airportTax;
/// 出发日期
@property (weak, nonatomic) IBOutlet UILabel *arrDate;
/// 单人总价
@property (weak, nonatomic) IBOutlet UILabel *settlement_price;
///结算价
@property (weak, nonatomic) IBOutlet UILabel *settlePrice;

- (void)configureCell:(DLPlaneListDetailModel *)planeListDetailModelData;

@end
