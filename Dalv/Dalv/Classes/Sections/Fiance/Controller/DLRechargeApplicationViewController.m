//
//  DLRechargeApplicationViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRechargeApplicationViewController.h"
#import "DLOfflineRechargeViewController.h"
#import "DLOnlineRechargeViewController.h"
@interface DLRechargeApplicationViewController ()
{
    DLOfflineRechargeViewController *_offlineVC;
    DLOnlineRechargeViewController *_onlineVC;
}

@end

@implementation DLRechargeApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"充值申请";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    NSArray *arr = [[NSArray alloc]initWithObjects:@"线下充值",@"线上充值", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:arr];
    segment.frame = CGRectMake(0,0,SCREEN_WIDTH,40);
    segment.backgroundColor = [UIColor colorWithHexString:@"#7894f2"];
    segment.tintColor = [UIColor whiteColor];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    

    
   // 创建控制器的对象
    _offlineVC = [[DLOfflineRechargeViewController alloc] init];
    _offlineVC.view.backgroundColor = [UIColor redColor];
    _onlineVC = [[DLOnlineRechargeViewController alloc] init];
    _onlineVC.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_offlineVC.view];

}

-(void)segmentClick:(UISegmentedControl *)segment{
    
    switch (segment.selectedSegmentIndex) {
        case 0:
            //第一个界面
            [self.view addSubview:_offlineVC.view];
            [_onlineVC.view removeFromSuperview];
            break;
        case 1:
            [self.view addSubview:_onlineVC.view];
            [_offlineVC.view removeFromSuperview];
            
            
            break;
            
        default:
            break;
    }
}
    

@end
