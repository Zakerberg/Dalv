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
#import "DLHttpRequest.h"
#import "DLChoseViewController.h"

@interface DLLoginViewController ()<DLLoginViewDelegate>

@end

/*
 
 测试登陆接口地址：
 http://dalvuapi.dalvu.com/index.php/Api/login/agencyIndex
 请求方式：POST
 请求参数：{login_name : 13126997216 ,login_pwd : 123456}
 返回数据：
 */
 
 
 


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

- (BOOL)dl_blueNavbar {
    return YES;
    
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

                       NSLog(@"登录成功!%@",responseData);
                       [self.navigationController popViewControllerAnimated:YES];
                       //在这给单例类赋值
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
