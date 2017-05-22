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

@interface DLLoginViewController ()<DLLoginViewDelegate>
@property (nonatomic,strong)DLRegisterAlertView *registerAlertView;
@end

@implementation DLLoginViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self configureSubViews];
    [self fetchData];
    [self showRegisterAlertView];

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
    
    //    [[DLHUDManager sharedInstance] showProgressWithText:@"登录中"];
    //    [DLHttpManager loginWithUsename:usename Password:password Completion:^(id responseData) {
    //        [[DLHUDManager sharedInstance] hiddenHUD];
    //        if ([[responseData objectForKey:DL_ResponseCode] isEqualToString:DL_Response_SuccsessCode]) {
    //            [[DLHUDManager sharedInstance] showTextOnly:responseData[@"resp_msg"]];
    //
    //            [[NSUserDefaults standardUserDefaults] setObject:responseData[@"mer_code"] forKey:@"mer_code"];
    //            [[NSUserDefaults standardUserDefaults] setObject:responseData[@"token"] forKey:@"token"];
    //            [[NSUserDefaults standardUserDefaults] setObject:responseData[@"signature_key"] forKey:@"signature_key"];
    //            [[NSUserDefaults standardUserDefaults] synchronize];
    //            // 登录成功 请求商户详情保存到本地
    //            [self getMerInfo];
    //
    //        } else {
    //            [[DLHUDManager sharedInstance] showTextOnly:responseData[@"resp_msg"]];
    //        }
    //
    //    } failure:^(NSError *error) {
    //
    //        [[DLHUDManager sharedInstance]hiddenHUD];
    //        [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
    //
    //    }];
}

//- (void)getMerInfo{
//
//    [DLHttpManager getMerinfoCompletion:^(id responseData) {
//
//        DLUserModel *userModel = [[DLUserModel alloc]initWithDictionary:[responseData objectForKey:@"data"]];
//        NSString *path = [DLFileLocationManager getUserDirectory];
//        NSString *filePath = [path stringByAppendingPathComponent:@"merInfo.data"];
//        NSMutableArray *merInfoList = [[NSMutableArray alloc]init];
//        [merInfoList addObject:userModel];
//        // 归档
//        [NSKeyedArchiver archiveRootObject: merInfoList toFile:filePath];
//        BOOL flag =  [NSKeyedArchiver archiveRootObject: merInfoList toFile:filePath];
//        NSLog(@"是否归档成功  %@",flag? @"YES":@"NO");
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//            delegate.window.rootViewController = [[TabBarController alloc]init];
//        });
//
//    } failure:^(NSError *error) {
//
//    }];
//}


//注册
- (void)didRegisterButton
{
    
}


- (void)showRegisterAlertView {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    self.registerAlertView = [[[NSBundle mainBundle] loadNibNamed:@"RegisterAlertView" owner:self options:nil] firstObject];
    self.registerAlertView.frame = self.view.bounds;
    [window addSubview:self.registerAlertView];
    //alert中普通用户和供应商两个按钮的点击事件block
    __weak DLLoginViewController *weakVC = self;
    self.registerAlertView.toRegisterVCStr = ^(NSString *toRegisterVCStr){
        if ([toRegisterVCStr isEqualToString:@"generalVC"]) {
            //跳转到普通用户注册
//            UINavigationController *resister = [weakVC.storyboard instantiateViewControllerWithIdentifier:@"DLMineViewController"];
  
            DLLoginViewController *loginVC = [[DLLoginViewController alloc] init];
            
            
            [weakVC presentViewController:loginVC animated:YES completion:nil];
            
        }
        if ([toRegisterVCStr isEqualToString:@"supplierVC"]) {
            //跳转到供应商注册
//            UINavigationController *registerNav = [weakVC.storyboard instantiateViewControllerWithIdentifier:@"registerDelegateNavigationController"];
//            [weakVC presentViewController:registerNav animated:YES completion:nil];
            
        }
    };
    
}






#pragma mark - Fetch data

- (void)fetchData {
    
}

@end
