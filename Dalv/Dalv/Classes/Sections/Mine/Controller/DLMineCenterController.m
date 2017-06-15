//
//  DLMineCenterController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  -------------------  个人中心   -------------------

#import "DLMineCenterController.h"
//#import "DLMineModel.h"
#import "DLGeneralController.h"
#import "BLM_UploadUserIcon.h"
#import "DLChangePersonDataController.h"
//#import "DLSortController.h"
#import "DLRemmendController.h"
#import "DLMyCustomerController.h"
//#import "DLLineQueryController.h"
//#import "DLSupplierqueryController.h"
#import "DLHomeViewTask.h"
#import "DLManager.h"
#import "DLMyCustomerXibController.h"

static NSString *cellID  = @"cellID";

@interface DLMineCenterController ()<BLM_UploadUserIconDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIView *headerView;
//@property(nonatomic,strong) UIImageView * picImg; //背景图
@property(nonatomic,strong) UIButton * personBtn;
@property(nonatomic,strong) UILabel *label;
@property (strong,nonatomic) NSArray* cellTiltleArr ;

@property (strong,nonatomic) UITableView* tableView ;
@property (strong,nonatomic) UILabel* numLabel;
@property (strong,nonatomic) UILabel* nameLabel;


@property (nonatomic,strong) NSMutableDictionary *mineCenterDict;

@end

@implementation DLMineCenterController

-(NSArray*)cellTiltleArr
{
    if (!_cellTiltleArr) {
        _cellTiltleArr = @[@"修改个人资料",@"我的直客",@"通用" ];
    }
    return _cellTiltleArr ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setupHeaderView];
    
    [self fetchData];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
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
    //头部视图View
    UIView *headerView = [[UIView alloc] init];
//    headerView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 145);
    self.tableView.tableHeaderView = headerView;
    headerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:headerView];
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(0);
        make.width.offset(0);
        make.height.offset(145);
    }];

//    //背景图
//    UIImageView * picImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_theme@2x"]];
//    
//    self.picImg = picImg;
//    picImg.userInteractionEnabled = YES;
//    [headerView addSubview:picImg];
//    
//    [picImg mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.edges.equalTo(self.headerView);
//    }];
    
    //设置头像按钮
    UIButton* personBtn = [[UIButton alloc]init];
    self.personBtn = personBtn;
    [personBtn setImage:[UIImage imageNamed:@"v2_my_avatar"] forState:UIControlStateNormal];
    [headerView addSubview:personBtn];
    
    [personBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.width.height.offset(66);
        make.top.offset(13);
    }];
    
    [personBtn.layer setCornerRadius:33];//设置矩形四个圆角半径
    [personBtn.layer setMasksToBounds:YES];
    
    [personBtn addTarget:self action:@selector(PersonbuttonClick) forControlEvents:UIControlEventTouchUpInside];

    
//    UIImageView *headImageV = [[UIImageView alloc] init];
//    self.headerView = headerView;
//    
//    
//   UILabel *nameLabel = [[UILabel alloc] init];
//    self.nameLabel = nameLabel;
//    nameLabel.text = @"李元芳";
//    nameLabel.textColor = [UIColor colorWithHexString:@"#4b4b4b"];
//    nameLabel.font = [UIFont boldSystemFontOfSize:17.0];
//    nameLabel.textAlignment = NSTextAlignmentCenter;
//    [self.picImg addSubview:nameLabel];
//    
//    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.personBtn.mas_bottom).offset(10);
//        make.centerX.equalTo(self.personBtn);
//        make.width.offset(230);
//    }];
//    
//    self.numLabel = [[UILabel alloc] init];
//    self.numLabel.text = @"13898887888";
//    self.numLabel.textColor = [UIColor colorWithHexString:@"#6e6e6e"];
//    self.nameLabel.font = [UIFont systemFontOfSize:13];
//    [self.picImg addSubview:self.numLabel];
//    
//    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
//        make.height.offset(12);
//        make.centerX.centerY.equalTo(personBtn);
//    }];
}


-(void)fetchData{
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    @weakify(self);
    [DLHomeViewTask getAgencyFinance:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            self.mineCenterDict = [[NSMutableDictionary alloc] init];
            self.mineCenterDict = [result objectForKey:@"agencyInfo"];
            [self.tableView reloadData];

            
        }else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}

- (BOOL)dl_blueNavbar {
    return YES;
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
        
        DLChangePersonDataController *chageDataVC = [[DLChangePersonDataController alloc] init];
        
        [self.navigationController pushViewController:chageDataVC animated:YES];
    }
    
    /***  我的直客   ***/
    if (indexPath.row == 1) {
        
//        DLMyCustomerController* CustomerVC = [[DLMyCustomerController alloc]init];
//        
//        [self.navigationController pushViewController:CustomerVC animated:YES];
        
        DLMyCustomerXibController *myCustomerVC = [[DLMyCustomerXibController alloc] init];
        
        [self.navigationController pushViewController:myCustomerVC animated:YES];
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

@end
