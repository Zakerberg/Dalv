//
//  DLContractApplyRecordController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplyRecordController.h"
#import "DLContractApplyRecordCell.h"
#import "DLHomeViewTask.h"

@interface DLContractApplyRecordController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *contractRecordTableView;
@property (nonatomic, strong) NSMutableArray *contractRecordList;

@end

@implementation DLContractApplyRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
    [self fetchData];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)setupNavbar {
    self.title = @"合同申请记录";
}

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


#pragma mark - Layout

- (void)setupConstraints {
    [self.contractRecordTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


#pragma mark - Fetch data
- (void)fetchData {
    
    NSDictionary *param = @{@"uid" : @"1132",
                            @"page" : @"1",
                            @"sign_token" : @"bc56bde4ae477773abc75b3177a263c7",};
    @weakify(self);
    [DLHomeViewTask getAgencyFinanceTopupList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            NSArray *contractRecordArray = [DLContractRecordModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.contractRecordList removeAllObjects];
            [self.contractRecordList addObjectsFromArray:contractRecordArray];
            [self.contractRecordTableView reloadData];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
        
    }];
}


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

-(NSMutableArray *)contractRecordList {
    if(_contractRecordList == nil) {
        
        _contractRecordList = [[NSMutableArray alloc] init];
    }
    return _contractRecordList;
    
}



@end
