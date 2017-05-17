//
//  CalendarLogic1.h
//  Calendar

#import <Foundation/Foundation.h>
#import "CalendarDayModel.h"
#import "NSDate+WQCalendarLogic.h"

typedef void (^NSDateWQBlock) (NSDate *WQNSdate);
@interface CalendarLogic : NSObject

- (NSMutableArray *)reloadCalendarView:(NSDate *)date  selectDate:(NSDate *)date1 needDays:(int)days_number;
- (void)selectLogic:(CalendarDayModel *)day;

@property (nonatomic, copy) NSDateWQBlock  dateBlock;
@end
