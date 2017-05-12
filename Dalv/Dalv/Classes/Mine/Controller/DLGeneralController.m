//
//  DLGeneralController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//


#import "DLGeneralController.h"
#import "DLMineModel.h"
#import "DLMineCell.h"
#import <SDWebImage/SDImageCache.h>
#import <MBProgressHUD.h>
#import <SVProgressHUD.h>
#import "BLMClearCacheTool.h"

static NSString *cellID  = @"cellID";
#define filePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

@interface DLGeneralController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray * mineArrayData;

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
    
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.mineArrayData = [self loadingPlist]; //赋值加载数据
    
    [self.tableView registerClass:[DLMineCell class] forCellReuseIdentifier:cellID];
    
    self.tableView.tableFooterView = [UIView new];
    
}

-(void)setupUI{
    
  self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
 
    UIButton *LogoutButton = [[UIButton alloc] initWithFrame:CGRectMake(46, 309, 295, 30)];
    
    [LogoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [LogoutButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
    [LogoutButton addTarget:self action:@selector(LogoutBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:LogoutButton];
    
}

-(void)LogoutBtnClick {
    
    
    
    
    
    
    
    
}

//通过传进来的Plist文件。加载内容
- (NSArray *)loadingPlist
{
    
    NSArray * array  = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"MineGeneral.plist" withExtension:nil]];
    NSMutableArray * arrM = [[NSMutableArray alloc]init];
    for (NSArray* arr in array) {
        
        NSMutableArray * groupArr = [[NSMutableArray alloc]init];
        
        for (NSDictionary* dict in arr) {
            
            DLMineModel * model = [DLMineModel MineModelWithDict:dict];
            
            [groupArr addObject:model];
        }
        
        [arrM addObject:groupArr];
    }
    
    return arrM.copy;
}

//选中某一行cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 1){
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定清除缓存吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
        UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            //清除缓存
            BOOL isSuccess = [BLMClearCacheTool clearCacheWithFilePath:filePath];
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

- (void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - Tableview data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.mineArrayData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.mineArrayData[section] count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拿到每一组每一行的模型
    DLMineModel * mineModel = self.mineArrayData[indexPath.section][indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:mineModel.pic];
    cell.textLabel.text = mineModel.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 1) {
        NSString *fileSize = [BLMClearCacheTool getCacheSizeWithFilePath:filePath];
        
        cell.textLabel.text = [NSString stringWithFormat:@"清除缓存(%@)",fileSize];
    }
    
    return cell;
}


@end
