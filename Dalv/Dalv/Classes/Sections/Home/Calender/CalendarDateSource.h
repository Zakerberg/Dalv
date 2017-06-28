//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface CalendarDateSource : NSObject

@property (nonatomic, copy) NSString *day;                ///当前天
@property (nonatomic, assign, getter=isSelect) BOOL Select; ///是否选中
@property (nonatomic, copy) NSString *subTitle;           ///当前存放任务
@property (nonatomic, copy) NSString *adultTitle;           ///当前存放任务

@end
