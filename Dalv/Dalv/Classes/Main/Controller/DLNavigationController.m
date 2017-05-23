//
//  DLNavigationController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLNavigationController.h"

@interface DLNavigationController ()

@end

@implementation DLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航条相关的内容
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    // 清空阴影图片
    [self.navigationBar setShadowImage:[UIImage new]];
    
    // 设置导航条及状态栏的背景色"64"
    self.navigationBar.barTintColor = [UIColor colorWithRed:253/255.0 green:208/255.0 blue:0 alpha:0.5];
    
    // 取消半透明效果
    self.navigationBar.translucent = NO;
    
    // 设置导航条内容主题色
    self.navigationBar.tintColor = [UIColor blackColor];
    
    // 设置导航条标题文字颜色及字体大小
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:17], NSForegroundColorAttributeName : [UIColor blackColor]};
    
    //如果要改的是颜色及文字属性相关的找bar
    self.navigationItem.titleView = [[UILabel alloc] init];
    
}

// 设置状态栏的样式"如果有导航控制器时设置状态栏的样式权限默认是交给导航控制器做全局处理"
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


// 重写导航控制器的push方法拦截它push过程
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    
    // 只有导航控制器的非根控制器才需要隐藏tabBar
    if (self.childViewControllers.count > 0) {
        // 隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
