//
//  DLLineOrderDetailModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLLineOrderDetailModel : NSObject


/*
 "id": "800",									线路订单id
 "name": "西欧U6 盈尚 一价全含 德法意瑞14天",		线路名称
 "client_adult_count": "1",							成人数量
 "client_child_count": "0",							儿童数量
 "start_time": "2017-07-08",						出团时间
 "price_total": "1350000",							订单金额
 "price_adjust": "0",								调整金额
 "create_time": "2017-05-25 11:18:14",				创建时间
 "state": "2",									订单状态
 "cover_pic": "http://file1.lydlr.com/c/240/160/tour/2017/0414/01173481906.jpg", 图片
 "memo": "",									特别说明
 "price_payable": "1350000"						应付金额
*/

/** 线路订单id **/
@property(nonatomic,copy) NSString *lineDetailId;

/** 线路名称 **/
@property(nonatomic,copy) NSString *name;

/** 成人数量 **/
@property(nonatomic,copy) NSString *client_adult_count;

/** 儿童数量 **/
@property(nonatomic,copy) NSString *client_child_count;

/** 出团时间 **/
@property(nonatomic,copy) NSString *start_time;

/** 订单金额 **/
@property(nonatomic,copy) NSString *price_total;

/** 调整金额 **/
@property(nonatomic,copy) NSString *price_adjus;

/** 创建时间 **/
@property(nonatomic,copy) NSString *create_time;

/** 订单状态 **/
@property(nonatomic,copy) NSString *state;

/** 图片 **/
@property(nonatomic,copy) NSString *cover_pic;

/** 特别说明 **/
@property(nonatomic,copy) NSString *memo;

/** 应付金额 **/
@property(nonatomic,copy) NSString *price_payable;


@end
