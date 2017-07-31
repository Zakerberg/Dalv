//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MISDATEFORMATYYYYMMDD @"YYYYMMdd"
#define MISDATEFORMATYYYYMM @"YYYYMM"
#define MISDATEFORMATYYYYQQ @"YYYYQQ"
#define MISDATEFORMATYYYY @"YYYY"
#define MISDATEFORMATMM @"MM"

@interface NSDate (Calender)
//- (NSString *)stringFromDate:(NSDate *)date;///NSDate转NSString

- (NSString *)getCurrentDay; ///获取当前月的天

- (NSString *)getCurrentMonth; ///获取当前月份

- (NSString *)getCurrentYear; ///获取当前年份

- (NSInteger)getAllDaysInMonth; ///获取某月中有多少天

- (NSUInteger)weeklyOrdinality; ///计算这个月的第一天是礼拜几

- (NSDate *)dateFromString:(NSString *)dateString; ///NSString转NSDate

//- (NSString *)getCurrentdate;

/**获取指定日期的年月*/
- (NSString *)getYearMonth;

/**获取当前年的首月*/
- (NSString *)getFirstYearMonth;

/**获取当前年的末月*/
- (NSString *)getLastYearMonth;

/**判断同一年*/
+ (BOOL)isSameYearWithDate1:(NSDate *)date1
                      date2:(NSDate *)date2;

@end
