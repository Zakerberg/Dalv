//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarDateSource.h"

@interface CalenderRemindParam : NSObject

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *monthScope;

@end

@interface CalenderRemind : NSObject

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, copy) NSString *monthScope;

@end

@interface CalenderObject : NSObject
//@property (nonatomic, assign) NSUInteger day;///天
//@property (nonatomic, assign) NSUInteger month;///月
//@property (nonatomic, assign) NSUInteger year;///年
//@property (nonatomic, assign) NSUInteger week;///周

@property (nonatomic, assign) NSUInteger month;            ///月份
@property (nonatomic, assign) NSUInteger year;             ///年份
@property (nonatomic, assign) NSUInteger totalDaysInMonth; ///这个月份有多少天
@property (nonatomic, assign) NSUInteger weekDay;          ///星期几
@property (nonatomic, strong) NSMutableArray *allDate;     ///存放当前月份的所有日期

@end
