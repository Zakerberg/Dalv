//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalenderViewDelegate;

@interface CalenderView : UIView

@property (nonatomic, weak) id<CalenderViewDelegate> delegate;

/**
 *  获取日历预约提醒消息
 */
- (void)getCalendarRemindsInfo;

/**
 *  获取日历数据
 */
- (void)getCalenderData;

@end

@protocol CalenderViewDelegate <NSObject>

/**
 *  点击当前的日期的点击事件
 *
 *  @param time 当前的时间
 */
- (void)calendarDidSelectObj:(NSString *)time;

@end
