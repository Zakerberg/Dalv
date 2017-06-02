//
//  DLMineCenterController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//DL_AgencyPersonal

#import "DLMineCenterController.h"
#import "DLMineModel.h"
#import "DLMineCell.h"
#import <Masonry.h>
#import "DLGeneralController.h"
#import "BLM_UploadUserIcon.h"
#import "DLChangePersonDataController.h"
#import "DLSortController.h"
#import "DLRemmendController.h"
#import "DLMyCustomerController.h"
#import "DLLineQueryController.h"
#import "DLSupplierqueryController.h"
#import <AVFoundation/AVFoundation.h>

static NSString *cellID  = @"cellID";

#define KscreenWidth  [UIScreen mainScreen].bounds.size.width   //设备屏幕的宽度
#define KscreenHeight [UIScreen mainScreen].bounds.size.height //设备屏幕的高度
@interface DLMineCenterController ()<BLM_UploadUserIconDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *headerView;  //headerView属性
@property(nonatomic,strong)UIImageView * picImg; //背景图
@property(nonatomic,strong)UIButton * personBtn;
@property(nonatomic,strong)UILabel *label;
@property (strong,nonatomic) NSArray* cellTiltleArr ;
@property (strong,nonatomic) UITableView* tableView ;
@end

@implementation DLMineCenterController

-(NSArray*)cellTiltleArr
{
    if (!_cellTiltleArr) {
        
        _cellTiltleArr = @[@"修改个人资料",@"我的直客",@"通用" ];
    }
    
    return _cellTiltleArr ;
}


-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO ;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:_tableView];
    }
    
    return _tableView ;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    

    
     //赋值加载数据
    
    [self setupHeaderView];
    
    [self.tableView registerClass:[DLMineCell class] forCellReuseIdentifier:cellID];
    
    self.tableView.tableFooterView = [UIView new];
    
    [self fetchData];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}

-(void)setupHeaderView{
    //头部视图View
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, KscreenWidth, 160);
    self.tableView.tableHeaderView = headerView;
    self.headerView = headerView;
    
    
    //背景图
    UIImageView * picImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mine_theme@2x"]];
    self.picImg = picImg;
    picImg.userInteractionEnabled = YES;
    [headerView addSubview:picImg];
    
    [picImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(headerView).offset(0);
        make.height.offset(150);
    }];
    
    //设置头像按钮
    self.personBtn = [[UIButton alloc]init];
    [self.personBtn setImage:[UIImage imageNamed:@"v2_my_avatar"] forState:UIControlStateNormal];
    [picImg addSubview:self.personBtn];
    
    [self.personBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(picImg);
        make.width.height.offset(67);
    }];
    
    [_personBtn.layer setCornerRadius:67/2];//设置矩形四个圆角半径
    [_personBtn.layer setMasksToBounds:YES];
    
    [self.personBtn addTarget:self action:@selector(PersonbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

//头像按钮的点击事件
-(void)PersonbuttonClick{
    
    [UPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];
    
    
}

#pragma mark - 代理方法
- (void)uploadImageToServerWithImage:(UIImage *)image {
    
    [self.personBtn setImage:image forState:UIControlStateNormal];
    
}


//选中某一行cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /****   修改个人资料    ****/
    if (indexPath.row == 0){
        
        DLChangePersonDataController *chageDataVC = [[DLChangePersonDataController alloc] init];
        
        [self.navigationController pushViewController:chageDataVC animated:YES];
        
    }
    
    /***  我的直客   ***/
    if (indexPath.row == 1) {
        
        DLMyCustomerController* CustomerVC = [[DLMyCustomerController alloc]init];
        
        [self.navigationController pushViewController:CustomerVC animated:YES];
   
        
        NSLog(@"我的直客");
    }
    
    /***  通用   ***/
    if (indexPath.row == 2) {
        
        NSLog(@"通用");
        
        DLGeneralController *genralVC = [[DLGeneralController alloc ] init];
        
        [self.navigationController pushViewController:genralVC animated:YES];
    }

}

//创建label的封装
- (UILabel *)makeLabelWithText:(NSString *)text andTextFont:(CGFloat)font andTextColor:(UIColor *)color {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    
    return label;
}

//头部视图的间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 9;
}
//设置
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cellTiltleArr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if(indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"modify_personal_data"];
        cell.textLabel.text = @"修改个人资料";
    }
    if(indexPath.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"my_direct_guest"];
        cell.textLabel.text = @"我的直客";
    }
    
    if(indexPath.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"my_direct_guest"];
        cell.textLabel.text = @"通用";
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


-(void)fetchData{
    
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}

@end
