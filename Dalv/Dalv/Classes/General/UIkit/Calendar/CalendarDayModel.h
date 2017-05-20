//
//  WQCalendarDay.h
//  WQCalendar
//



#define CAN_SHOW 1    //可以被点击
#define CANNOT_SHOW 0//不能被点击


#import <Foundation/Foundation.h>
#import "NSDate+WQCalendarLogic.h"



typedef NS_ENUM(NSInteger, CollectionViewCellDayType) {
    CellDayTypeEmpty,   //不显示
//    CellDayTypePast,    //过去的日期
//    CellDayTypeFutur,   //将来的日期
    CellDayTypeNormal,
    CellDayTypeWeek,    //周末
    CellDayTypeClick    //被点击的日期

};

@interface CalendarDayModel : NSObject

@property (assign, nonatomic) CollectionViewCellDayType style;//显示的样式

@property (nonatomic, assign) NSInteger day;//天
@property (nonatomic, assign) NSInteger month;//月
@property (nonatomic, assign) NSInteger year;//年
@property (nonatomic, assign) NSInteger week;//周

@property (nonatomic, strong) NSString *Chinese_calendar;//农历
@property (nonatomic, strong) NSString *holiday;//节日




+ (CalendarDayModel *)calendarDayWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;
- (NSDate *)date;//返回当天的NSDate对象
- (NSString *)toString;//返回当天的NSString对象
- (NSString *)getWeek; //返回星期
- (NSDate *)dateDay;
- (NSString *)dayStr;
//往返的日期选择
- (NSString *)gbString;

@end
