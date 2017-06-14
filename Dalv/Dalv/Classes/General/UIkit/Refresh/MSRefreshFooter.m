//
//  MSRefreshFooter.m
//  MIS
//
//  Created by Nie on 2017/4/1.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import "MSRefreshFooter.h"

@implementation MSRefreshFooter

- (void)prepare {
    [super prepare];
    // 初始化文字
    [self setTitle:@"上拉加载" forState:MJRefreshStateIdle];
    [self setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"已全部加载" forState:MJRefreshStateNoMoreData];
}

- (void)setState:(MJRefreshState)state {
    [super setState:state];
    
}

@end
