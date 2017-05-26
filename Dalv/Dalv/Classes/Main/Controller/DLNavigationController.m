//
//  DLNavigationController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLNavigationController.h"

@interface DLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation DLNavigationController

#pragma mark - Class methods

+ (void)initialize {
    [self setupNavBarTheme];
    [self setupBarButtonItemTheme];
}

+ (void)setupNavBarTheme {
    UINavigationBar *appearance = [UINavigationBar appearance];
    appearance.tintColor = [UIColor ms_blackColor];
    //    appearance.barTintColor = [UIColor whiteColor];
    [appearance setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]
                    forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor ms_blackColor],
                                         NSFontAttributeName: [UIFont systemFontOfSize:18]}];
    [appearance setShadowImage:[UIImage imageWithColor:[UIColor ms_separatorColor]
                                                  size:CGSizeMake(0.6f, 0.6f)]];
}

+ (void)setupBarButtonItemTheme {
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor ms_blackColor],
                                         NSFontAttributeName: [UIFont systemFontOfSize:16]}
                              forState:UIControlStateNormal];
    
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor ms_orangeColor],
                                         NSFontAttributeName: [UIFont systemFontOfSize:16]}
                              forState:UIControlStateHighlighted];
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    self.navigationBar.layer.shadowOpacity = 0.1f;
    //    self.navigationBar.layer.shadowOffset = CGSizeZero;
    self.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        [self setupBack:viewController];
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count > 1;
}

#pragma mark - Setup

- (void)setupBack:(UIViewController *)viewController {
    if (viewController.dl_blueNavbar) {
        UIBarButtonItem *backItem = [UIBarButtonItem itemWithImageName:@"navbar_back_white"
                                                         highImageName:@"navbar_back_white"
                                                                target:self
                                                                action:@selector(didTapBack:)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    } else {
        UIBarButtonItem *backItem = [UIBarButtonItem itemWithImageName:@"navbar_back_gray"
                                                         highImageName:@"navbar_back_gray"
                                                                target:self
                                                                action:@selector(didTapBack:)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
}

#pragma mark - Action

- (void)didTapBack:(UIBarButtonItem *)sender {
    UIViewController *viewController = [self viewControllers].lastObject;
    if ([viewController respondsToSelector:@selector(didTapBack:)]) {
        [viewController performSelector:@selector(didTapBack:) withObject:sender];
    } else {
        [self popViewControllerAnimated:YES];
    }
}


@end
