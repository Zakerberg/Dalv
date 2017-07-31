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
#import "DLRequestSerVice.h"
#import "DLTabBarController.h"

@interface DLLoginViewController ()<DLLoginViewDelegate>

@property (strong,nonatomic) UITextField *loginIdTextField;
@property (strong,nonatomic) UITextField *passwordTextField;

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
    self.title = @"旅游顾问登陆";
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

- (void)loginBtnClickDelegateWithUsename:(NSString *)usename Password:(NSString *)password {
    
    NSDictionary *param = @{@"login_name" : usename,
                            @"login_pwd" : password,};
    [DLHomeViewTask getLogin:param completion:^(id result, NSError *error) {
            if ([[result objectForKey:@"status"] isEqualToString:@"00000"]) {
                
                [self dismissViewControllerAnimated:YES completion:nil];
                [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"sign_token"] forKey:@"sign_token"];
                [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"uid"] forKey:@"uid"];
                [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"user_type"] forKey:@"user_type"];
                [[NSUserDefaults standardUserDefaults] setObject:@"binding_state" forKey:@"binding_state"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [[DLHUDManager sharedInstance] showTextOnly:[result objectForKey:@"msg"]];
                DLTabBarController *tabVC = [[DLTabBarController alloc] init];
                [UIApplication sharedApplication].keyWindow.rootViewController = tabVC;
                
                [[NSNotificationCenter defaultCenter] postNotificationName:kUserlogInNotification object:nil];
            }
                else {
                [[DLHUDManager sharedInstance]showTextOnly:[result objectForKey:@"msg"]];
            }
    }];
}


- (void)didRegisterButton {
    
    DLMineViewController *minVC= [[DLMineViewController alloc] init];
    [self.navigationController pushViewController:minVC animated:YES];
}

#pragma mark - Fetch data

- (void)fetchData {
    
}

@end
