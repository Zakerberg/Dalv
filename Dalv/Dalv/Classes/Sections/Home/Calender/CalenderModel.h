//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Calender.h"

@interface CalenderModel : NSObject

/**
 *  获取当前的date
 *
 *  @return 当前的date
 */
- (NSDate *)getCurrentDate;

/**
 *  获取当前的年份
 *
 *  @return 返回当年的年份
 */
- (NSString *)getCurrentYear;

/**
 *  获取当前的月份
 *
 *  @return 返回当前的月份
 */
- (NSString *)getCurrentMonth;

/**
 *  获取当前的天
 *
 *  @return 返回当前的天
 */
- (NSString *)getCurrentDay;

/**
 *  通过年月日获取date
 *
 *  @param year  所要得到date的年份
 *  @param month 所要得到date的月份
 *  @param day   所要得到date的天
 *
 *  @return 所要得到date
 */
- (NSDate *)getCurrentByYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/**
 *  获取某年某月共有多少天
 *
 *  @param year  要获取的年份
 *  @param month 要获取的月份
 *  @param day   天
 *
 *  @return 返回总天数
 */
- (NSInteger)getAllDaysInMonthForYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/**
 *  获取某年某月某天是周几
 *
 *  @param year  要获取的年份
 *  @param month 要获取的月份
 *
 *  @return 返回周几，周日为一周的第一天
 */
- (NSUInteger)weeklyOrdinalityForYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/**
 *  判断这个日期是否是过去的某个日期
 *
 *  @param year  年
 *  @param month 月
 *  @param day   日
 *
 *  @return 当返回yes的时候 代表这个日期已经过去了 否则相反
 */
- (BOOL)checkTheDateIsagoYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end
