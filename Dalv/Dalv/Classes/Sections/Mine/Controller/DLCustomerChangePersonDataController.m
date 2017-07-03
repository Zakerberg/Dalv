//
//  DLCustomerChangePersonDataController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/3.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCustomerChangePersonDataController.h"

@interface DLCustomerChangePersonDataController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView * personalDataTableView;

@end

@implementation DLCustomerChangePersonDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    [self setTab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)setTab{
    
    UITableView *tableView = [[UITableView alloc] init];
    
    
    
    
    
}









-(void)fetchData{
    
    
    
    
}

#pragma mark ----- UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    

    
    
    
    return cell;
}
















@end
