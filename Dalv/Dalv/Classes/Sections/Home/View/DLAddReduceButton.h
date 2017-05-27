//
//  DLAddReduceButton.h
//  Dalv
//
//  Created by Nie on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DLAddReduceButtonDelegate <NSObject>
@optional

/**
 加减代理回调
 
 @param numberButton 按钮
 @param number 结果
 @param increaseStatus 是否为加状态
 */
- (void)pp_numberButton:(__kindof UIView *)numberButton number:(NSInteger)number increaseStatus:(BOOL)increaseStatus;
@end

IB_DESIGNABLE
@interface DLAddReduceButton : UIView

- (instancetype)initWithFrame:(CGRect)frame;
+ (instancetype)numberButtonWithFrame:(CGRect)frame;

/** 加减按钮的Block回调*/
@property (nonatomic, copy) void(^resultBlock)(NSInteger number, BOOL increaseStatus/* 是否为加状态*/);
/** 代理*/
@property (nonatomic, weak) id<DLAddReduceButtonDelegate> delegate;

#pragma mark - 自定义样式属性设置
/** 是否开启抖动动画, default is NO*/
@property (nonatomic, assign ) IBInspectable BOOL shakeAnimation;
/** 为YES时,初始化时减号按钮隐藏(饿了么/百度外卖/美团外卖按钮模式),default is NO*/
@property (nonatomic, assign ) IBInspectable BOOL decreaseHide;
/** 是否可以使用键盘输入,default is YES*/
@property (nonatomic, assign, getter=isEditing) IBInspectable BOOL editing;

/** 设置边框的颜色,如果没有设置颜色,就没有边框 */
@property (nonatomic, strong ) IBInspectable UIColor *borderColor;

/** 输入框中的内容 */
@property (nonatomic, assign ) NSInteger currentNumber;
/** 输入框中的字体大小 */
@property (nonatomic, assign ) IBInspectable CGFloat inputFieldFont;

/** 加减按钮的字体大小 */
@property (nonatomic, assign ) IBInspectable CGFloat buttonTitleFont;
/** 加按钮背景图片 */
@property (nonatomic, strong ) IBInspectable UIImage *increaseImage;
/** 减按钮背景图片 */
@property (nonatomic, strong ) IBInspectable UIImage *decreaseImage;
/** 加按钮标题 */
@property (nonatomic, copy   ) IBInspectable NSString *increaseTitle;
/** 减按钮标题 */
@property (nonatomic, copy   ) IBInspectable NSString *decreaseTitle;

/** 最小值, default is 1 */
@property (nonatomic, assign ) IBInspectable NSInteger minValue;
/** 最大值 */
@property (nonatomic, assign ) NSInteger maxValue;

@end

#pragma mark - NSString分类
@interface NSString (DLAddReduceButton)
/**
 字符串 nil, @"", @"  ", @"\n" Returns NO;
 其他 Returns YES.
 */
- (BOOL)pp_isNotBlank;
@end
