//
//  DLRecommendRouteViewController.h
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------- 推荐线路 ----------------------

#import <UIKit/UIKit.h>

@interface DLRecommendRouteViewController : UIViewController
@property (nonatomic, strong) NSMutableArray *topicList;
/**
 *  推荐线路内容高度
 */
- (CGFloat)contentHeight;

/**
 *  加载完成
 */
@property (nonatomic, copy) void (^didCompleteLoad)();

/**
 *  重新加载数据
 */
- (void)beginLoading;


@end
