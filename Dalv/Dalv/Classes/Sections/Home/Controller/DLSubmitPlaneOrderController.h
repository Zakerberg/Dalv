//
//  DLSubmitPlaneOrderController.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ---------------- 提交机票订单界面 ------------------

#import <UIKit/UIKit.h>
#import "DLPlaneListDetailModel.h"
@interface DLSubmitPlaneOrderController : UIViewController
@property(nonatomic,strong) DLPlaneListDetailModel * orderModel;
@property(nonatomic,strong) NSArray * nextArray;
@property(nonatomic,strong) NSString * settlementStr;
@property(nonatomic,strong) NSString * settlePriceStr;
@end
