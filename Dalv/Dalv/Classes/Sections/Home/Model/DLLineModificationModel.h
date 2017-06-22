//
//  DLLineModificationModel.h
//  Dalv
//
//  Created by Nie on 2017/6/21.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LineModificationList;
@class TourList;
/** 线路改价 模型 */
@interface DLLineModificationModel : NSObject
@property (nonatomic, strong) NSArray <LineModificationList *> *list;//团期价格
@property (nonatomic, strong) TourList *tour_list;//线路详情

@end

/**
 *  线路团期
 */
@interface LineModificationList : NSObject

/** 成人结算价*/
@property (nonatomic, copy) NSString *price_adult_agency;

/** 这个参数不用管 */
@property (nonatomic, copy) NSString *cruise;

/** 线路id*/
@property (nonatomic, copy) NSString *tour_id;

/** 团期id */
@property (nonatomic, copy) NSString *tourDateId;

/** 单房差建议销售价*/
@property (nonatomic, copy) NSString *price_hotel_list;

/** 出团日期 */
@property (nonatomic, copy) NSString *start_time;

/** 单房差结算价*/
@property (nonatomic, copy) NSString *price_hotel_agency;

/** 儿童结算价 */
@property (nonatomic, copy) NSString *price_child_agency;

/** 成人建议销售价*/
@property (nonatomic, copy) NSString *price_adult_list;

/** 儿童建议销售价 */
@property (nonatomic, copy) NSString *price_child_list;

/** 顾问修改后成人价格价 */
@property (nonatomic, copy) NSString *user_defined_adult_list;

/** 顾问修改后儿童价格*/
@property (nonatomic, copy) NSString *user_defined_child_list;

/** 顾问修改后单房差价格 */
@property (nonatomic, copy) NSString *user_defined_hotel_list;

@end

// 线路详情
@interface TourList : NSObject

/** 价格 */
@property (nonatomic, copy) NSString *min_price;

/**线路Id */
@property (nonatomic, copy) NSString *lineTourId;

/** 这个不用管 */
@property (nonatomic, copy) NSString *travel_type;

/** 这个不用管 */
@property (nonatomic, copy) NSString *line_type;

/** 线路名称 */
@property (nonatomic, copy) NSString *name;

/** 线路主图 */
@property (nonatomic, copy) NSString *cover_pic;

/** 线路类型 */
@property (nonatomic, copy) NSString *lineTypeName;

/** sign_token */
@property (nonatomic, copy) NSString *sign_token;

@end
