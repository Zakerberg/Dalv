//
//  DLLineOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ----------------  线路订单列表 --------------------

#import "DLLineOrderController.h"
#import "DLLineOrderViewCell.h"
#import "DLlineOrderModel.h"
#import "DLHomeViewTask.h"
#import "DLLineOrderXibCell.h"
#import "DLLineOrderDetailXibController.h"
#import "DLLineOrderDetailModel.h"
//#import "DLLineOrderViewDetailController.h"

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
}

- (BOOL)dl_blueNavbar {
    return YES;
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
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.lineOrderTableView.showsVerticalScrollIndicator = NO;
    
    [self.lineOrderTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:self.lineOrderTableView];
    
    [self.lineOrderTableView registerNib:[UINib nibWithNibName:@"DLLineOrderXibCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
    
    [self.lineOrderTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-48-49-9);
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
        @strongify(self);
        if (result) {
            
            
            NSArray *lineOrderArray = [DLlineOrderModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineOrderList removeAllObjects];
            [self.lineOrderList addObjectsFromArray:lineOrderArray];
            
            NSLog(@"%@",result);
            
            
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
    
    DLLineOrderXibCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];

//    self.lineOrderPicture = cell.lineOrderPicture;
//    self.lineOrderNameLabel = cell.lineOrderNameLabel;
//    self.lineOrderTimeLabel = cell.lineOrderTimeLabel;
//    self.lineOrderStateLabel = cell.lineOrderStateLabel;
//    
    
    
    

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
    
//    DLLineOrderViewDetailController *lineOrderDetailVC = [[DLLineOrderViewDetailController alloc] init];
//    
//    [self.navigationController pushViewController:lineOrderDetailVC animated:YES];

    
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
