//
//  MSRefreshHeader.m
//  MIS
//
//  Created by Nie on 2017/4/1.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import "MSRefreshHeader.h"

@implementation MSRefreshHeader

- (instancetype)init {
    self = [super init];
    if (self) {
        self.automaticallyChangeAlpha = YES;
        self.lastUpdatedTimeLabel.hidden = YES;
    }
    return self;
}

- (void)prepare {
    [super prepare];
    // 初始化文字
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"释放更新" forState:MJRefreshStatePulling];
    [self setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
}

@end
