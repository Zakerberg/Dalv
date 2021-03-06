//
//  DLLineModificationViewController.m
//  Dalv
//
//  Created by Nie on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineModificationViewController.h"
#import "DLLineModificationViewDetailTableViewCell.h"
#import "DLRoutePricingTableViewCell.h"

@interface DLLineModificationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *lineModificationTableView;//

@end

@implementation DLLineModificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self fetchData];

    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"路线改价";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.lineModificationTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineModificationTableView.dataSource = self;
    self.lineModificationTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.lineModificationTableView.delegate = self;
    [self.lineModificationTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.lineModificationTableView.showsVerticalScrollIndicator = NO;
    [self.lineModificationTableView registerClass:[DLLineModificationViewDetailTableViewCell class] forCellReuseIdentifier:[DLLineModificationViewDetailTableViewCell cellIdentifier]];
    [self.lineModificationTableView registerClass:[DLRoutePricingTableViewCell class] forCellReuseIdentifier:[DLRoutePricingTableViewCell cellIdentifier]];
    [self.view addSubview:self.lineModificationTableView];
    
    [self.lineModificationTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.lineModificationTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Fetch data

- (void)fetchData {
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 1;
    }else{
        return 3;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
    DLLineModificationViewDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineModificationViewDetailTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    } else{
    DLRoutePricingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLRoutePricingTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        return 160;
    }else{
        return 230;
    }
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
