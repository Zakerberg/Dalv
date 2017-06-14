//
//  DLCashRegisterViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCashRegisterViewController.h"
#import "DLCashRegisterViewTableViewCell.h"
#import "DLHomeViewTask.h"

@interface DLCashRegisterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *cashRegisterTableView;//
@property (nonatomic, strong) NSMutableArray *cashRegisterList;
@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation DLCashRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
     
    [self.cashRegisterTableView ms_beginRefreshing:self
                                       headerAction:@selector(fetchNewData)
                                       footerAction:@selector(fetchMoreData)];
    
    self.view.backgroundColor = [UIColor whiteColor];
}


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

- (void)fetchNewData {
    self.pageIndex = 1;
    [self fetchData];
}

- (void)fetchMoreData {
    self.pageIndex++;
    [self fetchData];
}

- (void)fetchData {
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"page" : @(self.pageIndex),
                            @"sign_token" : [DLUtils getSign_token],};
    @weakify(self);
    [DLHomeViewTask getAgencyFinanceWithdrawList:param completion:^(id result, NSError *error) {
        @strongify(self);
        
         if (error) {
            [[DLHUDManager sharedInstance] showTextOnly:error.localizedDescription];
        } else {
            if (self.pageIndex == 0) {
                [self.cashRegisterList removeAllObjects];
            }
            NSArray *cashRegisterArray = [DLCashRegisterModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.cashRegisterList addObjectsFromArray:cashRegisterArray];
            [self.cashRegisterTableView reloadData];
            [self.cashRegisterTableView ms_endRefreshing:cashRegisterArray.count pageSize:10 error:error];
        }
    }];

}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cashRegisterList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLCashRegisterViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLCashRegisterViewTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLCashRegisterModel *trModel = [self.cashRegisterList objectAtIndex:indexPath.section];
    [cell configureCell:trModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DLCashRegisterModel *trModel = [self.cashRegisterList objectAtIndex:indexPath.section];
    if (trModel.state.integerValue == 3) {
        return 150;
    } else {
        return 130; 
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

#pragma mark - Getter

- (NSMutableArray *)cashRegisterList {
    if (_cashRegisterList == nil) {
        _cashRegisterList = [[NSMutableArray alloc] init];
    }
    return _cashRegisterList;
}


@end
