//
//  DLIdentitySelectionLoginViewController.m
//  Dalv
//
//  Created by Nie on 2017/6/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLIdentitySelectionLoginViewController.h"
#import "DLCustomerLoginController.h"
#import "DLLoginViewController.h"
@interface DLIdentitySelectionLoginViewController ()
@property (nonatomic,strong) UIButton *consultantBtn;//顾问登陆
@property (nonatomic,strong) UIButton *averageUserBtn;//普通用户

@end

@implementation DLIdentitySelectionLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"efefef"];

}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"选择身份登陆";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    
    UIImageView *loginImage = [[UIImageView alloc] init];
    loginImage.image = [UIImage imageNamed:@"Loginlogo"];
    [self.view addSubview:loginImage];
    
    _consultantBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [_consultantBtn setTitle:@"顾问登陆" forState:UIControlStateNormal];
    _consultantBtn.backgroundColor = [UIColor colorWithHexString:@"#536bf8"];
    [_consultantBtn  addTarget:self action:@selector(consultantSlectBtn) forControlEvents:UIControlEventTouchUpInside];
    _consultantBtn.layer.cornerRadius = 8.0;
    [self.view addSubview:_consultantBtn];
    
    
    _averageUserBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [_averageUserBtn setTitle:@"普通登陆" forState:UIControlStateNormal];
    _averageUserBtn.backgroundColor = [UIColor colorWithHexString:@"#536bf8"];
    [_averageUserBtn  addTarget:self action:@selector(averageUserSlectBtn) forControlEvents:UIControlEventTouchUpInside];
    _averageUserBtn.layer.cornerRadius = 8.0;
    [self.view addSubview:_averageUserBtn];
    
    
    [loginImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@50);
        make.left.equalTo(@100);
        make.right.equalTo(@-100);
        make.height.equalTo(@60);
    }];

    [_consultantBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginImage.mas_bottom).with.offset(50);;
        make.left.equalTo(@60);
        make.right.equalTo(@-60);
        make.height.equalTo(@80);
    }];
    
    [_averageUserBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_consultantBtn.mas_bottom).with.offset(50);
        make.left.equalTo(@60);
        make.right.equalTo(@-60);
        make.height.equalTo(@80);
    }];
}

#pragma mark - Event Handler
- (void)consultantSlectBtn{
    
    DLLoginViewController *loginVC= [[DLLoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
//    [self presentViewController:loginVC animated:YES completion:nil];
    
}

- (void)averageUserSlectBtn{

    DLCustomerLoginController *cusLoginVC = [[DLCustomerLoginController alloc ] init];
    
    [self.navigationController pushViewController:cusLoginVC animated:YES];
    
//    [[DLHUDManager sharedInstance] showTextOnly:@"正在拼命开发中...."];
   
}

@end
