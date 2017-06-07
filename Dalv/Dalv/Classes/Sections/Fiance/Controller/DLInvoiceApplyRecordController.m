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

@end

@implementation DLInvoiceApplyRecordController

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
    self.title = @"发票申请记录";
}






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


#pragma mark - Layout

- (void)setupConstraints {
    [self.invoiceRecordTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)fetchData {
    NSDictionary *param = @{@"uid" : @"1132",
                            @"page" : @"1",
                            @"sign_token" : @"bc56bde4ae477773abc75b3177a263c7",};
    @weakify(self);
    [DLHomeViewTask getAgencyFinanceInvoicetList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            NSArray *invoiteRecordArray = [DLInvoiceRecordModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.invoiceRecordList removeAllObjects];
            [self.invoiceRecordList addObjectsFromArray:invoiteRecordArray];
            [self.invoiceRecordTableView reloadData];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
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

#pragma mark ------------------ Getter -----------------------

-(NSMutableArray *)invoiceRecordList{
    if (_invoiceRecordList == nil) {
        _invoiceRecordList = [[NSMutableArray alloc] init];
    }
    return _invoiceRecordList;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
