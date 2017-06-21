//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalenderCollectionViewDelegate;

@interface CalenderCollectionViewCell : UICollectionViewCell
/**
 *  日历的button
 */
@property (nonatomic, strong) UIButton *calenderBtn;

/**
 *  日历上有多少拜访的用户
 */
@property (nonatomic, strong) UIButton *numButton;

/**
 *  临时的index
 */
@property (nonatomic, strong) NSIndexPath *temIndex;

/**
 *  delegate
 */
@property (nonatomic, assign) id<CalenderCollectionViewDelegate> delegate;

/**
 *  给cell赋值
 *
 *  @param alldata 存放所有的数据
 *  @param index   当前的index
 */
- (void)configCellForArray:(NSMutableArray *)alldata index:(NSIndexPath *)index;

@end

@protocol CalenderCollectionViewDelegate <NSObject>

/**
 *  当用户按住button的时候触发该事件
 *
 *  @param indexPath 当前的index
 */
- (void)clickDayIndex:(NSIndexPath *)indexPath;

/**
 *  当用户的手指抬起来的时候触发该事件
 *
 *  @param indexPath 当前的index
 */
- (void)clickTouchCancelIndex:(NSIndexPath *)indexPath;

- (void)clickTouchCancelDragExit:(NSIndexPath *)indexPath;

@end
