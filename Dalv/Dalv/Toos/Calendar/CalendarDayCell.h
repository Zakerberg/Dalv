//
//  CalendarDayCell.h
//  tttttt
//


#import <UIKit/UIKit.h>
#import "CalendarDayModel.h"
#import "Color.h"

@interface CalendarDayCell : UICollectionViewCell
{
    UILabel *day_lab;//今天的日期或者是节日
    UILabel *day_title;//显示标签
    UIImageView *imgview;//选中时的图片
    UIView *lineView;//添加在cell上的线
}

@property(nonatomic , strong)CalendarDayModel *model;

@end
