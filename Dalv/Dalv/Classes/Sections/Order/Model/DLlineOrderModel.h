//
//  DLlineOrderModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLlineOrderModel : NSObject
/*
 "id": "746",							线路订单id
 "name": "外部线路产品专用订单",		线路名称
 "start_time": "2017-05-23",				出团时间
 "price_total": "18700.00",				订单总价
 "price_adjust": "0.00",					调整价格
 "state": "5",						订单状态
 "cover_pic": "http:///c/240/160",			线路封面图片
 "price_payable": "18700.00"			应付金额
 */

@property(nonatomic,copy) NSString *lineId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *start_time;
@property(nonatomic,copy) NSString *price_total;
@property(nonatomic,copy) NSString *price_adjust;
@property(nonatomic,copy) NSString *state;
@property(nonatomic,copy) NSString *cover_pic;
@property(nonatomic,copy) NSString *price_payable;

@end
