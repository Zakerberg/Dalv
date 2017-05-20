//
//  WQCalendarDay.m
//  WQCalendar


#import "CalendarDayModel.h"

@implementation CalendarDayModel


//公共的方法
+ (CalendarDayModel *)calendarDayWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day
{
    
    
    CalendarDayModel *calendarDay = [[CalendarDayModel alloc] init];//初始化自身
    calendarDay.year = year;//年
    calendarDay.month = month;//月
    calendarDay.day = day;//日

    return calendarDay;
}

//返回单个日期
- (NSDate *)dateDay{
    NSDateComponents *d = [[NSDateComponents alloc] init];
    d.day = self.day;
    return [[NSCalendar currentCalendar] dateFromComponents:d];
}
//单个日期的str
- (NSString *)dayStr{
    NSDate *date = [self dateDay];
    NSString *string = [date stringFromDate:date];
    return string;
}

//返回当前天的NSDate对象
- (NSDate *)date
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.year = self.year;
    c.month = self.month;
    c.day = self.day;
    return [[NSCalendar currentCalendar] dateFromComponents:c];
}
//返回当前天的NSString对象  //单程使用的日期
- (NSString *)toString
{
//    NSDate *date = [self date];
//    NSString *string = [date stringFromDate:date];
    
    NSString *str = [NSString stringWithFormat:@"%ld年%ld月%ld日",self.year,self.month,self.day];
    return str;
}

//返回当前天的NSString对象  //往返使用的日期
- (NSString *)gbString
{
    NSString *str = [NSString stringWithFormat:@"%ld.%ld.%ld",self.year,self.month,self.day];
    return str;
}

//返回星期
- (NSString *)getWeek
{

    NSDate *date = [self date];
    
    NSString *week_str = [date compareIfTodayWithDate];

    return week_str;
}

//判断是不是同一天
- (BOOL)isEqualTo:(CalendarDayModel *)day
{
    BOOL isEqual = (self.year == day.year) && (self.month == day.month) && (self.day == day.day);
    return isEqual;
}

@end
