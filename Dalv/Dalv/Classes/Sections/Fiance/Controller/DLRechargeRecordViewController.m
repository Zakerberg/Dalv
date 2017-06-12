//
//  DLRechargeRecordViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRechargeRecordViewController.h"
#import "DLRechargeRecordTableViewCell.h"
#import "DLHomeViewTask.h"

@interface DLRechargeRecordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *rechargeRecordTableView;
@property (nonatomic, strong) NSMutableArray *rechargeRecordList;

@end

@implementation DLRechargeRecordViewController

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
    self.title = @"充值记录";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.rechargeRecordTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.rechargeRecordTableView.dataSource = self;
    self.rechargeRecordTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.rechargeRecordTableView.delegate = self;
    [self.rechargeRecordTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.rechargeRecordTableView.showsVerticalScrollIndicator = NO;
    [self.rechargeRecordTableView registerClass:[DLRechargeRecordTableViewCell class] forCellReuseIdentifier:[DLRechargeRecordTableViewCell cellIdentifier]];
    [self.view addSubview:self.rechargeRecordTableView];
    
    [self.rechargeRecordTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.rechargeRecordTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Fetch data

- (void)fetchData {

    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"page" : @"1",
                            @"sign_token" : [DLUtils getSign_token],};
    @weakify(self);
    [DLHomeViewTask getAgencyFinanceTopupList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            NSArray *rechargeRecordArray = [DLRechargeRecordModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.rechargeRecordList removeAllObjects];
            [self.rechargeRecordList addObjectsFromArray:rechargeRecordArray];
            [self.rechargeRecordTableView reloadData];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.rechargeRecordList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLRechargeRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLRechargeRecordTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        DLRechargeRecordModel *trModel = [self.rechargeRecordList objectAtIndex:indexPath.section];
        [cell configureCell:trModel];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
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

#pragma mark - Getter

- (NSMutableArray *)rechargeRecordList {
    if (_rechargeRecordList == nil) {
        _rechargeRecordList = [[NSMutableArray alloc] init];
    }
    return _rechargeRecordList;
}


@end
