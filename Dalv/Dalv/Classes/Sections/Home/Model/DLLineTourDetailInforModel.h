//
//  DLLineTourDetailInforModel.h
//  Dalv
//
//  Created by Nie on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DLLineTourSkuDate;
@class DLLineTourDetail;
/** 线路详情 模型 */
@interface DLLineTourDetailInforModel : NSObject

/** 出发城市 */
@property (nonatomic, copy) NSString *departure;

/** 顾问修改标题 */
@property (nonatomic, copy) NSString *agencyTourTitle;

/** 行程天数 */
@property (nonatomic, copy) NSString *totalDay;

/** 用户id */
@property (nonatomic, copy) NSString *uid;

/**  签名验证身份token */
@property (nonatomic, copy) NSString *sign_token;

/**
 *  线路团期
 */
@property (nonatomic, strong) NSArray <DLLineTourSkuDate *> *tourSkuDate;

/** 线路详情 */
@property (nonatomic, strong) DLLineTourDetail *list;

/** 图片数组 */
@property (nonatomic, strong) NSArray <NSString *> *picArr;

@end


/**
 *  线路团期
 */
@interface DLLineTourSkuDate : NSObject

/** 团期id*/
@property (nonatomic, copy) NSString *tourSkuDateId;

/** 建议销售价或顾问改的价格 */
@property (nonatomic, copy) NSString *price_adult_list;

/** 出团日期 */
@property (nonatomic, copy) NSString *start_time;

/** 顾问结算价 */
@property (nonatomic, copy) NSString *price_adult_agency;


@end


/** 线路详情基本信息 */
@interface DLLineTourDetail : NSObject

/** 出发城市 */
@property (nonatomic, copy) NSString *departure;

/** 顾问修改标题 */
@property (nonatomic, copy) NSString *agencyTourTitle;

/** 行程天数 */
@property (nonatomic, copy) NSString *totalDay;

/** 线路id*/
@property (nonatomic, copy) NSString *lineTourId;

/** 线路名称 */
@property (nonatomic, copy) NSString *name;

/**  供应商名称 */
@property (nonatomic, copy) NSString *provider_name;

/** 联系人 */
@property (nonatomic, copy) NSString *contact_person;

/** 价格 */
@property (nonatomic, copy) NSString *min_price;

/** 目的地 */
@property (nonatomic, copy) NSString *destinations;

/** 出发交通 */
@property (nonatomic, copy) NSString *traffic_go;

/** 返程交通 */
@property (nonatomic, copy) NSString *traffic_back;

/** pics这个字段不要管他 */
@property (nonatomic, copy) NSString *pics;

@end
