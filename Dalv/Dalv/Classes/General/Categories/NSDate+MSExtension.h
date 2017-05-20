//
//  NSDate+MSExtension.h
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MSExtension)

@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger day;
@property (nonatomic, assign, readonly) NSInteger hour;
@property (nonatomic, assign, readonly) NSInteger minute;
@property (nonatomic, assign, readonly) NSInteger second;
@property (nonatomic, assign, readonly) NSInteger nanosecond;
@property (nonatomic, assign, readonly) NSInteger weekday;
@property (nonatomic, assign, readonly) NSInteger weekdayOrdinal;
@property (nonatomic, assign, readonly) NSInteger weekOfMonth;
@property (nonatomic, assign, readonly) NSInteger weekOfYear;
@property (nonatomic, assign, readonly) NSInteger yearForWeekOfYear;
@property (nonatomic, assign, readonly) NSInteger quarter;
@property (nonatomic, assign, readonly) BOOL isLeapMonth;
@property (nonatomic, assign, readonly) BOOL isLeapYear;
@property (nonatomic, assign, readonly) BOOL isToday;
@property (nonatomic, assign, readonly) BOOL isYesterday;

- (NSDate *)dateByAddingYears:(NSInteger)years;

- (NSDate *)dateByAddingMonths:(NSInteger)months;

- (NSDate *)dateByAddingWeeks:(NSInteger)weeks;

- (NSDate *)dateByAddingDays:(NSInteger)days;

- (NSDate *)dateByAddingHours:(NSInteger)hours;

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;

- (NSDate *)dateByAddingSeconds:(NSInteger)seconds;

- (NSString *)stringWithFormat:(NSString *)format;

- (NSString *)stringWithFormat:(NSString *)format
                      timeZone:(NSTimeZone *)timeZone
                        locale:(NSLocale *)locale;

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

@end
