//
//  DLTicketsOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLTicketsOrderController.h"

@interface DLTicketsOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *ticketOrder;
@property (nonatomic, strong) NSMutableArray *ticketsOrderList;
@property (nonatomic, assign) NSInteger pageIndex;
@end

@implementation DLTicketsOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (BOOL)dl_blueNavbar {
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateView
{
    [self.ticketOrder reloadData];
}
-(void)setUI{
    
    
    
    
}
#pragma mark ----- Set TableView

-(void)setTableView {
    
    self.ticketOrder = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.ticketOrder.dataSource = self;
    self.ticketOrder.backgroundColor = [UIColor ms_backgroundColor];
    self.ticketOrder.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.ticketOrder.showsVerticalScrollIndicator = NO;
    
    [self.ticketOrder setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.ticketOrder];
   
    

    [self.ticketOrder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-48);
    }];
}

#pragma mark ----- fetchData

- (void)fetchNewData {
    self.ticketsOrderList = [NSMutableArray array];
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
                
               
            
            
            
            }
        }];
        
    }else{ 
        
        
        
        
        
    }
}


#pragma mark ------ UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
