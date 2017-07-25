//
//  DLplaneDetaliViewController.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------ 机票订单舱位列表详情界面 ----------------

#import <UIKit/UIKit.h>
#import "DLPlaneListDetailModel.h"

@interface DLplaneDetaliViewController : UIViewController
@property (strong, nonatomic)  NSMutableArray * planeListDataArr;
/// 达到城市
@property (strong, nonatomic)  NSString * destination;
/// 出发城市
@property (strong, nonatomic)  NSString * departure;
@property (strong, nonatomic)  NSString *startTime;
@property (strong, nonatomic)  NSString *startPlace;
@property (strong, nonatomic)  NSString *arriveTime;
@property (strong, nonatomic)  NSString *arrivePlace;
@property (strong, nonatomic)  NSString *startOrgjetquery;
@property (strong, nonatomic)  NSString *dstJetqury;
@property (strong, nonatomic)  NSString *airlines;
@property (strong, nonatomic)  NSString *flightNo;
@property (strong, nonatomic)  NSString *planeType;
/// 数据
@property(nonatomic,strong) NSArray * nextArr;

@property(nonatomic,strong) DLPlaneListDetailModel * model;

@end
