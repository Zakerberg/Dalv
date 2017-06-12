//
//  DLTransactionRecordViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLTransactionRecordViewController.h"
#import "DLTransactionRecordTableViewCell.h"
#import "DLHomeViewTask.h"
@interface DLTransactionRecordViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *TRhomeTableView;
@property (nonatomic, strong) NSMutableArray *transactionRecordList;

@end

@implementation DLTransactionRecordViewController

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
    self.title = @"交易记录";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.TRhomeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.TRhomeTableView.dataSource = self;
    self.TRhomeTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.TRhomeTableView.delegate = self;
    [self.TRhomeTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.TRhomeTableView.showsVerticalScrollIndicator = NO;
    [self.TRhomeTableView registerClass:[DLTransactionRecordTableViewCell class] forCellReuseIdentifier:[DLTransactionRecordTableViewCell cellIdentifier]];
    [self.view addSubview:self.TRhomeTableView];
    
    [self.TRhomeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.TRhomeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


#pragma mark - Fetch data

- (void)fetchData {
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"page" : @"1",
                            @"sign_token" : [DLUtils getSign_token],};
    @weakify(self);
    [DLHomeViewTask getAgencyFinanceAccountTransaction:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            NSArray *transactionRecorArray = [DLTransactionRecordModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.transactionRecordList removeAllObjects];
            [self.transactionRecordList addObjectsFromArray:transactionRecorArray];
            [self.TRhomeTableView reloadData];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
        
    }];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.transactionRecordList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLTransactionRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLTransactionRecordTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLTransactionRecordModel *trModel = [self.transactionRecordList objectAtIndex:indexPath.section];
    [cell configureCell:trModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
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


#pragma mark - Event Handler

#pragma mark - Getter

- (NSMutableArray *)transactionRecordList {
    if (_transactionRecordList == nil) {
        _transactionRecordList = [[NSMutableArray alloc] init];
    }
    return _transactionRecordList;
}


@end
