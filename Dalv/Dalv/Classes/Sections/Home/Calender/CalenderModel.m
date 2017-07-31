//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import "CalenderModel.h"

@implementation CalenderModel

/*获取当前的date*/
- (NSDate *)getCurrentDate {
    return [NSDate date];
}

/*获取当前的月份*/
- (NSString *)getCurrentMonth {
    NSDate *date = [self getCurrentDate];
    return [date getCurrentMonth];
}

/*获取当前的年份*/
- (NSString *)getCurrentYear {
    NSDate *date = [self getCurrentDate];
    return [date getCurrentYear];
}

- (NSString *)getCurrentDay {
    NSDate *date = [self getCurrentDate];
    return [date getCurrentDay];
}

- (BOOL)checkTheDateIsagoYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDate *date = [self getCurrentByYear:year month:month day:day];
    //    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    NSDate *dateNow = [self getCurrentDate];
    //    NSString *timeSp1 = [NSString stringWithFormat:@"%ld", (long)[dateNow timeIntervalSince1970]];
    NSTimeInterval timeInterval0 = (long) [date timeIntervalSince1970];
    NSTimeInterval timeInterval1 = (long) [dateNow timeIntervalSince1970];
    if (timeInterval0 > timeInterval1) {
        return NO;
    }
    return YES;
}

- (NSDate *)getCurrentByYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    [compt setYear:year];
    [compt setMonth:month];
    [compt setDay:day];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [calendar dateFromComponents:compt];
    return date;
}

- (NSInteger)getAllDaysInMonthForYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    return [[self getCurrentByYear:year month:month day:day] getAllDaysInMonth];
}

- (NSUInteger)weeklyOrdinalityForYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDate *date = [self getCurrentByYear:year month:month day:day];
    return [date weeklyOrdinality];
}
@end
