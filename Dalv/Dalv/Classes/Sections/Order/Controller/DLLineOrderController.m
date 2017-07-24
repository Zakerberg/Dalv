//
//  DLLineOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLLineOrderDetailXibController.h"
#import "DLLineOrderConfirmController.h"
#import "DLCustomerLoginController.h"
#import "DLLineOrderDetailModel.h"
#import "DLLineOrderController.h"
#import "DLLineOrderXibCell.h"
#import "DLlineOrderModel.h"

@interface DLLineOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *lineOrderTableView;
@property (nonatomic, strong) NSMutableArray *lineOrderList;
@property (weak, nonatomic)  UILabel *lineOrderStateLabel;/// 订单状态
@property (nonatomic, assign) NSInteger pageIndex;
@end

static NSString *cellID = @"cellID";

static NSString *nibCellID = @"nibCellID";

@implementation DLLineOrderController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.lineOrderList = [NSMutableArray array];
//self.pageIndex=1;
    // [self fetchData];
   // [self.lineOrderTableView ms_beginRefreshing:self
//                                            headerAction:@selector(fetchNewData)
//                                            footerAction:@selector(fetchMoreData)];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    [self setTableView];
    
    
    self.pageIndex = 1;
    self.lineOrderList = [NSMutableArray array];
    
    
    [self.lineOrderTableView ms_beginRefreshing:self
                                       headerAction:@selector(fetchNewData)
                                       footerAction:@selector(fetchMoreData)];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payFullMoeyNoti:) name:@"payFullMoney" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payTailMoeyNoti:) name:@"payTailMoney" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payPreMoeyNoti:) name:@"payPreMoney" object:nil];
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}


-(void)payFullMoeyNoti:(NSNotification *)notification

{
    self.lineOrderStateLabel.text = @"已付全款";
}


-(void)payTailMoeyNoti:(NSNotification *)notification

{
    self.lineOrderStateLabel.text = @"已付全款";
}

-(void)payPreMoeyNoti:(NSNotification *)notification

{
    self.lineOrderStateLabel.text = @"已付预付款";
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) updateView
{
    [self.lineOrderTableView reloadData];
}

#pragma mark ----- Set TableView

-(void)setTableView {
    
    self.lineOrderTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineOrderTableView.dataSource = self;
    self.lineOrderTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.lineOrderTableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.lineOrderTableView.showsVerticalScrollIndicator = NO;
    
    [self.lineOrderTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.lineOrderTableView];
    [self.lineOrderTableView registerNib:[UINib nibWithNibName:@"DLLineOrderXibCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
    
    [self.lineOrderTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-48);
    }];
}

#pragma mark ----- fetchData

- (void)fetchNewData {
    self.lineOrderList = [NSMutableArray array];
    self.pageIndex=1;
    [self fetchData];
}

- (void)fetchMoreData {
    self.pageIndex++;
    [self fetchData];
}

-(void)fetchData{
    
    NSDictionary *param = @{
                            
                            @"uid":[DLUtils getUid],
                            @"page": @(self.pageIndex),
                            @"sign_token" : [DLUtils getSign_token],
                            
                            };
    
    if([[DLUtils getUser_type] isEqualToString:@"4"])//顾问
    {
        
    @weakify(self);
    [DLHomeViewTask getAgencyLineOrderList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            
            NSArray *lineOrderArray = [DLlineOrderModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            
            [self.lineOrderList addObjectsFromArray:lineOrderArray];
            [self.lineOrderTableView ms_endRefreshing:lineOrderArray.count pageSize:10 error:error];
            [self.lineOrderTableView reloadData];
            [self updateView];
        }
    }];

    }else{ // C  机票订单
        
        
        
        
        
    }
}

#pragma mark ------ UITableView Delegate 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.lineOrderList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLLineOrderXibCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLlineOrderModel *loModel = [self.lineOrderList objectAtIndex:indexPath.section];
    [cell configureCell:loModel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 136;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DLLineOrderDetailXibController *lineXIBvc = [[DLLineOrderDetailXibController alloc]init];
    DLlineOrderModel *lineOrderModel = _lineOrderList[indexPath.section];
    lineXIBvc.tourID = lineOrderModel.lineId;
    [self.navigationController pushViewController:lineXIBvc animated:YES];
}


@end
