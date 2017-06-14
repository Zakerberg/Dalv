////
////  DLLineOrderViewDetailController.m
////  Dalv
////
////  Created by Michael 柏 on 2017/6/13.
////  Copyright © 2017年 Michael 柏. All rights reserved.
////
//
//#import "DLLineOrderViewDetailController.h"
//#import "DLLineOrderDetailViewCell.h"
//#import "DLLineOrderDetailModel.h"
//#import "DLHomeViewTask.h"
//
//@interface DLLineOrderViewDetailController ()<UITableViewDelegate,UITableViewDataSource>
//
///*** 订单名称 ***/
//@property (weak, nonatomic)  UILabel *lineOrderNameLabel;
///*** 订单状态 ***/
//@property (weak, nonatomic)  UILabel *lineOrderStateLabel;
///*** 订单创建时间 ***/
//@property (weak, nonatomic)  UILabel *lineOrderCreatTimeLabel;
///*** 订单图片 ***/
//@property (weak, nonatomic)  UIImageView *lineOrderPicImageView;
///*** 订单成人数量 ***/
//@property (weak, nonatomic)  UILabel *lineOrderAdultCountLabel;
///*** 订单儿童数量 ***/
//@property (weak, nonatomic)  UILabel *lineOrderChildCountLabel;
///*** 订单团期时间 ***/
//@property (weak, nonatomic)  UILabel *lineOrderStartTimeLabel;
///*** 订单金额 ***/
//@property (weak, nonatomic)  UILabel *lineOrderPriceTotaLabel;
///*** 订单调整金额 ***/
//@property (weak, nonatomic)  UILabel *lineOrderPriceAdjustLabel;
///*** 订单应付金额 ***/
//@property (weak, nonatomic)  UILabel *lineOrderPayableLabel;
///*** 订单特别说明 ***/
//@property (weak, nonatomic)  UILabel *lineOrderMemoLabel;
//
//@property(nonatomic,strong) UITableView *lineOrderDetailTableView;
//
//
//@property (nonatomic, strong) NSMutableArray *lineOrderDetailList;
//
//@property (nonatomic, strong) DLLineOrderDetailModel *lineOrderDetailModel;
//
///*** lineId ***/
//@property(nonatomic,strong) NSString * lineId;
//
//@end
//
//@interface DLLineOrderViewDetailController ()
//
//@end
//
//static NSString *nibCellID = @"nibCellID";
//
//@implementation DLLineOrderViewDetailController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self fetchData];
//    [self setTableView];
//    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    self.title = @"订单线路详情";
//
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//- (BOOL)dl_blueNavbar {
//    return YES;
//}
//
//
//#pragma mark ------------ set Table View --------
//
//-(void)setTableView{
//    
//    self.lineOrderDetailTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//    self.lineOrderDetailTableView.dataSource = self;
//    self.lineOrderDetailTableView.backgroundColor = [UIColor ms_backgroundColor];
//    self.lineOrderDetailTableView.delegate = self;
//    self.lineOrderDetailTableView.dataSource = self;
////    self.automaticallyAdjustsScrollViewInsets = NO;
////    self.lineOrderDetailTableView.showsVerticalScrollIndicator = NO;
//    
////    [self.lineOrderDetailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    
//    [self.view addSubview:self.lineOrderDetailTableView];
//    
//    [self.lineOrderDetailTableView registerNib:[UINib nibWithNibName:@"DLLineOrderDetailViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
//    
//    [self.lineOrderDetailTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(self.view.mas_width);
//        make.top.equalTo(self.view.mas_top);
//        make.left.equalTo(self.view.mas_left);
//        make.bottom.equalTo(self.view.mas_bottom);
//    }];
//}
//
////-(void)setUI {
////    
////    
////    UILabel *nameLabel = [[UILabel alloc] init];
////    self.nameLabel = nameLabel;
////    nameLabel.font = [UIFont systemFontOfSize:15];
////    nameLabel.textColor = [UIColor colorWithHexString:@"#ffffff"];
////    [nameLabel sizeToFit];
////    
////    [self.view addSubview:nameLabel];
////    
////    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.left.equalTo(@16);
////        make.height.equalTo(@15);
////    }];
////    
////    
////    UILabel *stateLabel = [[UILabel alloc] init];
////    self.stateLabel = stateLabel;
////    stateLabel.font = [UIFont systemFontOfSize:12];
////    stateLabel.textColor = [UIColor colorWithHexString:@"#ff6e28"];
////    [stateLabel sizeToFit];
////    
////    [self.view addSubview:stateLabel];
////    
////    [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.centerY.equalTo(self.nameLabel.mas_centerY);
////        make.right.equalTo(@16);
////    }];
////    
////    
////    UIImageView *pictureView = [[UIImageView alloc] init];
////    self.pictureView = pictureView;
////    
////    [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(self.nameLabel.mas_bottom).offset(16);
////        make.left.right.equalTo(@16);
////        make.width.mas_equalTo(pictureView.height).multipliedBy(1.5);
////    }];
////}
////
////
//
//
//-(void)fetchData
//
//{
//        NSDictionary *param = @{
//                                @"uid":[DLUtils getUid],
//                                @"tour_id":@"800",
//                                @"sign_token" : [DLUtils getSign_token],
//                                };
//    
//    
////    NSDictionary *param = @{
////                            @"tour_id" : self.lineOrderDetailModel.lineId
////                            };
//////    
//    @weakify(self);
////
//    [DLHomeViewTask getAgencyLineOrderListDetails:param completion:^(id result, NSError *error) {
//        @strongify(self);
//        if (result) {
//            NSArray *lineOrderDetailArray = [DLLineOrderDetailModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
//                [self.lineOrderDetailList removeAllObjects];
//            [self.lineOrderDetailList addObjectsFromArray:lineOrderDetailArray];
//                [self.lineOrderDetailTableView reloadData];
//            } else {
////                [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
//            }
//        }];
////
////    
////    [DLHomeViewTask getAgencyLineOrderListDetails:param completion:^(id result, NSError *error) {
////        
////    }];
////    
////    
//    
//    
//}
//
//#pragma mark ----------- UITable View Delegate ----------------
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.lineOrderDetailList.count;
//
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 1;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    DLLineOrderDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];
//
//    self.lineOrderNameLabel = cell.lineOrderNameLabel;
//    self.lineOrderStateLabel = cell.lineOrderStateLabel;
//    self.lineOrderCreatTimeLabel = cell.lineOrderCreatTimeLabel;
//    self.lineOrderPicImageView = cell.lineOrderPicImageView;
//    self.lineOrderAdultCountLabel = cell.lineOrderAdultCountLabel;
//    self.lineOrderChildCountLabel = cell.lineOrderChildCountLabel;
//    self.lineOrderStartTimeLabel = cell.lineOrderStartTimeLabel;
//    self.lineOrderPriceTotaLabel = cell.lineOrderPriceTotaLabel;
//    self.lineOrderPriceAdjustLabel = cell.lineOrderPriceAdjustLabel;
//   self.lineOrderPayableLabel = cell.lineOrderPayableLabel;
//    self.lineOrderMemoLabel = cell.lineOrderMemoLabel;
//    
////    self.lineId = cell.lineId;
//    
//    
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    DLLineOrderDetailModel *lineOrderDetailModel = [self.lineOrderDetailList objectAtIndex:indexPath.section];
//    [cell configureCell:lineOrderDetailModel];
//    
//    return cell;
//}
//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 500;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 10.0;
//}
//
//- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return CGFLOAT_MIN;
//}
//
//
//
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    
//}
//
//
//#pragma mark ------------------ Getter -----------------------
//
//-(NSMutableArray *)lineOrderDetailList{
//
//    if (_lineOrderDetailList == nil) {
//        _lineOrderDetailList = [[NSMutableArray alloc] init];
//    }
//    return _lineOrderDetailList;
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
