//
//  DLLineOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ----------------  线路订单列表 --------------------

#import "DLLineOrderDetailXibController.h"
#import "DLLineOrderConfirmController.h"
#import "DLCustomerLoginController.h"
#import "DLLineOrderDetailModel.h"
#import "DLLineOrderController.h"
#import "DLLineOrderXibCell.h"
#import "DLlineOrderModel.h"
#import "DLHomeViewTask.h"

@interface DLLineOrderController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *lineOrderTableView;

@property (nonatomic, strong) NSMutableArray *lineOrderList;
///* 订单图片 */
//@property (weak, nonatomic)  UIImageView *lineOrderPicture;
///* 订单名称 */
//@property (weak, nonatomic)  UILabel *lineOrderNameLabel;
///* 团期时间 */
//@property (weak, nonatomic)  UILabel *lineOrderTimeLabel;
///* 订单价格(应付金额) */
//@property (weak, nonatomic)  UILabel *lineOrderPriceLabel;
///* 订单状态 */

@property (weak, nonatomic)  UILabel *lineOrderStateLabel;
@property (nonatomic, assign) NSInteger pageIndex;

@end


static NSString *cellID = @"cellID";

static NSString *nibCellID = @"nibCellID";

@implementation DLLineOrderController



- (void)viewDidLoad {
    
    [super viewDidLoad];
//
//    if (self.lineOrderTableView) {
//        
//        [self.lineOrderTableView removeFromSuperview];
//
//    }
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    self.title = @"线路订单";
    [self setTableView];
    [self.lineOrderTableView ms_beginRefreshing:self
                                       headerAction:@selector(fetchNewData)
                                       footerAction:@selector(fetchMoreData)];
//  self.navigationController.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payFullMoeyNoti:) name:@"payFullMoney" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payTailMoeyNoti:) name:@"payTailMoney" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payPreMoeyNoti:) name:@"payPreMoney" object:nil];
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)viewWillAppear:(BOOL)animated{
//    [self viewDidLoad];
    [super viewWillAppear:animated];
    self.lineOrderList = [NSMutableArray array];
    self.pageIndex=1;
    [self fetchData];
//    [self updateView];
}

-(void)payFullMoeyNoti:(NSNotification *)notification

{
    self.lineOrderStateLabel.text = @"已付全款";
}


-(void)payTailMoeyNoti:(NSNotification *)notification

{
    self.lineOrderStateLabel.text = @"已付全款";
}

-(void)payPreMoeyNoti:(NSNotification *)notification

{
    self.lineOrderStateLabel.text = @"已付预付款";
}

//移除通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 * 更新视图.
 */
- (void) updateView
{
    [self.lineOrderTableView reloadData];
}

#pragma mark ----------------- Set TableView --------------

-(void)setTableView {
    
    self.lineOrderTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineOrderTableView.dataSource = self;
    self.lineOrderTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.lineOrderTableView.delegate = self;
    
    //自动更改透明度
//    self.lineOrderTableView.mj_header.automaticallyChangeAlpha = YES;
    
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

#pragma mark ------------- fetchData --------------

- (void)fetchNewData {
    self.lineOrderList = [NSMutableArray array];
    self.pageIndex=1;
    [self fetchData];
    
}

- (void)fetchMoreData {
    self.pageIndex++;
    [self fetchData];
    
}

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"page": @(self.pageIndex),
                            @"sign_token" : [DLUtils getSign_token],
                            };
    @weakify(self);
    [DLHomeViewTask getAgencyLineOrderList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            
            NSArray *lineOrderArray = [DLlineOrderModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineOrderList addObjectsFromArray:lineOrderArray];
            [self.lineOrderTableView ms_endRefreshing:lineOrderArray.count pageSize:10 error:error];
            [self.lineOrderTableView reloadData];
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
    
//    self.lineOrderStateLabel = cell.lineOrderStateLabel;
    
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

#pragma mark -------- UINavigationControllerDelegate --------

//- (void)navigationController:(UINavigationController*)navigationController willShowViewController:(UIViewController*)viewController animated:(BOOL)animated{
//    
//    if([[viewController class] isSubclassOfClass:[DLLineOrderController class]]) {
//        
//        ///执行刷新操作
//        [self updateView];
//    }
//    
//    ///删除代理，防止该controller销毁后引起navigationController.delegate指向野指针造成崩溃
//    if(![[viewController class] isSubclassOfClass:[self class]]) {
//        
//        self.navigationController.delegate = nil;
//        
//    }
//}


#pragma mark ------------------ Getter -----------------------

//-(NSMutableArray *)lineOrderList {
//    
//    if (_lineOrderList == nil) {
//        
//        _lineOrderList = [[NSMutableArray alloc] init];
//    }
//    return _lineOrderList;
//}

@end
