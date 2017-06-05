//
//  DLGeneralController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//


#import "DLGeneralController.h"
#import <SDWebImage/SDImageCache.h>
#import <MBProgressHUD.h>
#import <SVProgressHUD.h>
#import "BLMClearCacheTool.h"
#import "DLLoginViewController.h"
#import "DLFeedBackController.h"

static NSString *cellID  = @"cellID";
@interface DLGeneralController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UIButton *logOutBtn;
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
    self.title = @"通用设置";
    [self setupLogoutBtn];
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}






-(void)setupUI {
    
  self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.automaticallyAdjustsScrollViewInsets = NO;
    

}


-(void)setupLogoutBtn {
        
        
        /*
         
         UIButton *footBtn =[UIButton buttonWithType:UIButtonTypeCustom];
         footBtn.frame=CGRectMake(self.passwordTextField.x, self.passwordTextField.bottom+30, self.passwordTextField.width, 40);
         [footBtn setTitle:@"登录" forState:UIControlStateNormal];
         footBtn.backgroundColor = [UIColor colorWithHexString:@"#536bf8"];
         [footBtn  addTarget:self action:@selector(performLoginAction) forControlEvents:UIControlEventTouchUpInside];
         footBtn.layer.cornerRadius = 8.0;
         [self addSubview:footBtn];
         
         
         */
        
        
        
    UIButton *logOutBtn = [[UIButton alloc]init];
        self.logOutBtn = logOutBtn;
        logOutBtn.frame = CGRectMake(0, 44*3+9, MAIN_SCREEN_WIDTH, 44);
        [logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
 
        logOutBtn.tintColor = [UIColor colorWithHexString:@"#fe603b"];
            logOutBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        logOutBtn.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:logOutBtn];
    
}

- (void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}


/* 退出登录 */
-(void)LogoutBtnClick {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定退出登录吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    //清空所用注册信息 
//        DLLoginViewController *loginVC = [[DLLoginViewController alloc] init];
        
        self.tabBarController.selectedIndex = 0;
//        [self.navigationController pushViewController:loginVC animated:YES];
        
        
    }];
                             
    UIAlertAction *actionCancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:actionOk];
    [alert addAction:actionCancle];
    
    //显示弹框控制器
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark  ----------UITable View Delegate------------

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
        return 0.1;
}


//选中某一行cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
        if (indexPath.row == 0) {
            DLFeedBackController *feedbackVC = [[DLFeedBackController alloc] init];
            [self.navigationController pushViewController:feedbackVC animated:YES];
        }
        if (indexPath.row == 1) {
            //关于大旅游
        }
        if (indexPath.row == 2) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定清除缓存吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            
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
            
            //显示弹框控制器
            [self presentViewController:alert animated:YES completion:nil];
        }
    
}


#pragma mark ------------ Tableview data source -----------
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拿到每一组每一行的模型
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"意见反馈";
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"关于大旅";
        }
        if (indexPath.row == 2) {
            
            NSString *fileSize = [BLMClearCacheTool getCacheSizeWithFilePath:BLMfilePath];
            cell.textLabel.text = [NSString stringWithFormat:@"清除缓存                                          %@",fileSize];
        }
    
//        if (indexPath.section == 1) {
//            
//            UIButton *logOutBtn = [[UIButton alloc] init];
//            self.logOutBtn = logOutBtn;
//            [logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
//            logOutBtn.tintColor = [UIColor colorWithHexString:@"#fe603b"];
//            logOutBtn.contentVerticalAlignment = 0;
//            logOutBtn.contentHorizontalAlignment = 0;
//            [self.tableView addSubview:logOutBtn];
//            [logOutBtn addTarget:self action:@selector(LogoutBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        }
    }

    return cell;
}


@end
