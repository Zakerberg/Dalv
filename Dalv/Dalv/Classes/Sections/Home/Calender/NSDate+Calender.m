//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import "NSDate+Calender.h"

@implementation NSDate (Calender)
/*获取当前天*/
-(NSString *)getCurrentDay {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd"];
    NSString *dateTime = [formater stringFromDate:self];
    return dateTime;

}

/*获取当前月份*/
-(NSString *)getCurrentMonth{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"MM"];
    NSString *dateTime = [formater stringFromDate:self];
    return dateTime;
}

/*获取当前年份*/
-(NSString *)getCurrentYear{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy"];
    NSString *dateTime = [formater stringFromDate:self];
    return dateTime;
}

/*获取某月的有多少天*/
-(NSInteger)getAllDaysInMonth {
    NSInteger allDays;
    allDays =  [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
    return allDays;
}

/*计算这个月的第一天是礼拜几*/
- (NSUInteger)weeklyOrdinality {
    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDate *date = [calendar dateFromComponents:compt];
    return [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:self];
}

/*string 转为date */
- (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

/*获取指定日期的年月*/
- (NSString *)getYearMonth {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:MISDATEFORMATYYYYMM];
    NSString *dateTime = [formater stringFromDate:self];
    return dateTime;
}
/**获取当前年的首月*/
- (NSString *)getFirstYearMonth {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:MISDATEFORMATYYYY];
    NSString *dateTime = [formater stringFromDate:self];
    dateTime = [dateTime stringByAppendingString:@"01"];
    return dateTime;
}

/**获取当前年的末月*/
- (NSString *)getLastYearMonth {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:MISDATEFORMATYYYY];
    NSString *dateTime = [formater stringFromDate:self];
    dateTime = [dateTime stringByAppendingString:@"12"];
    return dateTime;
}
//判断同一年
+ (BOOL)isSameYearWithDate1:(NSDate *)date1
                      date2:(NSDate *)date2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    
    return ([comp1 year] == [comp2 year]);
}
@end
