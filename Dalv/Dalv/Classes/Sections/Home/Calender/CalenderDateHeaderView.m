//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import "CalenderDateHeaderView.h"
#import "NSDate+Calender.h"

static float dataHeight = 35;
static float LineSapce = 1;

@implementation CalenderDateHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
        self.backgroundColor = [UIColor colorWithHexString:@"#ebebeb"];
    }
    return self;
}

- (void)setupSubviews {
    UIView *dataView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), dataHeight)];
    dataView.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
    [self addSubview:dataView];
    
    self.dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(dataView.frame), dataHeight)];
    self.dataLabel.textAlignment = NSTextAlignmentCenter;
    self.dataLabel.font = [UIFont systemFontOfSize:15.f];
    self.dataLabel.backgroundColor = [UIColor clearColor];
    self.dataLabel.text = @"2020-12-14";
    self.dataLabel.textColor = [UIColor ms_blackColor];
    [dataView addSubview:self.dataLabel];
    NSArray *weekArray = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    float width = CGRectGetWidth(self.frame) / 7.0 - LineSapce;
    for (int i = 0; i < 7; i++) {
        UILabel *weekLable = [[UILabel alloc] initWithFrame:CGRectMake(i * width + i * LineSapce, CGRectGetMaxY(dataView.frame) + 3, width, 20)];
        weekLable.backgroundColor = [UIColor clearColor];
        weekLable.textAlignment = NSTextAlignmentCenter;
        weekLable.text = [NSString stringWithFormat:@"%@", weekArray[i]];
        weekLable.font = [UIFont systemFontOfSize:14];
        weekLable.textColor = [UIColor ms_blackColor];
        [self addSubview:weekLable];
    }
}

@end
