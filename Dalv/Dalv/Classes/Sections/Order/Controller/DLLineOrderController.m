//
//  DLLineOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderController.h"
#import "DLLineOrderViewCell.h"
#import "DLlineOrderModel.h"
#import "DLHomeViewTask.h"
#import "DLLineOrderXibCell.h"


@interface DLLineOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *lineOrderTableView;

@property (nonatomic, strong) NSMutableArray *lineOrderList;

@end


static NSString *cellID = @"cellID";

static NSString *nibCellID = @"nibCellID";




@implementation DLLineOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
    [self setTableView];
    
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -----------------  Set UI --------------

-(void)setUI{
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

#pragma mark ----------------- Set TableView --------------

-(void)setTableView {
    
    self.lineOrderTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineOrderTableView.dataSource = self;
    self.lineOrderTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.lineOrderTableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.lineOrderTableView.showsVerticalScrollIndicator = NO;
    
//    [self.lineOrderTableView registerClass:[DLLineOrderViewCell class] forCellReuseIdentifier:cellID];
//    
    [self.lineOrderTableView registerNib:[UINib nibWithNibName:@"DLLineOrderXibCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
    
    
    
    
}

#pragma mark  ------  fetchData  ------------

-(void)fetchData{
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"page" : @"1",
                            @"sign_token" : [DLUtils getSign_token],
                            };
    @weakify(self);
    
    [DLHomeViewTask getAgencyFinanceContractList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            NSArray *lineOrderArray = [DLlineOrderModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineOrderList removeAllObjects];
            [self.lineOrderList addObjectsFromArray:lineOrderArray];
            [self.lineOrderTableView reloadData];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}

#pragma mark ----------- UITable View Delegate ----------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.lineOrderList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    DLLineOrderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderViewCell cellIdentifier]];
    
    
    
    DLLineOrderXibCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLlineOrderModel *loModel = [self.lineOrderList objectAtIndex:indexPath.section];
    [cell configureCell:loModel];
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

-(NSMutableArray *)lineOrderList {
    
    if (_lineOrderList == nil) {
        
        _lineOrderList = [[NSMutableArray alloc] init];
    }
    return _lineOrderList;
}

@end
