//
//  DLContractApplyController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplyController.h"
#import "DLContractApplyViewCell.h"
#import "DLCourierController.h"
#import "DLinviteController.h"

@interface DLContractApplyController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic, strong) UIButton *courierBtn;
@property (nonatomic, strong) UIButton *inviteBtn;
@property(nonatomic,strong) UIScrollView *mainScrollerView;
@property (nonatomic, strong) UIImageView *courierImageView;
@property (nonatomic, strong) UIImageView *inviteImageView;
@property (nonatomic, strong) UITableView *contractTableView;

@property (nonatomic, strong) DLCourierController *courierVC;
@property (nonatomic, strong) DLinviteController *inviteVC;

@end
static NSString *nibCellID = @"nibCellID";
//static NSString *cellID = @"cellID";
//static NSString *nibCell_id = @"nibCell_id";
@implementation DLContractApplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"合同申请";
    [self setTableView];
    [self setUI];
    [self setScrollerView];
    
//    //建立通知中心
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(received:) name:@"selectedControllerNoti" object:nil];
//    
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(received2:) name:@"selectedNoti" object:nil];
//    
    /*
     self.view.backgroundColor = [UIColor ms_backgroundColor];
     self.homeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
     self.homeTableView.dataSource = self;
     self.homeTableView.backgroundColor = [UIColor ms_backgroundColor];
     self.homeTableView.delegate = self;
     [self.homeTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
     self.homeTableView.showsVerticalScrollIndicator = NO;
     
     [self.homeTableView registerClass:[DLLineOrderPriceTableViewCell class] forCellReuseIdentifier:[DLLineOrderPriceTableViewCell cellIdentifier]];
     [self.homeTableView registerClass:[DLLineOrderChoiceDateTableViewCell class] forCellReuseIdentifier:[DLLineOrderChoiceDateTableViewCell cellIdentifier]];
     [self.homeTableView registerClass:[DLLineOrderTripNumebrTableViewCell class] forCellReuseIdentifier:[DLLineOrderTripNumebrTableViewCell cellIdentifier]];
     [self.homeTableView registerClass:[DLLineOrderSingleRoomTableViewCell class] forCellReuseIdentifier:[DLLineOrderSingleRoomTableViewCell cellIdentifier]];
     [self.homeTableView registerClass:[DLLineOrderContactsTableViewCell class] forCellReuseIdentifier:[DLLineOrderContactsTableViewCell cellIdentifier]];
     [self.view addSubview:self.homeTableView];
     
     [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.width.equalTo(self.view.mas_width);
     make.top.equalTo(self.view.mas_top);
     make.left.equalTo(self.view.mas_left);
     make.bottom.equalTo(self.view.mas_bottom).offset(-50);
     }];
     */
}
//
#pragma mark ---------- Set ScrollerView -----------------

-(void)setScrollerView {

    self.mainScrollerView = [[UIScrollView alloc] init];
    self.mainScrollerView.delegate = self;
    self.mainScrollerView.contentSize = CGSizeMake(MAIN_SCREEN_WIDTH*2, 0);
    self.mainScrollerView.pagingEnabled = YES;
    self.mainScrollerView.backgroundColor = [UIColor randomColor];
    [self.contractTableView addSubview:self.mainScrollerView];
    
    
    
    self.courierVC = [[DLCourierController alloc] init];
    [self addChildViewController:self.courierVC];
    [self.mainScrollerView addSubview:self.courierVC.view];
    
    [self.courierVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@20);
        make.width.height.equalTo(@50);
    }];

    [self.mainScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(318);
        make.top.equalTo(self.courierBtn.mas_bottom);
        make.left.right.equalTo(@0);
    }];
}

#pragma mark ----------------- Set UI -----------------
-(void)setUI {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"索取方式";
    label.textColor = [UIColor colorWithHexString:@"#494949"];
    label.font = [UIFont systemFontOfSize:13];
    [label sizeToFit];
    [self.contractTableView addSubview:label];

    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@(45*3+17));
        make.height.equalTo(@15);
    }];
    
    UIButton *courierBtn = [[UIButton alloc] init];
    self.courierBtn = courierBtn;
    [courierBtn setTitle:@"   快递" forState:UIControlStateNormal];
    courierBtn.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    courierBtn.contentHorizontalAlignment =
    UIControlContentHorizontalAlignmentLeft;
    courierBtn.tag = 100;
    courierBtn.tintColor = [UIColor colorWithHexString:@"#494949"];
    courierBtn.backgroundColor = [UIColor redColor];
    [courierBtn addTarget:self action:@selector(courierBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.contractTableView addSubview: courierBtn];
    
    
    UIButton *inviteBtn = [[UIButton alloc] init];
    self.inviteBtn = inviteBtn;
    [inviteBtn setTitle:@"   自取" forState:UIControlStateNormal];
    inviteBtn.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    inviteBtn.contentHorizontalAlignment =
    UIControlContentHorizontalAlignmentLeft;
    inviteBtn.tag = 101;
    [inviteBtn addTarget:self action:@selector(inviteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    inviteBtn.tintColor = [UIColor colorWithHexString:@"#494949"];
    inviteBtn.backgroundColor = [UIColor greenColor];
    [self.contractTableView addSubview: inviteBtn];
    
    UIImageView *courierImageView = [[UIImageView alloc] init];
    self.courierImageView = courierImageView;
    [courierImageView setImage:[UIImage imageNamed:@"UnCheck"]];
    [courierBtn addSubview:courierImageView];
    
    UIImageView *inviteImageView = [[UIImageView alloc] init];
    self.inviteImageView = inviteImageView;
    [inviteImageView setImage:[UIImage imageNamed:@"UnCheck"]];
    [inviteBtn addSubview:inviteImageView];
    
    [courierBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@45);
        make.left.equalTo(@0);
        make.top.equalTo(label.mas_bottom).offset(0);
        make.width.equalTo(@(self.view.width/2));
    }];
    
    
    [inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.height.equalTo(@45);
        make.right.equalTo(@0);
        make.left.equalTo(courierBtn.mas_right).offset(1);
        make.width.equalTo(@(self.view.width/2));
        make.top.equalTo(label.mas_bottom).offset(0);
    }];
    
    [courierImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(courierBtn);
        make.right.equalTo(courierBtn.mas_right).offset(-20);
        make.height.width.equalTo(@20);
    }];
    
    [inviteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(inviteBtn);
        make.right.offset(-20);
        make.height.width.equalTo(@20);
    }];
}
     
#pragma mark ----------------- BtnClick  -----------------

-(void)courierBtnClick {
    
    [self.courierImageView setImage:[UIImage imageNamed:@"Check"]];
    [self.inviteImageView setImage:[UIImage imageNamed:@"UnCheck"]];
}



-(void)inviteBtnClick {
    
    [self.inviteImageView setImage:[UIImage imageNamed:@"Check"]];
    [self.courierImageView setImage:[UIImage imageNamed:@"UnCheck"]];
}


     
#pragma mark ----------------- Set TableView -----------------

-(void)setTableView {
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    self.contractTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.contractTableView.dataSource = self;
    self.contractTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.contractTableView.delegate = self;
    [self.contractTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contractTableView.showsVerticalScrollIndicator = NO;
    
    //注册
    [self.contractTableView registerNib:[UINib nibWithNibName:@"DLContractApplyViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
    
//    [self.contractTableView registerNib:[UINib nibWithNibName:@"DLContractStyleCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCell_id];
//    
    [self.view addSubview:self.contractTableView];
    
    [self.contractTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        
    }];
    
    
}

////移除通知
//-(void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

- (BOOL)dl_blueNavbar {
    return YES;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----------- ScrollView Delegate ----------------

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    

    if (scrollView.contentOffset.x == MAIN_SCREEN_WIDTH) {
        if (self.inviteVC == nil) {
            
        
            self.inviteVC = [[DLinviteController alloc] init];
            [self addChildViewController:self.inviteVC];
            self.view.backgroundColor = [UIColor whiteColor];
            
            [self.mainScrollerView addSubview:self.inviteVC.view];
            
            [self.inviteVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(@0);
                make.height.equalTo(@80);
            }];
        
        }
    }
}









#pragma mark  ----------UITable View Delegate------------

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    if (section == 0) {
//        return 0.1;
//    }
//    return 36;
//}
//
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        DLContractApplyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"国内合同";
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"境外合同";
        }
        if (indexPath.row == 2) {
            cell.textLabel.text = @"单项委托";
        }
        return cell;
    
    
    
}

#pragma mark --------- contractStyleCellDelegate ----------

////收到通知调用方法
//-(void)received:(NSNotification *)notification
//{
//
//    UIView *addressView = [[UIView alloc] init];
//    addressView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:addressView];
//    
////    UILabel *addressLabel = [[UILabel alloc] init];
////    addressLabel.text = @"佛你已经就几个好几个很久很久";
////    [addressLabel sizeToFit];
////    [addressView addSubview:addressLabel];
////    
////    UILabel *numLabel = [[UILabel alloc] init];
////    numLabel.text = @" 010-8567786872";
////    [numLabel sizeToFit];
////    [addressView addSubview:numLabel];
//    
//    
//    [addressView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.offset(0);
//        make.top.equalTo(@(430/2));
//        make.height.equalTo(@90);
//    }];
//
//    
//}

//
//-(void)received2:(NSNotification *)notification{
//    
//    
//    UIView *View = [[UIView alloc] init];
//    View.backgroundColor = [UIColor redColor];
//    [self.view addSubview:View];
//
//    
//    
//    [View mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.offset(0);
//        make.top.equalTo(@(430/2));
//        make.height.equalTo(@190);
//    }];
//    

//}



//
//
//-(void)seletedControllerWith:(UIButton *)btn{
//    
//    self.mainScrollerView.contentOffset = CGPointMake(MAIN_SCREEN_WIDTH*2, 0);
//
//}
//








@end
