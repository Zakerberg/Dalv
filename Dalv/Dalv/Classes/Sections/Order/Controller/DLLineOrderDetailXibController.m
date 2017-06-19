//
//  DLLineOrderDetailXibController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderDetailXibController.h"
#import "DLLineOrderConfirmController.h"
#import "DLLineOrderDetailModel.h"
#import "DLHomeViewTask.h"

@interface DLLineOrderDetailXibController ()


/*** 订单名称 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderNameLabel;
/*** 订单状态 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderStateLabel;
/*** 订单创建时间 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderCreatTimeLabel;
/*** 订单图片 ***/
@property (weak, nonatomic) IBOutlet UIImageView *lineOrderPicImageView;
/*** 订单成人数量 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderAdultCountLabel;
/*** 订单儿童数量 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderChildCountLabel;
/*** 订单团期时间 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderStartTimeLabel;
/*** 订单金额 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPriceTotaLabel;
/*** 订单调整金额 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPriceAdjustLabel;
/*** 订单应付金额 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPayableLabel;
/*** 订单特别说明 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderMemoLabel;

@property (nonatomic, strong) NSMutableArray *lineOrderDetailList;

@property (weak, nonatomic) IBOutlet UIView *lineOrderDetailView;

//边框成人和儿童的label
@property (weak, nonatomic) IBOutlet UILabel *adultBorderLabel;
@property (weak, nonatomic) IBOutlet UILabel *childBorderLabel;

/*预付款button*/
@property (nonatomic, strong) UIButton *prepaidBtn;
/*全款button*/
@property (nonatomic, strong) UIButton *payFullBtn;

/*尾款button*/
@property (weak, nonatomic) IBOutlet UIButton *payTailButton;

@property(nonatomic,strong) DLLineOrderDetailModel * lineOrderDetailModel;

@property(nonatomic,strong) UITableView * mainTableView;

@end

static NSString *cellID = @"cellID";

@implementation DLLineOrderDetailXibController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
    [self setButton];

    self.payTailButton.hidden = YES;
    
    
    
    
    //搭建风火轮
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    //[SVProgressHUD setForegroundColor:[UIColor colorWithRed:0.882 green:0.839 blue:0.729 alpha:1.000]];
    [SVProgressHUD setForegroundColor:kPinkColor];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.6588 green:0.5686 blue:0.3686 alpha:0.2]];
    //[SVProgressHUD setBackgroundColor:kPinkColor];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:13]];
    [SVProgressHUD showWithStatus:@"加载中~"];
    [SVProgressHUD dismissWithDelay:2];
    self.view.backgroundColor = [UIColor colorWithRed:0.969 green:0.949 blue:0.902 alpha:1.000];
    

    
    
    

}
//#pragma mark - ------------- setTableView ----------------
//
//-(void)setTableView
//{
//    
//    UITableView *mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//    self.mainTableView = mainTableView;
//    
//    mainTableView.backgroundColor = [UIColor redColor];
//    
//    
////    self.automaticallyAdjustsScrollViewInsets = NO;
////    mainTableView.showsVerticalScrollIndicator = NO;
//    
//    [mainTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    
//    [mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
//
//    
//    [self.view addSubview:mainTableView];
//
//    
//    [mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.offset(0);
//        make.height.offset(0);
//    }];
//    
//}

#pragma mark - ------------- setUI ----------------

-(void)setUI{
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"线路订单详情";
    
    self.adultBorderLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    self.adultBorderLabel.layer.borderWidth = 0.5f;
    self.adultBorderLabel.layer.masksToBounds = YES;
    
    self.childBorderLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    self.childBorderLabel.layer.borderWidth = 0.5f;
    self.childBorderLabel.layer.masksToBounds = YES;

}

- (BOOL)dl_blueNavbar {
    return YES;
}

#pragma mark - ------------- setButton ----------------
-(void)setButton{
    
    
    
    UIButton *prepaidBtn = [[UIButton alloc] init];
    self.prepaidBtn = prepaidBtn;
    
    prepaidBtn.backgroundColor = [UIColor whiteColor];
    [prepaidBtn setTitle:@"付预付款" forState:UIControlStateNormal];
    [prepaidBtn setTitleColor:[UIColor colorWithHexString:@"#3e3e3e"] forState:UIControlStateNormal];
    prepaidBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    prepaidBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [prepaidBtn addTarget:self action:@selector(prepaidBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:prepaidBtn];
    
    [prepaidBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(@0);
        make.height.equalTo(@45);
        make.width.offset(MAIN_SCREEN_WIDTH/2);
        
    }];
    
    UIButton *payFullBtn = [[UIButton alloc] init];
    self.payFullBtn = payFullBtn;
    
    payFullBtn.backgroundColor = [UIColor colorWithHexString:@"#fe603b"];
    [payFullBtn setTitle:@"支付全款" forState:UIControlStateNormal];
    [payFullBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    
    payFullBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    payFullBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    payFullBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [payFullBtn addTarget:self action:@selector(payFullBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:payFullBtn];
    
    [payFullBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(prepaidBtn.mas_right);
        make.right.bottom.equalTo(@0);
        make.centerY.equalTo(prepaidBtn.mas_centerY);
    }];
    
}

#pragma mark - ------------- BtnClick ----------------

//预付款
-(void)prepaidBtnClick{
    
    DLLineOrderConfirmController *confirmVC = [[DLLineOrderConfirmController alloc] init];
    
    confirmVC.linePayID = self. tourID;
    
    self.BtnType = @"2";
    confirmVC.BtnType = self.BtnType;
    
    [self.navigationController pushViewController:confirmVC animated:YES];
    
    NSLog(@"预付款");
}

//全款
-(void)payFullBtnClick{
    
    
    DLLineOrderConfirmController *confirmVC = [[DLLineOrderConfirmController alloc] init];
    
    confirmVC.linePayID = self. tourID;
    
    self.BtnType = @"1";
    confirmVC.BtnType = self.BtnType;
    
    
    [self.navigationController pushViewController:confirmVC animated:YES];
    
    NSLog(@"全款");
}

//尾款
- (IBAction)payTailBtnClick:(id)sender {
    
    DLLineOrderConfirmController *confirmVC = [[DLLineOrderConfirmController alloc] init];
    confirmVC.linePayID = self. tourID;
    
    self.BtnType = @"3";
    confirmVC.BtnType = self.BtnType;
    
    [self.navigationController pushViewController:confirmVC animated:YES];
    
    NSLog(@"尾款");
}


#pragma mark - ------------- fetchData ----------------

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"tour_id":self.tourID,
                            @"sign_token" : [DLUtils getSign_token],
                            };
    @weakify(self);
    
    [DLHomeViewTask getAgencyLineOrderListDetails:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            
            NSDictionary *dict = result[@"list"];
            
            NSString *nameStr = dict[@"name"];
            
            NSString *stateStr = dict[@"state"];
            NSString *create_timeStr = dict[@"create_time"];
            NSString *memoStr = dict[@"memo"];
            
            NSString *client_adult_countStr = dict[@"client_adult_count"];
            NSString *client_child_countStr = dict[@"client_child_count"];
            NSString *start_timeStr = dict[@"start_time"];
            
            //应付金额
            NSString *price_payableStr = dict[@"price_payable"];
            //订单金额
            NSString *price_totalStr = dict[@"price_total"];
            //调整金额
            NSString *price_adjustStr = dict[@"price_adjust"];
            
            
            NSString *pictureStr = dict[@"cover_pic"];
            
            
            if ([stateStr isEqualToString:@"1"]) {
                self.lineOrderStateLabel.text = @"未提交";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
            } else if ([stateStr isEqualToString:@"2"]){
                self.lineOrderStateLabel.text = @"已提交";
                self.lineOrderStateLabel.textColor = [UIColor colorWithHexString:@"#5fc82b"];
            }else if ([stateStr isEqualToString:@"3"]){
                self.lineOrderStateLabel.text = @"已确认待付款";

            }else if ([stateStr isEqualToString:@"4"]){
                self.lineOrderStateLabel.text = @"已取消";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
                self.payTailButton.hidden = YES;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;

            }else if ([stateStr isEqualToString:@"5"]){
                self.lineOrderStateLabel.text = @"已关闭";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
                
                self.payTailButton.hidden = YES;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;
                
            }else if ([stateStr isEqualToString:@"6"]){
                self.lineOrderStateLabel.text = @"已付预付款";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
                
                self.payTailButton.hidden = NO;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;
                
            }else if ([stateStr isEqualToString:@"7"]){
                self.lineOrderStateLabel.text = @"已付全款";
                self.lineOrderStateLabel.textColor =  [UIColor colorWithHexString:@"#5fc82b"];
                self.payTailButton.hidden = YES;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;

            }else if ([stateStr isEqualToString:@"8"]){
                self.lineOrderStateLabel.text = @"已退款";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
                self.payTailButton.hidden = YES;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;

            }else if ([stateStr isEqualToString:@"9"]){
                self.lineOrderStateLabel.text = @"取消中";
                _lineOrderStateLabel.textColor = [UIColor redColor];
                self.payTailButton.hidden = YES;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;

            }else if ([stateStr isEqualToString:@"10"]){
                self.lineOrderStateLabel.text = @"取消中,待退款(供应商确认";
                self.payTailButton.hidden = YES;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;

                self.lineOrderStateLabel.textColor = [UIColor redColor];
            }else if ([stateStr isEqualToString:@"11"]){
                self.lineOrderStateLabel.text = @"拒绝取消订单";
                self.lineOrderStateLabel.textColor= [UIColor redColor];
                self.payTailButton.hidden = YES;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;

            }else if ([stateStr isEqualToString:@"12"]){
                self.lineOrderStateLabel.text = @"取消中,待退款(代理商管理确认)";
                self.payTailButton.hidden = YES;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;

                self.lineOrderStateLabel.textColor = [UIColor redColor];
            }else if ([stateStr isEqualToString:@"13"]){
                self.lineOrderStateLabel.text = @"已取消,已退款";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
                self.payTailButton.hidden = YES;
                self.prepaidBtn.hidden = YES;
                self.payFullBtn.hidden = YES;
            }
            
            if ([memoStr isEqualToString:@""]){
                self.lineOrderMemoLabel.text = @"无";
            }else{
                
                self.lineOrderMemoLabel.text = memoStr;
            }
            
            NSURL *url = [NSURL URLWithString:pictureStr];
            
            [self.lineOrderPicImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
            
            self.lineOrderNameLabel.text = nameStr;
            
            self.lineOrderCreatTimeLabel.text = create_timeStr;
            

            self.lineOrderAdultCountLabel.text = client_adult_countStr;
        
            self.lineOrderChildCountLabel.text =client_child_countStr;

            self.lineOrderPayableLabel.text = [NSString stringWithFormat:@"%.2f",[price_payableStr integerValue]/100.00];
            
            self.lineOrderPriceAdjustLabel.text = [NSString stringWithFormat:@"%.2f",[price_adjustStr integerValue]/100.00];
            
            self.lineOrderPriceTotaLabel.text= [NSString stringWithFormat:@"%.2f",[price_totalStr integerValue]/100.00];
            
            self.lineOrderStartTimeLabel.text = start_timeStr;
            
            
            NSArray *lineOrderDetailArray = [DLLineOrderDetailModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineOrderDetailList removeAllObjects];
            [self.lineOrderDetailList addObjectsFromArray:lineOrderDetailArray];
            
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ----------- UITable View Delegate ----------------

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 1;
//}
//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return MAIN_SCREEN_WIDTH-45;
//}
//
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//
//    
//    cell.accessoryType = UITableViewCellAccessoryNone;

//    return cell;
//    
//}

@end
