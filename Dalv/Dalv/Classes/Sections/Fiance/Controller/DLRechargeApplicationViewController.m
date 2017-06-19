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

@interface DLRechargeApplicationViewController () {
 
}

@property (nonatomic, strong) DLOfflineRechargeViewController *offlineVC;

@property (nonatomic, strong) DLOnlineRechargeViewController *onlineVC;

@end

@implementation DLRechargeApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
 
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
    self.view.backgroundColor = [UIColor whiteColor];
    
    _offlineVC = [[DLOfflineRechargeViewController alloc] init];
    _offlineVC.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:_offlineVC.view];
    [self addChildViewController:_offlineVC];
    
    _onlineVC = [[DLOnlineRechargeViewController alloc] init];
    _onlineVC.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_onlineVC.view];
    [self addChildViewController:_onlineVC];
    _onlineVC.view.hidden = YES;
    
    NSArray *arr = [[NSArray alloc]initWithObjects:@"线下充值",@"在线充值", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:arr];
    segment.frame = CGRectMake(0,0,SCREEN_WIDTH,40);
    segment.tintColor = [UIColor colorWithHexString:@"#7894f2"];
    segment.selectedSegmentIndex = 0;
    segment.layer.cornerRadius = 0;
    segment.layer.borderWidth = 1.0;
    segment.layer.masksToBounds = YES;
    segment.layer.borderColor = segment.tintColor.CGColor;
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16],
                                 NSForegroundColorAttributeName : segment.tintColor};
    [segment setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];

}

- (void)setupConstraints {
    [self.onlineVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [self.offlineVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.onlineVC.view);
    }];

}
- (void)segmentClick:(UISegmentedControl *)segment {
    
    switch (segment.selectedSegmentIndex) {
        case 0:
            _onlineVC.view.hidden = YES;
            _offlineVC.view.hidden = NO;
            break;
        case 1:
            _onlineVC.view.hidden = NO;
            _offlineVC.view.hidden = YES;
            break;
            
        default:
            break;
    }
}
    

@end
