//
//  UIView+Frame.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

// shortcuts for positions
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;


@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
/**
 *  等比例拉伸视图
 *
 *  @param width 目标宽
 *
 *  @return 目标高
 */
- (CGFloat)autoresizeHeightToWidth:(CGFloat)width;
/**
 *  等比例拉伸视图
 *
 *  @param width 目标高
 *
 *  @return 目标宽
 */
- (CGFloat)autoresizeWidthToHeight:(CGFloat)height;

@end
