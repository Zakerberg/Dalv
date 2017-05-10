//
//  UIView+MSExtension.h
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MSExtension)

@property (nonatomic, assign) CGFloat ms_left;
@property (nonatomic, assign) CGFloat ms_top;
@property (nonatomic, assign) CGFloat ms_right;
@property (nonatomic, assign) CGFloat ms_bottom;
@property (nonatomic, assign) CGFloat ms_width;
@property (nonatomic, assign) CGFloat ms_height;
@property (nonatomic, assign) CGFloat ms_centerX;
@property (nonatomic, assign) CGFloat ms_centerY;
@property (nonatomic, assign) CGPoint ms_origin;
@property (nonatomic, assign) CGSize  ms_size;

/** 获取当前View的控制器对象 */
- (UIViewController *)getCurrentViewController;
@end
