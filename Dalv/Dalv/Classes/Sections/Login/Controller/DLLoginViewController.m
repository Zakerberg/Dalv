//
//  DLLoginViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLoginViewController.h"
#import "DLLoginView.h"
#import "DLMineViewController.h"
#import "DLRegisterAlertView.h"
#import "DLHttpRequest.h"
#import "DLChoseViewController.h"

@interface DLLoginViewController ()<DLLoginViewDelegate>
@property (nonatomic,strong)DLRegisterAlertView *registerAlertView;
@end

@implementation DLLoginViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self configureSubViews];
    
}

#pragma mark - Setup navbar
- (void)setupNavbar {
    self.title = @"登陆";
}

#pragma mark - configureSubViews
- (void)configureSubViews{
    DLLoginView *loginView = [[DLLoginView alloc] init];
    loginView.delegate = self;
    self.view = loginView;
    
    UIBarButtonItem *registerbutton= [UIBarButtonItem itemWithTitle:@"注册" target:self action:@selector(didRegisterButton)];
    self.navigationItem.rightBarButtonItem = registerbutton;
}

- (void)loginBtnClickDelegateWithUsename:(NSString *)usename Password:(NSString *)password{
    
    
    [DLRequestSerVice POST:DL_Login param:usename
                   success:^(id responseData) {

                   } failure:^(NSError *error) {
        
    }];
    
    
    
    
    
}




//注册
- (void)didRegisterButton
{
    DLChoseViewController *choseVC= [[DLChoseViewController alloc] init];
    [self.navigationController pushViewController:choseVC animated:YES];
    
    
}








#pragma mark - Fetch data

- (void)fetchData {
    
}

@end
