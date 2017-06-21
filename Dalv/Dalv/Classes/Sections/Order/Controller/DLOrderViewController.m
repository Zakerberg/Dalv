//
//  DLOrderViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLOrderViewController.h"
#import "DLLineOrderController.h"
#import "DLVisaOrderController.h"
#import "DLTicketsOrderController.h"
#import "DLWiFiOrderViewController.h"
#import "DLHeadScrollView.h"
#import <SVProgressHUD.h>

@interface DLOrderViewController ()<UIScrollViewDelegate,seletedControllerDelegate>

/* 线路 签证 wifi 门票 */
@property (nonatomic ,strong) DLLineOrderController *lineVC;
@property (nonatomic ,strong) DLVisaOrderController *visaVC;
@property (nonatomic ,strong) DLWiFiOrderViewController *wifiVC;
@property (nonatomic ,strong) DLTicketsOrderController *ticketVC;

@property (nonatomic ,strong) DLHeadScrollView *headScrollView;
@property (nonatomic ,strong) UIViewController *currentVC;
@property (nonatomic ,strong) UIScrollView *mainScrollView;
@end

@implementation DLOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI {

    self.title = @"订单";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
    
    self.headScrollView = [[DLHeadScrollView alloc]init];
    self.headScrollView.seletedDelegate = self;
    self.headScrollView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 48);
    self.headScrollView.showsVerticalScrollIndicator = NO;
    self.headScrollView.showsHorizontalScrollIndicator = NO;
    
    
    [self.view addSubview:self.headScrollView];
    
    self.mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 57, MAIN_SCREEN_WIDTH,MAIN_SCREEN_HEIGHT- 64- 49 - 48)];
    
    self.mainScrollView.delegate = self;
    self.mainScrollView.contentSize = CGSizeMake(MAIN_SCREEN_WIDTH*self.headScrollView.headArray.count, 0);
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainScrollView];
    
    self.lineVC = [[DLLineOrderController alloc] init];
    [self addChildViewController:self.lineVC];
    
    self.lineVC.view.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT - 64);
    [self.mainScrollView addSubview:self.lineVC.view];

}


#pragma mark  ----------   UIScrollViewDelegate  ------------

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x==MAIN_SCREEN_WIDTH) {
        if (self.visaVC == nil) {
            self.visaVC = [[DLVisaOrderController alloc]init];
            [self addChildViewController:self.visaVC];
            self.visaVC.view.frame = CGRectMake(MAIN_SCREEN_WIDTH, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT - 64);
            [self.mainScrollView addSubview:self.visaVC.view];
        }
        
    }else if(scrollView.contentOffset.x==MAIN_SCREEN_WIDTH*2){
        if (self.wifiVC ==nil) {
            self.wifiVC = [[DLWiFiOrderViewController alloc]init];
            [self addChildViewController:self.wifiVC];
            self.wifiVC.view.frame = CGRectMake(MAIN_SCREEN_WIDTH*2, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT - 64);
            [self.mainScrollView addSubview:self.wifiVC.view];
        }
        
        
    }else if(scrollView.contentOffset.x==MAIN_SCREEN_WIDTH*3){
        if (self.ticketVC ==nil) {
            self.ticketVC = [[DLTicketsOrderController alloc]init];
            [self addChildViewController:self.ticketVC];
            self.ticketVC.view.frame = CGRectMake(MAIN_SCREEN_WIDTH*3, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT - 64);
            [self.mainScrollView addSubview:self.ticketVC.view];
        }
    }
    
//    NSLog(@"%f",scrollView.contentOffset.x);
    
    [self.headScrollView changeBtnTitleColorWith:scrollView.contentOffset.x/MAIN_SCREEN_WIDTH+100];
}

#pragma mark  ------  seletedControllerDelegate  ------------

-(void)seletedControllerWith:(UIButton *)btn{
    
    self.mainScrollView.contentOffset = CGPointMake(MAIN_SCREEN_WIDTH*(btn.tag - 100), 0);
}
@end










