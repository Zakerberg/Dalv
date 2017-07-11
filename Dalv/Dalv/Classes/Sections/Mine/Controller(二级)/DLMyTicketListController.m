//
//  DLMyTicketListController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/3.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  -------------------直客机票订单列表 ----------------

#import "DLMyTicketListController.h"
#import "DLHomeViewTask.h"
#import "DLMyTicketCell.h"

@interface DLMyTicketListController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * ticketsTableView;
@property (nonatomic, strong) NSMutableArray *tickeList;
@property (nonatomic, assign) NSInteger pageIndex;
@end

static NSString *cellID = @"cellID";

@implementation DLMyTicketListController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUI];
    [self setTableView];
    [self.ticketsTableView ms_beginRefreshing:self
                                   headerAction:@selector(fetchNewData)
                                   footerAction:@selector(fetchMoreData)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI{
    
    self.title = @"机票订单";
    self.view.backgroundColor = [UIColor ms_backgroundColor];
}



-(void)setTableView{
    
    self.ticketsTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.ticketsTableView.dataSource = self;
    self.ticketsTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.ticketsTableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.ticketsTableView.showsVerticalScrollIndicator = NO;
    
    [self.ticketsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.ticketsTableView registerClass:[DLMyTicketCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:self.ticketsTableView];
    [self.ticketsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
}

#pragma mark ------------- fetchData --------------

- (void)fetchNewData {
    self.tickeList = [NSMutableArray array];
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
    [DLHomeViewTask getAgencyFlightVisitorPlaneTicket:param completion:^(id result, NSError *error) {
       
    }];
}


#pragma mark --- UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tickeList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    
    DLMyTicketCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    
    
    
    
#warning 今天处理!!!! 

    
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
    
}

@end
