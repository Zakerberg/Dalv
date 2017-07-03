//
//  DLGeneralController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------  通用   -----------------------


#import "DLIdentitySelectionLoginViewController.h"
#import <SDWebImage/SDImageCache.h>
#import "DLLoginViewController.h"
#import "DLFeedBackController.h"
#import "DLGeneralController.h"
#import "BLMClearCacheTool.h"
#import <MBProgressHUD.h>
#import <SVProgressHUD.h>

static NSString *cellID  = @"cellID";
@interface DLGeneralController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIButton *logOutBtn;
@property (nonatomic,strong) UITableView *tableview;

@end

@implementation DLGeneralController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupUI];
    [self setupLogoutBtn];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setupUI {
    
    self.title = @"通用设置";
    UITableView *tableView = [[UITableView alloc]  initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView = tableView;
    
    tableView.tableFooterView = [UIView new];
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.automaticallyAdjustsScrollViewInsets = NO;
}


-(void)setupLogoutBtn {
    
    UIButton *logOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.logOutBtn = logOutBtn;
    [logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    logOutBtn.backgroundColor = [UIColor redColor];
    [logOutBtn addTarget:self action:@selector(LogoutBtnClick) forControlEvents:UIControlEventTouchUpInside];
    logOutBtn.layer.cornerRadius = 8.0;
    [self.tableView addSubview:logOutBtn];
    
    
    [logOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.height.offset(44);
        make.top.offset(45*3+33);
        make.width.offset(MAIN_SCREEN_WIDTH- 30);
    }];
}

- (void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}


/* 退出登录 */
-(void)LogoutBtnClick {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"退出后您需要重新登录,是否确定?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        //清空所用注册信息
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"sign_token"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"uid"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"user_type"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kUserlogoutNotification object:nil];
        //self.tabBarController.selectedIndex = 0;
        DLIdentitySelectionLoginViewController *VC = [[DLIdentitySelectionLoginViewController alloc] init];
        [self presentViewController:VC animated:YES completion:nil];
        
    }];
    
    UIAlertAction *actionCancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:actionOk];
    [alert addAction:actionCancle];
    
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark  ----------UITable View Delegate------------

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
     if (indexPath.row == 0) {
         
     DLFeedBackController *feedbackVC = [[DLFeedBackController alloc] init];
     [self.navigationController pushViewController:feedbackVC animated:YES];
     }
     
    if (indexPath.row == 1) {
        //联系我们
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"85625636"];
        //NSLog(@"str======%@",str);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
    }
    if (indexPath.row == 2) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您确定清除缓存吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            //清除缓存
            BOOL isSuccess = [BLMClearCacheTool clearCacheWithFilePath:BLMfilePath];
            if (isSuccess) {
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
                [SVProgressHUD showSuccessWithStatus:@"清除成功"];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                });
            }
        }];
        
        UIAlertAction *actionCancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:actionOk];
        [alert addAction:actionCancle];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    
    if (indexPath.section == 0) {
        
        
         if (indexPath.row == 0) {
         cell.textLabel.text = @"意见反馈";
         }
        
        if (indexPath.row == 1) {
            cell.textLabel.text = @"联系我们";
            
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        if (indexPath.row == 2) {
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"清除缓存";
            
             NSString *fileSize = [BLMClearCacheTool getCacheSizeWithFilePath:BLMfilePath];
             
             UILabel *cacheLabel = [[UILabel alloc] init];
             
             cacheLabel.font = [UIFont systemFontOfSize:15];
             cacheLabel.text = [NSString stringWithFormat:@"%@",fileSize];
             [cacheLabel sizeToFit];
             [cell.contentView addSubview:cacheLabel];
             
             [cacheLabel mas_makeConstraints:^(MASConstraintMaker *make) {
             
                 make.centerY.offset(0);
                 make.height.offset(15);
                 make.right.offset(-20);
             }];
        }
    }
    
    return cell;
}


@end
