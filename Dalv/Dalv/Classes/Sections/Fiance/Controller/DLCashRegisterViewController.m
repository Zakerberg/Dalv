//
//  DLCashRegisterViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCashRegisterViewController.h"
#import "DLCashRegisterViewTableViewCell.h"

@interface DLCashRegisterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *cashRegisterTableView;//

@end

@implementation DLCashRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self fetchData];
    
    self.view.backgroundColor = [UIColor whiteColor];}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"提现申请记录";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.cashRegisterTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.cashRegisterTableView.dataSource = self;
    self.cashRegisterTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.cashRegisterTableView.delegate = self;
    [self.cashRegisterTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.cashRegisterTableView.showsVerticalScrollIndicator = NO;
    [self.cashRegisterTableView registerClass:[DLCashRegisterViewTableViewCell class] forCellReuseIdentifier:[DLCashRegisterViewTableViewCell cellIdentifier]];
    [self.view addSubview:self.cashRegisterTableView];
    
    [self.cashRegisterTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.cashRegisterTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


#pragma mark - Fetch data

- (void)fetchData {
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLCashRegisterViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLCashRegisterViewTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
