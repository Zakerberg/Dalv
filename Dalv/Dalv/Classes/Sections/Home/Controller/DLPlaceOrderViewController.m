//
//  DLPlaceOrderViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLPlaceOrderViewController.h"
#import "DLLineOrderPriceTableViewCell.h"
#import "DLLineOrderChoiceDateTableViewCell.h"
#import "DLLineOrderTripNumebrTableViewCell.h"
#import "DLLineOrderSingleRoomTableViewCell.h"
#import "DLLineOrderContactsTableViewCell.h"

@interface DLPlaceOrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *homeTableView;

@property (nonatomic, strong) UILabel *totalOrderLab;//订单总额

@end

@implementation DLPlaceOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self cofigureBottomView];
    [self fetchData];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setup navbar
- (void)setupNavbar {
    self.title = @"填写和提交";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
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
}

- (void)cofigureBottomView {
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor ms_separatorColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@48);
    }];
    
    UILabel *totalOrderLab = [[UILabel alloc]init];
    totalOrderLab.text = @"    订单总额：¥4999";
    totalOrderLab.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:totalOrderLab];
    
    [totalOrderLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView);
        make.bottom.equalTo(bottomView);
        make.height.equalTo(@47.5);
        make.width.equalTo(bottomView).multipliedBy(0.67);
    }];
    
    UIButton *placeOrderBtn = [[UIButton alloc]init];
    [placeOrderBtn addTarget:self action:@selector(placeOrderBtn) forControlEvents:UIControlEventTouchUpInside];
    placeOrderBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
    [placeOrderBtn setTitle:@"提交订单" forState:(UIControlStateNormal)];
    [bottomView addSubview:placeOrderBtn];
    
    [placeOrderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bottomView);
        make.bottom.equalTo(bottomView);
        make.height.equalTo(@47.5);
        make.width.equalTo(bottomView).multipliedBy(0.33);
    }];

    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
    DLLineOrderPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderPriceTableViewCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell configureCell:self.routeName];
       return cell;
    } else if (indexPath.section == 1) {
        DLLineOrderChoiceDateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderChoiceDateTableViewCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;
    } else if (indexPath.section == 2){
        DLLineOrderTripNumebrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderTripNumebrTableViewCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 3){
        DLLineOrderSingleRoomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderSingleRoomTableViewCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;
    } else {
        DLLineOrderContactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderContactsTableViewCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
             CGFloat titleHeight = [self.routeName autolableHeightWithFont:[UIFont systemFontOfSize:16] Width:(self.view.width - 30)];
            return titleHeight + 95;
            
        }
            break;
        case 1:
            return 80;
            break;
        case 2:
            return 95;
            break;
        case 3:
            return 70;
            break;
        case 4:
            return 180;
            break;
        default:
            return 0;
            break;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)fetchData {
}

#pragma mark - Event Handler

- (void)placeOrderBtn {
    NSLog(@"点击了提交订单");
}
@end
