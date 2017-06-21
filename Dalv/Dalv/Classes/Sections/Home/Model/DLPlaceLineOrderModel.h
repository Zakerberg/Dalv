//
//  DLPlaceLineOrderModel.h
//  Dalv
//
//  Created by Nie on 2017/6/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DLPlaceOrderTourDate ;
@class PlaceOrderAgencyInfo;
@class LineList;
@interface DLPlaceLineOrderModel : NSObject
@property (nonatomic, strong) NSArray <DLPlaceOrderTourDate *> *tour_date;//团期信息
@property (nonatomic, strong) PlaceOrderAgencyInfo *agencyInfo;//顾问详情
@property (nonatomic, strong) LineList *list;//线路详情

@end

/**
 *  线路团期
 */
@interface DLPlaceOrderTourDate : NSObject

/** 团期id*/
@property (nonatomic, copy) NSString *tourDateId;

/** 出团日期 */
@property (nonatomic, copy) NSString *start_time;

@end

// 顾问详情
@interface PlaceOrderAgencyInfo : NSObject

/** 顾问冻结状态 */
@property (nonatomic, copy) NSString *account_state;

/**顾问id */
@property (nonatomic, copy) NSString *agencyId;

/** 顾问手机号 */
@property (nonatomic, copy) NSString *mobile;

/** 顾问名称 */
@property (nonatomic, copy) NSString *name;

@end


// 线路详情
@interface LineList : NSObject

/** 儿童常规价格 */
@property (nonatomic, copy) NSString *price_child_agenc;

/**线路Id */
@property (nonatomic, copy) NSString *lineTourId;

/** 成人常规价格 */
@property (nonatomic, copy) NSString *price_adult_agenc;

/** 单房差 */
@property (nonatomic, copy) NSString *price_hotel_agenc;

/** 线路名称 */
@property (nonatomic, copy) NSString *name;

@end
