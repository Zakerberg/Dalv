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
@property (strong, nonatomic)  NSMutableArray * tankListDataArr;
/// 达到城市
@property (strong, nonatomic) NSString * destination;
@property (strong, nonatomic) NSString * departure;
@property (strong, nonatomic) NSArray * nextArr;
@property (strong, nonatomic) DLPlaneListDetailModel * model;
@property (strong, nonatomic) DLPlaneListDetailModel * tankModel;












@end
