//
//  DLRemindSegmentView.h
//  Dalv
//
//  Created by Nie on 2017/5/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLRemindSegmentView : UIView

typedef void(^selectBlock)(NSInteger index);

/**
 *  回调的block
 */
@property (nonatomic,copy)selectBlock selectBlock;

/**
 *  当每个控件等分的时候
 *
 *  @param frame       整个控件大小
 *  @param titleArr    title文字
 *  @param selectIndex 默认选中哪个
 *
 *  @return 初始化
 */
- (instancetype)initWithFrame:(CGRect)frame titletextArr:(NSArray *)titleArr selectIndex:(NSInteger )selectIndex;

/**
 *  当每个控件不等分的时候
 *
 *  @param frame       整个控件大小
 *  @param titleArr    title文字
 *  @param widthArr    对应每个小的控件的宽度，当传widthArr为空时为等分
 *  @param selectIndex 默认选中哪个
 *
 *  @return 初始化
 */
- (instancetype)initWithFrame:(CGRect)frame titletextArr:(NSArray *)titleArr widthArr:(NSArray *)widthArr selectIndex:(NSInteger )selectIndex;

/**
 *  当每个控件不等分的时候
 *
 *  @param frame       整个控件大小
 *  @param titleArr    title文字
 *  @param widthArr    对应每个小的控件的宽度，当传widthArr为空时为等分
 *  @param selectIndex 默认选中哪个
 *  @size 字体大小
 *  @return 初始化
 */
- (instancetype)initWithFrame:(CGRect)frame titletextArr:(NSArray *)titleArr widthArr:(NSArray *)widthArr selectIndex:(NSInteger )selectIndex titleFont:(CGFloat )size;

@end
