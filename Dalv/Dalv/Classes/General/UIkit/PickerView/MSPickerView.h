//
//  MSPickerView.h
//  MIS
//
//  Created by Nie on 2017/3/6.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSPickerView;

@interface MSPickerItem : NSObject

/**
 *  选择条目显示标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  选择条目所对应值
 */
@property (nonatomic, copy) NSString *value;

/**
 *  多级相关联的子item 类似于省市区地区选择
 */
@property (nonatomic, copy) NSArray <MSPickerItem *> *itemArray;

/**
 *  构造方法
 *
 *  @param title 选择条目显示标题
 *  @param value 选择条目所对应的值
 *
 *  @return 选择条目
 */
+ (instancetype)itemWithTitle:(NSString *)title value:(NSString *)value;


/**
 *  构造方法
 *
 *  @param title 选择条目显示标题
 *  @param value 选择条目所对应的值
 *  @param itemArray 选择条目对应的子条目
 *  @return 选择条目
 */
+ (instancetype)itemWithTitle:(NSString *)title value:(NSString *)value itemArray:(NSArray<MSPickerItem *> *)itemArray;

@end

@protocol MSPickerViewDelegate <NSObject>

@optional
- (void)pickerView:(MSPickerView *)pickerView didSelectCompleteAtItem:(MSPickerItem *)item;

@end

@interface MSPickerView : UIView

/**
 *  选择器View，多列数据源自己实现代理方法
 */
@property (nonatomic, weak, readonly) UIPickerView *pickerView;

@property (nonatomic, weak) id<MSPickerViewDelegate> delegate;

/**
 *  选择器数据源
 */
@property (nonatomic, strong) NSArray *pickerItems;

/**
 *  显示选择器
 */
- (void)show;

- (void)showWithTitles:(NSArray <NSString *> *)titles;

/**
 *  刷新数据
 */
- (void)reload:(NSArray <MSPickerItem *> *)pickerItems;

- (void)reloadWithTitles:(NSArray <NSString *> *)titles;

/**
 *  隐藏选择器
 */
- (void)hide;


@end
