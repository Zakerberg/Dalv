//
//  DLMyCustomerController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMyCustomerController.h"

@interface DLMyCustomerController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView * customerTableView;
//@property(nonatomic,strong) UITableView * customerTableView;
//

@end

static NSString *cellID = @"cellID";

@implementation DLMyCustomerController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setTableView];
    [self setUI];
    [self setHeadView];
}

- (BOOL)dl_blueNavbar {
    return YES;
}


-(void)setUI{
    
    self.title = @"我的直客";
    self.view.backgroundColor = [UIColor ms_backgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)setHeadView {
    
    
    
}



#pragma mark -----------   Set UITableView ----------------

-(void)setTableView {
    
    self.customerTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.customerTableView.dataSource = self;
    self.customerTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.customerTableView.delegate = self;
    [self.customerTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.customerTableView.showsVerticalScrollIndicator = NO;
    
    [self.customerTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
}



#pragma mark ----------- UITable View Delegate ----------------


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    
    return 25;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return cell;
}


@end
