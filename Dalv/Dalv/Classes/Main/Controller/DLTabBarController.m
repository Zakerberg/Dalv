//
//  DLTabBarController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLTabBarController.h"
#import "DLNavigationController.h"


@interface DLTabBarController ()

@end

@implementation DLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIViewController *VC1 =  [self makeChildViewController:@"DLHomeViewController" andTabBarTitle:@"首页" andTabBarImage:@"v2_home"];
    
    UIViewController *VC2 =  [self makeChildViewController:@"DLOrderViewController" andTabBarTitle:@"订单" andTabBarImage:@"v2_order"];
            
        UIViewController *VC3 =  [self makeChildViewController:@"DLFianceController" andTabBarTitle:@"财务" andTabBarImage:@""];
        VC3.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    
    UIViewController *VC4 =  [self makeChildViewController:@"DLMineCenterController" andTabBarTitle:@"我的" andTabBarImage:@""];
    
//    UIViewController *VC5 = [self makeChildViewController:@"DLShopViewController" andTabBarTitle:@"商城" andTabBarImage:@""];
    
    self.viewControllers = @[VC1, VC2, VC3, VC4];
    
    self.tabBar.tintColor = [UIColor grayColor];
    
    // 关闭标签栏的半透明效果
    //控制器的view就不会到底屏幕最底部了,而是到了标签栏的上面
    self.tabBar.translucent = NO;
}

- (UIViewController *)makeChildViewController:(NSString *)className andTabBarTitle:(NSString *)title andTabBarImage:(NSString *)imageName
{
    
    Class class = NSClassFromString(className);
    
    UIViewController *vc = [[class alloc] init];
    
    // 设置标签栏上控制器对应的标题文字
    //    vc.tabBarItem.title = title;
    
    vc.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    NSString *selImageName = [imageName stringByAppendingString:@"_r"];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // vc.view.backgroundColor =  [UIColor whiteColor];
    
    //创建导航控制器,并给它添加根控制器
    DLNavigationController *nav = [[DLNavigationController alloc] initWithRootViewController:vc];
    
    
    return nav;
}

@end
