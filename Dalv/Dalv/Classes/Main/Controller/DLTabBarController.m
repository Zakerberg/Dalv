//
//  DLTabBarController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLTabBarController.h"

static NSString * const HomeViewVC = @"DLHomeViewController";
static NSString * const OrderViewVC = @"DLLineOrderController";
static NSString * const FianceViewVC = @"DLFianceController";
static NSString * const MineCenterVC = @"DLMineCenterController";

static NSString * const TabbarTitle = @"TabbarTitle";
static NSString * const TabbarImage = @"TabbarImage";
static NSString * const TabbarSelectedImage = @"TabbarSelectedImage";
static NSString * const TabbarItemBadgeValue = @"TabbarItemBadgeValue";

@interface DLTabBarController ()

@property (nonatomic, strong) NSArray *vcsOrder;
@property (nonatomic, strong) NSDictionary *vcsInfoDict;

@end

@implementation DLTabBarController

#pragma mark - life cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubVCs];
    
}

#pragma mark - setupSubVCs

- (void)setupSubVCs {
    
    [self.vcsOrder enumerateObjectsUsingBlock:^(id  _Nonnull vcName, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSDictionary *vcInfo = [self.vcsInfoDict objectForKey:vcName];
        
        Class clazz = NSClassFromString(vcName);
        UIViewController *vc = [clazz new];
        vc.title = vcInfo[TabbarTitle];
        vc.tabBarItem.image = [[UIImage imageNamed:vcInfo[TabbarImage]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
        UIImage *selectedImage = [[UIImage imageNamed:vcInfo[TabbarSelectedImage]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = selectedImage;
        
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#999999"],
                                                NSFontAttributeName : [UIFont systemFontOfSize:11]}
                                     forState:UIControlStateNormal];
        
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"5e73f4"]}
                                     forState:UIControlStateSelected];
        
        DLNavigationController *nav = [[DLNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }];
}

#pragma getters / setters

- (NSArray *)vcsOrder {
    
   if([[DLUtils getUser_type]  isEqualToString: @"4"]){
       
        return @[HomeViewVC,OrderViewVC,FianceViewVC,MineCenterVC];
       
    } else {
        
        return @[HomeViewVC,OrderViewVC,MineCenterVC];
    }
}

- (NSDictionary *)vcsInfoDict {
    
    return @{HomeViewVC : @{
                     TabbarTitle        : @"首页",
                     TabbarImage        : @"home",
                     TabbarSelectedImage: @"home_highlight",
                     TabbarItemBadgeValue: @(0)
                     },
             
             OrderViewVC : @{
                     TabbarTitle        : @"订单",
                     TabbarImage        : @"order",
                     TabbarSelectedImage: @"order_heighlight",
                     TabbarItemBadgeValue: @(0)
                     },
             
             FianceViewVC : @{
                     TabbarTitle        : @"财务",
                     TabbarImage        : @"financial",
                     TabbarSelectedImage: @"financial_highlight",
                     TabbarItemBadgeValue: @(0)
                     },
             
             MineCenterVC : @{
                     TabbarTitle        : @"我的",
                     TabbarImage        : @"my",
                     TabbarSelectedImage: @"my_highlight",
                     TabbarItemBadgeValue: @(0)
                     }};
}

@end
