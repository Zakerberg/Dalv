//
//  DLContractApplyController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplyController.h"
#import "DLContractApplyViewCell.h"
#import "DLContractStyleCell.h"

@interface DLContractApplyController ()<UITableViewDelegate,UITableViewDataSource,contractStyleCellDelegate>

@property(nonatomic,strong) UILabel * moneyLabel;
@property(nonatomic,strong) UIScrollView *mainScrollerView;

@property (nonatomic, strong) UITableView *contractTableView;

@end
static NSString *nibCellID = @"nibCellID";
static NSString *cellID = @"cellID";
static NSString *nibCell_id = @"nibCell_id";
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

#pragma mark ----------------- Set ScrollerView -----------------

-(void)setScrollerView {

    
    self.mainScrollerView = [[UIScrollView alloc] init];
    self.mainScrollerView.delegate = self;
    self.mainScrollerView.contentSize = CGSizeMake(MAIN_SCREEN_WIDTH*2, 0);
    self.mainScrollerView.pagingEnabled = YES;
    self.mainScrollerView.backgroundColor = [UIColor randomColor];
    [self.view addSubview:self.mainScrollerView];
    
    [self.mainScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@(430/2));
        make.height.equalTo(@326);
    }];
    
    
    
    
    
    
}

#pragma mark ----------------- Set UI -----------------
-(void)setUI {
    
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"索取方式";
//    label.textColor = [UIColor colorWithHexString:@"#494949"];
//    label.font = [UIFont systemFontOfSize:13];
//    [label sizeToFit];
//    [self.view addSubview:label];
//    
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@15);
//        make.top.equalTo(@(45*3+17));
//        make.height.equalTo(@15);
//    }];
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
    
    [self.contractTableView registerNib:[UINib nibWithNibName:@"DLContractStyleCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCell_id];
    
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

#pragma mark  ----------UITable View Delegate------------

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    return 36;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 3;
    }
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    if (indexPath.section == 0) {
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
    
    
    DLContractStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCell_id];
    
    return cell;

}

#pragma mark ----------------- contractStyleCellDelegate -----------------



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





-(void)seletedControllerWith:(UIButton *)btn{
    
    self.mainScrollerView.contentOffset = CGPointMake(MAIN_SCREEN_WIDTH*2, 0);

}









@end
