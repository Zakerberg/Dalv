//
//  DLRecommendRouteModel.h
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 推荐线路的模型 */
@interface DLRecommendRouteModel : NSObject

/** 价格 */
@property (nonatomic, copy) NSString *min_price;
/** 线路Id */
@property (nonatomic, copy) NSString *routeId;
/** 图片地址 */
@property (nonatomic, copy) NSString *cover_pic;
/** 标题*/
@property (nonatomic, copy) NSString *name;
/** 地址*/
@property (nonatomic, copy) NSString *departure;
/** 条数*/
@property (nonatomic, copy) NSString *total;
/** 目的地*/
@property (nonatomic, copy) NSString *destination;


@end
