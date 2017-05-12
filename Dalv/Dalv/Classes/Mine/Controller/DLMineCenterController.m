//
//  DLMineCenterController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMineCenterController.h"
#import "DLMineModel.h"
#import "DLMineCell.h"
#import <Masonry.h>
#import "DLGeneralController.h"
#import "BLM_UploadUserIcon.h"

static NSString *cellID  = @"cellID";

#define KscreenWidth  [UIScreen mainScreen].bounds.size.width   //设备屏幕的宽度
#define KscreenHeight [UIScreen mainScreen].bounds.size.height //设备屏幕的高度
@interface DLMineCenterController ()<BLM_UploadUserIconDelegate>
@property(nonatomic,strong)NSArray * mineArrayData;
@property(nonatomic,strong)UIView *headerView;  //headerView属性
@property(nonatomic,strong)UIImageView * picImg; //背景图

@end

@implementation DLMineCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.mineArrayData = [self loadingPlist];  //赋值加载数据

    [self setupHeaderView];
    
    [self.tableView registerClass:[DLMineCell class] forCellReuseIdentifier:cellID];
    
    self.tableView.tableFooterView = [UIView new];

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
    
    //设置头像按钮
    UIButton * personBtn = [[UIButton alloc]init];
    [personBtn setImage:[UIImage imageNamed:@"v2_my_avatar"] forState:UIControlStateNormal];
    [picImg addSubview:personBtn];
    
    [personBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(picImg);
        make.width.height.offset(67);
    }];
    
    [personBtn addTarget:self action:@selector(PersonbuttonClick) forControlEvents:UIControlEventTouchUpInside];
}

//头像按钮的点击事件
-(void)PersonbuttonClick{
    
    
    [UPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];
    
//   ----------------------------------------------------------------------
    
    
    
}

#pragma mark - 代理方法
- (void)uploadImageToServerWithImage:(UIImage *)image {
   
    //
    
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
        
        NSLog(@"修改个人资料");
    }

    /*****  模块排序    *****/
    if (indexPath.section == 1) {
        NSLog(@"模块排序");
    }
    
    /***  我的推荐   ***/
    if (indexPath.section == 2) {
       
        NSLog(@"我的推荐");
    }
    
    /***  我的直客   ***/
    if (indexPath.section == 3) {
        NSLog(@"我的直客");
    }
    
    /***  线路查询   ***/
    if (indexPath.section == 4) {
        NSLog(@"线路查询");
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
    // 设置字体大小
    label.font = [UIFont systemFontOfSize:font];
    // 设置文字颜色
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




@end
