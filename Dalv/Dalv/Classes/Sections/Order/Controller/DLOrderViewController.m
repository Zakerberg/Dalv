//
//  DLOrderViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLOrderViewController.h"


@interface DLOrderViewController ()

@end

@implementation DLOrderViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar ];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"订单";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

@end
