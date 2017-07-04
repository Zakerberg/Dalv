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
//    float width = CGRectGetWidth(self.frame) - 15;
//    float originY = (CGRectGetHeight(self.frame) - width) / 2.0;
    
    if([[DLUtils getUser_type]  isEqualToString: @"4"]){

    self.priceAdultButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.priceAdultButton.backgroundColor = [UIColor colorWithHexString:@"#fe6643"];
    self.priceAdultButton.frame = CGRectMake(1, 18, 40, 17);
    self.priceAdultButton.layer.masksToBounds = YES;
    [self.priceAdultButton setTitle:@"18" forState:UIControlStateNormal];
    self.priceAdultButton.titleLabel.font = [UIFont systemFontOfSize:10.f];
    [self.priceAdultButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.priceAdultButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.priceAdultButton];
    
    self.priceChildButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.priceChildButton.backgroundColor = [UIColor colorWithHexString:@"#fe6643"];
    self.priceChildButton.frame = CGRectMake(1, 37, 40, 17);
    self.priceChildButton.layer.masksToBounds = YES;
    [self.priceChildButton setTitle:@"18" forState:UIControlStateNormal];
    self.priceChildButton.titleLabel.font = [UIFont systemFontOfSize:10.f];
    [self.priceChildButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.priceChildButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.priceChildButton];
        
    } else {
        
        self.priceAdultButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.priceAdultButton.backgroundColor = [UIColor colorWithHexString:@"#fe6643"];
        self.priceAdultButton.frame = CGRectMake(1, 24, 40, 17);
        self.priceAdultButton.layer.masksToBounds = YES;
        [self.priceAdultButton setTitle:@"18" forState:UIControlStateNormal];
        self.priceAdultButton.titleLabel.font = [UIFont systemFontOfSize:10.f];
        [self.priceAdultButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.priceAdultButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.priceAdultButton];
        
        self.priceAdultButton.hidden = YES;
        
        

    }
    
    self.calenderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.calenderBtn setBackgroundImage:[UIImage imageNamed:@"dl_calender_selected_bg"] forState:UIControlStateSelected];
    [self.calenderBtn setBackgroundImage:[UIImage imageNamed:@"dl_calender_selected_bg"] forState:UIControlStateHighlighted];
    [self.calenderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.calenderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.calenderBtn.frame = CGRectMake(1, -10, 40, 40);
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
    NSInteger adultremindNum = [source.adultTitle integerValue];


    if (interger <= 0) {
        self.calenderBtn.hidden = YES;
        self.priceAdultButton.hidden = YES;
        self.priceChildButton.hidden = YES;
    } else {
        self.calenderBtn.hidden = NO;
        self.priceAdultButton.hidden = NO;
        self.priceChildButton.hidden = YES;
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
        [self.priceAdultButton setTitle:[NSString stringWithFormat:@"¥%ld",remindNum/100] forState:UIControlStateNormal];
        self.priceAdultButton.tag = 1;
        self.priceAdultButton.layer.cornerRadius = CGRectGetHeight(self.priceAdultButton.frame) / 2.0;
        self.priceAdultButton.hidden = NO;
        
        [self.priceChildButton setTitle:[NSString stringWithFormat:@"¥%ld",adultremindNum/100] forState:UIControlStateNormal];
        self.priceChildButton.tag = 1;
        self.priceChildButton.layer.cornerRadius = CGRectGetHeight(self.priceChildButton.frame) / 2.0;
        self.priceChildButton.hidden = NO;

    } else {
        self.priceAdultButton.tag = 10;
        self.priceAdultButton.hidden = YES;
        
        self.priceChildButton.tag = 20;
        self.priceChildButton.hidden = YES;
    }
}

#pragma mark - 点击事件

- (void)selectNumCalender:(UIButton *)sender {
    [sender setHighlighted:YES];
    sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    if ([self.delegate respondsToSelector:@selector(clickDayIndex:)]) {
        [self.delegate clickDayIndex:_temIndex];
    }
    [self.priceAdultButton setHidden:YES];
    [self.priceChildButton setHidden:YES];

}

- (void)selectNumCalenderTouchCancel:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(clickTouchCancelIndex:)]) {
        [self.delegate clickTouchCancelIndex:_temIndex];
    }
    if (self.priceAdultButton.tag == 10  && self.priceChildButton.tag == 20)  {
        [self.priceAdultButton setHidden:YES];
        [self.priceChildButton setHidden:YES];
    } else {
        [self.priceAdultButton setHidden:NO];
        [self.priceChildButton setHidden:NO];
    }
    
    [self.calenderBtn setSelected:NO];
}

- (void)selectNumCalenderDragExit:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(clickTouchCancelDragExit:)]) {
        [self.delegate clickTouchCancelDragExit:_temIndex];
    }
    if (self.priceAdultButton.tag == 10  && self.priceChildButton.tag == 20) {
        [self.priceAdultButton setHidden:YES];
        [self.priceChildButton setHidden:YES];
    } else {
        [self.priceAdultButton setHidden:NO];
        [self.priceChildButton setHidden:NO];
    }
    
    [self.calenderBtn setSelected:NO];
}

@end
