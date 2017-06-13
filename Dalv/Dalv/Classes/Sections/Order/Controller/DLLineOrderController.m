//
//  DLLineOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderController.h"
#import "DLlineOrderModel.h"
#import "DLHomeViewTask.h"

@interface DLLineOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *lineOrderTableView;





@property (nonatomic, strong) NSMutableArray *lineOrderList;

@end

@implementation DLLineOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
    [self setTableView];
    
    
}

- (void)setupSubviews {




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  --------  setUI  ------------

-(void)setUI{
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

#pragma mark ----------------- Set TableView -----------------

-(void)setTableView {
    
    self.lineOrderTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineOrderTableView.dataSource = self;
    self.lineOrderTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.lineOrderTableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.lineOrderTableView.showsVerticalScrollIndicator = NO;
}

#pragma mark  ------  fetchData  ------------

-(void)fetchData{
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"page" : @"1",
                            @"sign_token" : [DLUtils getSign_token],};
    @weakify(self);
    
    [DLHomeViewTask getAgencyFinanceContractList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
//            NSArray *contractRecordArray = [DLContractRecordModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineOrderList removeAllObjects];
//            [self.linOrderList addObjectsFromArray:contractRecordArray];
            [self.lineOrderTableView reloadData];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
    
    
}



#pragma mark ----------- UITable View Delegate ----------------

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.contractRecordList.count;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 1;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    DLContractApplyRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLContractApplyRecordCell cellIdentifier]];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    DLContractRecordModel *crModel = [self.contractRecordList objectAtIndex:indexPath.section];
//    [cell configureCell:crModel];
//    return cell;
//}


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


-(NSMutableArray *)lineOrderList {
    
    if (_lineOrderList == nil) {
        
        _lineOrderList = [[NSMutableArray alloc] init];
    }
    
    return _lineOrderList;
    
}


























@end
