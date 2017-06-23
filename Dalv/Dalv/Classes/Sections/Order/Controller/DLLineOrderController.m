//
//  DLLineOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ----------------  线路订单列表 --------------------

#import "DLLineOrderDetailXibController.h"
#import "DLCustomerLoginController.h"
#import "DLLineOrderDetailModel.h"
#import "DLLineOrderController.h"
#import "DLLineOrderViewCell.h"
#import "DLLineOrderXibCell.h"
#import "DLlineOrderModel.h"
#import "DLHomeViewTask.h"

@interface DLLineOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *lineOrderTableView;

@property (nonatomic, strong) NSMutableArray *lineOrderList;

/* 订单图片 */
@property (weak, nonatomic)  UIImageView *lineOrderPicture;
/* 订单名称 */
@property (weak, nonatomic)  UILabel *lineOrderNameLabel;
/* 团期时间 */
@property (weak, nonatomic)  UILabel *lineOrderTimeLabel;
/* 订单价格(应付金额) */
@property (weak, nonatomic)  UILabel *lineOrderPriceLabel;
/* 订单状态 */
@property (weak, nonatomic)  UILabel *lineOrderStateLabel;

@end


static NSString *cellID = @"cellID";

static NSString *nibCellID = @"nibCellID";

@implementation DLLineOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
    [self setTableView];
    [self.lineOrderTableView reloadData];
    //进入刷新状态
    [self.lineOrderTableView.mj_header beginRefreshing];
    self.title = @"线路订单";

}

- (BOOL)dl_blueNavbar {
    return YES;
}

/**
 * 更新视图.
 */
- (void) updateView
{
    [self.lineOrderTableView reloadData];
    [self endRefresh];
}
/**
 *  停止刷新
 */
-(void)endRefresh{
    
    [self.lineOrderTableView.mj_header endRefreshing];
}



#pragma mark -----------------  Set UI --------------

-(void)setUI{
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
}

#pragma mark ----------------- Set TableView --------------

-(void)setTableView {
    
    self.lineOrderTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineOrderTableView.dataSource = self;
    self.lineOrderTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.lineOrderTableView.delegate = self;
    
    //下拉刷新
    self.lineOrderTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(updateView)];
    
    //自动更改透明度
    self.lineOrderTableView.mj_header.automaticallyChangeAlpha = YES;
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.lineOrderTableView.showsVerticalScrollIndicator = NO;
    
    [self.lineOrderTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:self.lineOrderTableView];
    
    [self.lineOrderTableView registerNib:[UINib nibWithNibName:@"DLLineOrderXibCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
    
    [self.lineOrderTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-48);
    }];
}

#pragma mark  ------  fetchData  ------------

-(void)fetchData{
    
    NSDictionary *param = @{
                            
                            @"uid":[DLUtils getUid],
                            @"page":@"1",
                            @"sign_token" : [DLUtils getSign_token],
                            };
    @weakify(self);
    [DLHomeViewTask getAgencyLineOrderList:param completion:^(id result, NSError *error) {
        [self endRefresh];
        @strongify(self);
        if (result) {
            
            NSArray *lineOrderArray = [DLlineOrderModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineOrderList removeAllObjects];
            [self.lineOrderList addObjectsFromArray:lineOrderArray];
            [self endRefresh];
            [self updateView];
            
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
    
    DLLineOrderXibCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];
    

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLlineOrderModel *loModel = [self.lineOrderList objectAtIndex:indexPath.section];
    [cell configureCell:loModel];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 136;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DLLineOrderDetailXibController *lineXIBvc = [[DLLineOrderDetailXibController alloc]init];
    
    DLlineOrderModel *lineOrderModel = _lineOrderList[indexPath.section];
    
    lineXIBvc.tourID = lineOrderModel.lineId;
    
    [self.navigationController pushViewController:lineXIBvc animated:YES];
    
}

#pragma mark ------------------ Getter -----------------------

-(NSMutableArray *)lineOrderList {
    
    if (_lineOrderList == nil) {
        
        _lineOrderList = [[NSMutableArray alloc] init];
    }
    return _lineOrderList;
}

@end
