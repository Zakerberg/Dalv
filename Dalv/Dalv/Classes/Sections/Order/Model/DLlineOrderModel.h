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
 {
 "id": "746",							线路订单id
 "name": "外部线路产品专用订单",		线路名称
 "client_adult_count": "1",				成人数量
 "client_child_count": "0",				儿童数量
 "start_time": "2017-05-23",				出团时间
 "price_total": "18700.00",				订单总价
 "price_adjust": "0.00",					调整价格
 "prepay_amount": null,				预付的总数
 "state": "5",						订单状态
 "create_time": "2017-04-11 10:10:35",		订单创建时间
 "cover_pic": "http:///c/240/160",			线路封面图片
 "memo": "",						订单备注
 "fullpay_time": null,					付全款时间
 "prepay_time": null,					付预付款时间
 "price_payable": "18700.00"			应付金额
 }
 */

/** 线路订单id **/
@property(nonatomic,copy) NSString *lineId;
/** 线路名称 **/
@property(nonatomic,copy) NSString *name;
/** 成人数量 **/
@property(nonatomic,copy) NSString *client_adult_count;
/** 儿童数量 **/
@property(nonatomic,copy) NSString *client_child_count;
/** 出团时间 **/
@property(nonatomic,copy) NSString *start_time;
/** 订单总价 **/
@property(nonatomic,copy) NSString *price_total;
/** 调整价格 **/
@property(nonatomic,copy) NSString *price_adjust;
/** 预付的总数 **/
@property(nonatomic,copy) NSString *prepay_amount;
/** 订单状态 **/
@property(nonatomic,copy) NSString *state;
/** 订单创建时间 **/
@property(nonatomic,copy) NSString *create_time;
/** 线路封面图片 **/
@property(nonatomic,copy) UIImage *cover_pic;
/** 订单备注 **/
@property(nonatomic,copy) NSString *memo;
/** 付全款时间 **/
@property(nonatomic,copy) NSString *fullpay_time;
/** 付预付款时间 **/
@property(nonatomic,copy) NSString *prepay_time;
/**  应付金额 **/
@property(nonatomic,copy) NSString *price_payable;

@end
