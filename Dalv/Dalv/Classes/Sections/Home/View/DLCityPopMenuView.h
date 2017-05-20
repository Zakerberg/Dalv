//
//  DLCityPopMenuView.h
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DLCityPopMenuViewDelegate;

@interface DLCityPopMenuView : UIView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) id<DLCityPopMenuViewDelegate>delegate;

/**
 点击每一栏时通过block回调,索引从0开始,
 */
@property (nonatomic, copy) void (^clickedBlock)(NSInteger index);

@property (nonatomic, assign) BOOL isShow;
/**
 初始化对象
 
 @param point 箭头指向的位置
 @param titleArray 显示的标题, titleArray和imageArray的个数需保持一致
 @return 初始化对象
 */
- (instancetype)initWithPositionOfDirection:(CGPoint)point titleArray:(NSArray<NSString *> *)titleArray;

// 隐藏自己
- (void)hiddenPopMenu;

- (void)showPopMenu;

@end

@protocol DLCityPopMenuViewDelegate <NSObject>

@optional

/**
 点击每一栏时通过代理回调
 
 @param menuView self
 @param index 每一栏的索引,从0开始,
 */
- (void)navigationMenuView:(DLCityPopMenuView *)menuView clickedAtIndex:(NSInteger)index;


@end
