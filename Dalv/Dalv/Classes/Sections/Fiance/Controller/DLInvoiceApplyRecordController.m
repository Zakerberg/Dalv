//
//  DLInvoiceApplyRecordController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLInvoiceApplyRecordController.h"
#import "DLInvoiceApplyRecordCell.h"
#import "DLHomeViewTask.h"

@interface DLInvoiceApplyRecordController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *invoiceRecordTableView;
@property (nonatomic, strong) NSMutableArray *invoiceRecordList;

@property (nonatomic, assign) NSInteger pageIndex;
@end

@implementation DLInvoiceApplyRecordController

- (void)viewDidLoad {
    self.title = @"发票申请记录";
    [super viewDidLoad];
    [self setupSubviews];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.invoiceRecordTableView ms_beginRefreshing:self
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

#pragma mark ------------------ fetchData --------------

- (void)fetchNewData {
    self.pageIndex = 1;
    [self fetchData];
}

- (void)fetchMoreData {
    self.pageIndex++;
    [self fetchData];
}

-(void)fetchData {
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"page" : @(self.pageIndex),
                            @"sign_token" : [DLUtils getSign_token],};
    @weakify(self);
    [DLHomeViewTask getAgencyFinanceInvoicetList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            NSArray *invoiteRecordArray = [DLInvoiceRecordModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.invoiceRecordList addObjectsFromArray:invoiteRecordArray];
            [self.invoiceRecordTableView reloadData];
            [self.invoiceRecordTableView ms_endRefreshing:invoiteRecordArray.count pageSize:10 error:error];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}

#pragma mark ----------- setupSubviews --------------------
-(void)setupSubviews {
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.invoiceRecordTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.invoiceRecordTableView.dataSource = self;
    self.invoiceRecordTableView.backgroundColor = [UIColor ms_backgroundColor];
    
    self.invoiceRecordTableView.delegate = self;
    [self.invoiceRecordTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.invoiceRecordTableView.showsVerticalScrollIndicator = NO;
    
    [self.invoiceRecordTableView registerClass:[DLInvoiceApplyRecordCell class] forCellReuseIdentifier:[DLInvoiceApplyRecordCell cellIdentifier]];
    
    [self.view addSubview:self.invoiceRecordTableView];
    
    [self.invoiceRecordTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)setupConstraints {
    [self.invoiceRecordTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark ----------- UITable View Delegate ----------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.invoiceRecordList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLInvoiceApplyRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLInvoiceApplyRecordCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLInvoiceRecordModel *iarModel = [self.invoiceRecordList objectAtIndex:indexPath.section];
    [cell configureCell:iarModel];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLInvoiceRecordModel *crModel = [self.invoiceRecordList objectAtIndex:indexPath.section];
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

-(NSMutableArray *)invoiceRecordList{
    if (_invoiceRecordList == nil) {
        _invoiceRecordList = [[NSMutableArray alloc] init];
    }
    return _invoiceRecordList;
}


@end
