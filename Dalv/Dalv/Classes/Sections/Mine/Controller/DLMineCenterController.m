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
@interface DLMineCenterController ()<BLM_UploadUserIconDelegate>
@property(nonatomic,strong)NSArray * mineArrayData;
@property(nonatomic,strong)UIView *headerView;  //headerView属性
@property(nonatomic,strong)UIImageView * picImg; //背景图
@property(nonatomic,strong)UIButton * personBtn;
@property(nonatomic,strong)UILabel *label;

@end

@implementation DLMineCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.mineArrayData = [self loadingPlist];  //赋值加载数据

    [self setupHeaderView];
    
    [self.tableView registerClass:[DLMineCell class] forCellReuseIdentifier:cellID];
    
    self.tableView.tableFooterView = [UIView new];

    [self fetchData];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}

- (void)setupHeaderView
{
    //头部视图View
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, KscreenWidth, 160);
    self.tableView.tableHeaderView = headerView;
    self.headerView = headerView;
    
    
    //背景图
    UIImageView * picImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_my_avatar_bg"]];
    self.picImg = picImg;
    picImg.userInteractionEnabled = YES;
    [headerView addSubview:picImg];
    
    [picImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(headerView).offset(0);
        make.height.offset(150);
    }];
    
    
//    UIImageView *iamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(137, 41, 81, 75)];
//    iamgeView.image = [UIImage imageNamed:@"v2_my_avatar"];
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:iamgeView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:iamgeView.bounds.size];
//    
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    
//    
//    maskLayer.frame = iamgeView.bounds;
//    //设置图形样子
//    maskLayer.path = maskPath.CGPath;
//    iamgeView.layer.mask = maskLayer;
//    [self.view addSubview:iamgeView];
////
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
    
    /*--------------------------------------------------------------------*/
    [self.personBtn addTarget:self action:@selector(PersonbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
//    self.label = [[UILabel alloc] init];
//    self.label.text = @"13899998888";
//    self.label.width = 150;
//    [picImg addSubview:self.label];
//    [self.label sizeToFit];
//    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.personBtn).offset(8);
//    }];
    
    
}

//头像按钮的点击事件
-(void)PersonbuttonClick{
    
    [UPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];
    
    
}

#pragma mark - 代理方法
- (void)uploadImageToServerWithImage:(UIImage *)image {
    
    [self.personBtn setImage:image forState:UIControlStateNormal];
    
}




//通过传进来的Plist文件。加载内容
- (NSArray *)loadingPlist
{
    NSArray * array  = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"DLMine.plist" withExtension:nil]];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    /****   修改个人资料    ****/
    if (indexPath.section == 0){
        
        DLChangePersonDataController *chageDataVC = [[DLChangePersonDataController alloc] init];
        
        [self.navigationController pushViewController:chageDataVC animated:YES];
        
    }

    /*****  模块排序    *****/
//    if (indexPath.section == 1) {
//        NSLog(@"模块排序");
//    }
    
    /***  我的推荐   ***/
    if (indexPath.section == 1) {
       
        DLRemmendController *remmendVC = [[DLRemmendController alloc] init];
        [self.navigationController pushViewController:remmendVC animated:YES];
        
        NSLog(@"我的推荐");
    }
    
    /***  我的直客   ***/
    if (indexPath.section == 2) {
        
        DLMyCustomerController* CustomerVC = [[DLMyCustomerController alloc]init];
        
        [self.navigationController pushViewController:CustomerVC animated:YES];
    }
    
    /***  线路查询   ***/
    if (indexPath.section == 3) {
        
        DLLineQueryController * linequery = [[DLLineQueryController alloc]init];
        
        [self.navigationController pushViewController:linequery animated:YES ];
    }
    
    /**** 供应商查询   ****/
    if (indexPath.section == 4) {
        NSLog(@"供应商查询");
        
        DLSupplierqueryController *sipplierVC = [[DLSupplierqueryController alloc] init];
//         sipplierVC.hidesBottomBarWhenPushed = YES;//隐藏 tabBar
    
        [self.navigationController pushViewController:sipplierVC animated:YES];
    }
    
    /***  通用   ***/
    if (indexPath.section == 5) {
        
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
//设置
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


#pragma mark - Table view data source
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
    
    return cell;
}



-(void)fetchData{
    
//    [LORequestManger GET:[NSString stringWithFormat:kMoreWonderfulStory, self.everydayArr.count] success:^(id response) {
//        
//        NSDictionary *dict = (NSDictionary *)response;
//        for (NSDictionary *data in dict[@"data"][@"hot_spot_list"]) {
//                EveryDayModel *model = [EveryDayModel shareJsonWithDictionary:data];
//                [self.everydayArr addObject:model];
//                UserInfo *userInfo = [UserInfo shareJasonWithDictionary:model.user];
//                [self.userinfoArr addObject:userInfo];
//        }
//        [self.collectionView reloadData];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//   
//    }];
    
    
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}





@end
