//
//  DLMyTicketListController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/3.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  -------------------直客机票订单列表 ----------------

#import "DLMyTicketListController.h"
#import "DLHomeViewTask.h"

@interface DLMyTicketListController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * ticketsTableView;
@property (nonatomic, strong) NSMutableArray *tickeList;
@property (nonatomic, assign) NSInteger pageIndex;
@end

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
   
    
    
#warning ---------- 今天处理此处  !!!!  
    
    
    return nil;

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
