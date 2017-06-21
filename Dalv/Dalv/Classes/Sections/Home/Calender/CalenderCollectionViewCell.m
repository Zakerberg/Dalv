//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import "CalenderCollectionViewCell.h"
#import "CalenderModel.h"
#import "CalenderObject.h"

@implementation CalenderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

#pragma mark - 创建cell视图

- (void)setupSubviews {
    float width = CGRectGetWidth(self.frame) - 15;
    float originY = (CGRectGetHeight(self.frame) - width) / 2.0;
    
    self.numButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.numButton.backgroundColor = [UIColor colorWithHexString:@"#16dcd1"];
    self.numButton.frame = CGRectMake(1, 10, 40, 17);
    self.numButton.layer.masksToBounds = YES;
    [self.numButton setTitle:@"18" forState:UIControlStateNormal];
    self.numButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.numButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.numButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.numButton];
    
    self.calenderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.calenderBtn setBackgroundImage:[UIImage imageNamed:@"dl_calender_selected_bg"] forState:UIControlStateSelected];
    [self.calenderBtn setBackgroundImage:[UIImage imageNamed:@"dl_calender_selected_bg"] forState:UIControlStateHighlighted];
    [self.calenderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.calenderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.calenderBtn.frame = CGRectMake(1, originY, 40, 40);
    [self.calenderBtn addTarget:self action:@selector(selectNumCalender:) forControlEvents:UIControlEventTouchDown];
    [self.calenderBtn addTarget:self action:@selector(selectNumCalenderTouchCancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.calenderBtn addTarget:self action:@selector(selectNumCalenderDragExit:) forControlEvents:UIControlEventTouchDragExit | UIControlEventTouchDragOutside | UIControlEventTouchCancel];
    [self addSubview:self.calenderBtn];
}

#pragma mark - 给cell赋值

- (void)configCellForArray:(NSMutableArray *)alldata index:(NSIndexPath *)index {
    _temIndex = index;
    CalenderObject *obj = alldata[index.section];
    CalendarDateSource *source = obj.allDate[index.row];
    CalenderModel *model = [[CalenderModel alloc] init];
    NSInteger interger = [source.day integerValue];
    NSInteger remindNum = [source.subTitle integerValue];
    if (interger <= 0) {
        self.calenderBtn.hidden = YES;
        self.numButton.hidden = YES;
    } else {
        self.calenderBtn.hidden = NO;
        self.numButton.hidden = NO;
    }
    if (obj.year == [[model getCurrentYear] integerValue] && obj.month == [[model getCurrentMonth] integerValue] && interger == [[model getCurrentDay] integerValue]) {
        [self.calenderBtn setTitle:[NSString stringWithFormat:@"今日"] forState:UIControlStateNormal];
        [self.calenderBtn setTitleColor:[UIColor ms_orangeColor] forState:UIControlStateNormal];
        self.calenderBtn.titleLabel.font = [UIFont systemFontOfSize:12.f];
    } else {
        [self.calenderBtn setTitle:[NSString stringWithFormat:@"%ld", (long) interger] forState:UIControlStateNormal];
        self.calenderBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
        if ([model checkTheDateIsagoYear:obj.year month:obj.month day:interger]) {
            [self.calenderBtn setTitleColor:[UIColor ms_grayColor] forState:UIControlStateNormal];
        } else {
            [self.calenderBtn setTitleColor:[UIColor ms_blackColor] forState:UIControlStateNormal];
        }
    }
    
    if (remindNum > 0) {
        [self.numButton setTitle:[NSString stringWithFormat:@"%ld", (long) remindNum] forState:UIControlStateNormal];
        self.numButton.tag = 1;
        self.numButton.layer.cornerRadius = CGRectGetHeight(self.numButton.frame) / 2.0;
        self.numButton.hidden = NO;
    } else {
        self.numButton.tag = 10;
        self.numButton.hidden = YES;
    }
}

#pragma mark - 点击事件

- (void)selectNumCalender:(UIButton *)sender {
    [sender setHighlighted:YES];
    sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    if ([self.delegate respondsToSelector:@selector(clickDayIndex:)]) {
        [self.delegate clickDayIndex:_temIndex];
    }
    [self.numButton setHidden:YES];
}

- (void)selectNumCalenderTouchCancel:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(clickTouchCancelIndex:)]) {
        [self.delegate clickTouchCancelIndex:_temIndex];
    }
    if (self.numButton.tag == 10) {
        [self.numButton setHidden:YES];
    } else {
        [self.numButton setHidden:NO];
    }
    
    [self.calenderBtn setSelected:NO];
}

- (void)selectNumCalenderDragExit:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(clickTouchCancelDragExit:)]) {
        [self.delegate clickTouchCancelDragExit:_temIndex];
    }
    if (self.numButton.tag == 10) {
        [self.numButton setHidden:YES];
    } else {
        [self.numButton setHidden:NO];
    }
    
    [self.calenderBtn setSelected:NO];
}

@end
