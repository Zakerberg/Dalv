//
//  DLContractApplyRecordController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.


#import "DLContractApplyRecordController.h"
#import "DLContractApplyRecordCell.h"
#import "DLHomeViewTask.h"

@interface DLContractApplyRecordController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *contractRecordTableView;
@property (nonatomic, strong) NSMutableArray *contractRecordList;
@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation DLContractApplyRecordController

- (void)viewDidLoad {
    self.title = @"合同申请记录";
    [super viewDidLoad];
    [self setupSubviews];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.contractRecordTableView ms_beginRefreshing:self
                                        headerAction:@selector(fetchNewData)
                                        footerAction:@selector(fetchMoreData)];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------- Fetch data -----------------

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
    
    [DLHomeViewTask getAgencyFinanceContractList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (error) {
            [[DLHUDManager sharedInstance] showTextOnly:error.localizedDescription];
        } else {
            if (self.pageIndex == 1) {
                [self.contractRecordList removeAllObjects];
            }
            NSArray *contractRecordArray = [DLContractRecordModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.contractRecordList addObjectsFromArray:contractRecordArray];
            [self.contractRecordTableView reloadData];
            [self.contractRecordTableView ms_endRefreshing:contractRecordArray.count pageSize:10 error:error];
        }
    }];
}

#pragma mark ------------------ setupSubviews -----------------

- (void)setupSubviews {
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.contractRecordTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.contractRecordTableView.dataSource = self;
    self.contractRecordTableView.backgroundColor = [UIColor ms_backgroundColor];
    
    self.contractRecordTableView.delegate = self;
    [self.contractRecordTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.contractRecordTableView.showsVerticalScrollIndicator = NO;
    
    [self.contractRecordTableView registerClass:[DLContractApplyRecordCell class] forCellReuseIdentifier:[DLContractApplyRecordCell cellIdentifier]];
    
    [self.view addSubview:self.contractRecordTableView];
    
    [self.contractRecordTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}


//- (void)setupConstraints {
//    [self.contractRecordTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//}

#pragma mark ----------- UITable View Delegate ----------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contractRecordList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLContractApplyRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLContractApplyRecordCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLContractRecordModel *crModel = [self.contractRecordList objectAtIndex:indexPath.section];
    [cell configureCell:crModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLContractRecordModel *crModel = [self.contractRecordList objectAtIndex:indexPath.section];
    if (crModel.state.integerValue == 3) {
        return 210;
    } else {
        return 190;
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

#pragma mark ------------------ Getter -----------------------

-(NSMutableArray *)contractRecordList {
    
    if(_contractRecordList == nil) {
        
        _contractRecordList = [[NSMutableArray alloc] init];
    }
    return _contractRecordList;
}

@end
