//
//  DLMineCenterController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  -------------------  个人中心   -------------------

#import "DLPersonalChangeDataController.h"
#import "DLMyAgencyUnBindingController.h"
#import "DLMyCustomerXibController.h"
#import "DLMyCustomerController.h"
#import "DLMineCenterController.h"
#import "DLMyAgencyController.h"
#import "DLRemmendController.h"
#import "DLGeneralController.h"
#import "BLM_UploadUserIcon.h"
#import "UIButton+WebCache.h"
#import "DLHomeViewTask.h"
#import "DLUtils.h"

static NSString *cellID  = @"cellID";

@interface DLMineCenterController ()<BLM_UploadUserIconDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableDictionary *mineCenterDict;
@property (strong,nonatomic) UITableView* tableView;
@property(nonatomic,strong) UIButton * personBtn;
@property (strong,nonatomic) UILabel* nameLabel;
@property(nonatomic,strong) UIView *headerView;
@property (strong,nonatomic) UILabel* numLabel;
@property(nonatomic,strong) UILabel *label;
/* 绑定状态 */
@property(nonatomic,strong) NSString  *bindingStr;

@end

@implementation DLMineCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setupHeaderView];
    
    [self fetchData];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}
-(void)setTableView

{
    self.tableView.tableFooterView = [UIView new];
    UITableView*tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.showsVerticalScrollIndicator = NO ;
    tableView.tableFooterView = [UIView new];
    tableView.delegate = self ;
    tableView.dataSource = self ;
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

-(void)setupHeaderView{
    
    UIView *headerView = [[UIView alloc] init];
    self.tableView.tableHeaderView = headerView;
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(0);
        make.width.offset(0);
        make.height.offset(145);
    }];
    
    //设置头像按钮
    UIButton* personBtn = [[UIButton alloc]init];
    self.personBtn = personBtn;
    [personBtn setImage:[UIImage imageNamed:@"v2_my_avatar"] forState:UIControlStateNormal];
    [headerView addSubview:personBtn];
    
    [personBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.top.equalTo(@20);
        make.height.width.offset(66);
    }];
    
    [personBtn addTarget:self action:@selector(PersonbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    [nameLabel sizeToFit];
    nameLabel.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(16.0)];
    
    [headerView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(personBtn);
        make.top.equalTo(personBtn.mas_bottom).offset(7);
        make.height.offset(16);
        
    }];
    
    UILabel *numLabel = [[UILabel alloc] init];
    self.numLabel = numLabel;
    [nameLabel sizeToFit];
    
    [headerView addSubview:numLabel];
    
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(8);
        make.centerX.equalTo(personBtn);
        make.height.offset(12);
    }];
}

-(void)fetchData{
    
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            
                            @"sign_token" : [DLUtils getSign_token],
                            };
    
    if([[DLUtils getUser_type] isEqualToString:@"4"])
        
    {
        @weakify(self);
        [DLHomeViewTask getAgencyPersonal:param completion:^(id result, NSError *error) {
            @strongify(self);
            if (result) {
                self.mineCenterDict = [[NSMutableDictionary alloc] init];
                self.mineCenterDict = [result objectForKey:@"agencyInfo"];
                
                NSString *urlStr = self.mineCenterDict[@"head_pic"];
                
                [self.personBtn sd_setButtonImageWithUrl:urlStr];
                
                [self.personBtn.layer setMasksToBounds:YES];
                
                [self.personBtn.layer setCornerRadius:33];//设置矩形四个圆角半径
                
                self.personBtn.layer.borderWidth = 2.0;
                self.personBtn.layer.borderColor = [UIColor colorWithHexString:@"#7286fc"].CGColor;
                
                self.nameLabel.text = self.mineCenterDict[@"name"];
                self.numLabel.text = self.mineCenterDict[@"mobile"];
                
                [self.tableView reloadData];
            }
        }];
        
    }else{
        
        [DLHomeViewTask getTouristPersonalIndex:param completion:^(id result, NSError *error) {
            
            self.mineCenterDict = [[NSMutableDictionary alloc] init];
            self.mineCenterDict = result[@"touristInfo"];
            
            [self.personBtn.layer setMasksToBounds:YES];
            
            [self.personBtn.layer setCornerRadius:33];//设置矩形四个圆角半径
            self.personBtn.layer.borderWidth = 2.0;
            self.personBtn.layer.borderColor = [UIColor colorWithHexString:@"#7286fc"].CGColor;
            
            if ([self.mineCenterDict[@"name"] isEqualToString:@"0"]) {
                self.nameLabel.text = @"未设置";
            }else{
                self.nameLabel.text = self.mineCenterDict[@"name"];
            }
            
            self.numLabel.text = self.mineCenterDict[@"mobile"];
            
            [self.tableView reloadData];
            
        }];
    }
}

//头像按钮的点击事件
-(void)PersonbuttonClick{
    
    [UPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];
    
}


#pragma mark ------------  Table view Delegate --------------

//选中某一行cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /****   修改个人资料    ****/
    if (indexPath.row == 0){
        
        DLPersonalChangeDataController *changeDataVC = [[DLPersonalChangeDataController alloc] init];
        [self.navigationController pushViewController:changeDataVC animated:YES];
    }
    
    
    /***  我的直客  or 我的顾客 ***/
    if (indexPath.row == 1) {
        
        if([[DLUtils getUser_type] isEqualToString:@"4"]){
            
            DLMyCustomerXibController *myCustomerVC = [[DLMyCustomerXibController alloc] init];
            
            [self.navigationController pushViewController:myCustomerVC animated:YES];
            
        }else {
            
            if ([[DLUtils getUser_bingdingState] isEqualToString:@"0" ]) {
                
                DLMyAgencyUnBindingController *unBindingVC = [[DLMyAgencyUnBindingController alloc] init];
                
                [self.navigationController pushViewController:unBindingVC animated:YES];
            }else{
                
                DLMyAgencyController *myAgencyVC = [[DLMyAgencyController alloc] init];
                
                [self.navigationController pushViewController:myAgencyVC animated:YES];
            }
        }
    }
    
    /***  通用   ***/
    if (indexPath.row == 2) {
        DLGeneralController *genralVC = [[DLGeneralController alloc ] init];
        
        [self.navigationController pushViewController:genralVC animated:YES];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

//头部视图的间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 9;
}


#pragma mark    --------  BLM_UploadUserIconDelegate ------------

- (void)uploadImageToServerWithImage:(UIImage *)image {
    
    [self.personBtn setImage:image forState:UIControlStateNormal];
}


#pragma mark ------------  Table view data source --------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if(indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"modify_personal_data"];
        cell.textLabel.text = @"修改个人资料";
    }
    
    
    if(indexPath.row == 1){
        
        if([[DLUtils getUser_type] isEqualToString:@"4"]){
            cell.imageView.image = [UIImage imageNamed:@"my_direct_guest"];
            cell.textLabel.text = @"我的直客";
            
        }else{
            cell.imageView.image = [UIImage imageNamed:@"my_direct_guest"];
            cell.textLabel.text = @"我的顾问";
        }
    }
    
    
    if(indexPath.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"my_direct_guest"];
        cell.textLabel.text = @"通用";
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
