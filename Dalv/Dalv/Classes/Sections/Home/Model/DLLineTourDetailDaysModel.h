//
//  DLLineTourDetailDaysModel.h
//  Dalv
//
//  Created by Nie on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 线路详情 日程安排模型 */
@interface DLLineTourDetailDaysModel : NSObject

/** 第几天 */
@property (nonatomic, copy) NSString *day;

/** 描述 */
@property (nonatomic, copy) NSString *daysDescription;

/** 旅馆 */
@property (nonatomic, copy) NSString *hotel;

/** 用餐 */
@property (nonatomic, copy) NSString *dining;

@end
