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

/** 图片地址 */
@property (nonatomic, copy) NSString *url;
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 出发地点 */
@property (nonatomic, copy) NSString *departureLocation;
/** 价格*/
@property (nonatomic, copy) NSString *price;

@end
