//
//  DLCustomerListController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------ 我的直客列表 --------------------

#import "DLCustomerListController.h"
#import "DLHomeViewTask.h"

@interface DLCustomerListController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView * customerListTableView;

@property (nonatomic, strong) NSMutableArray *myCustomerList;


@end

@implementation DLCustomerListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
}



-(void)setTableView {
    
    
    
    
}







#pragma mark ------------  fetchData --------------

- (void)fetchData {
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],};
    
    
//    [DLHomeViewTask ]
    
    
    
    
    
}







#pragma mark ------------  Table view Delegate --------------

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
}





//
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//}
//
//



@end
