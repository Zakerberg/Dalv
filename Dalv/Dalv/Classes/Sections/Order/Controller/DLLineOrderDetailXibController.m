//
//  DLLineOrderDetailXibController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderDetailXibController.h"
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

//@property (nonatomic, strong) UITableView *lineOrderDetailTableView;


@property(nonatomic,strong) DLLineOrderDetailModel * lineOrderDetailModel;




@end

@implementation DLLineOrderDetailXibController



-(void)viewWillAppear:(BOOL)animated {
    
    
    self.lineOrderNameLabel.text = self.lineOrderDetailModel.name;
    self.lineOrderStateLabel.text = self.lineOrderDetailModel.state;
    
    
    self.lineOrderCreatTimeLabel.text = self.lineOrderDetailModel.create_time;
    
    self.lineOrderAdultCountLabel.text = self.lineOrderDetailModel.client_adult_count;
    self.lineOrderChildCountLabel.text = self.lineOrderDetailModel.client_child_count;
    
    self.lineOrderPriceTotaLabel.text = self.lineOrderDetailModel.price_total;
    self.lineOrderStartTimeLabel.text = self.lineOrderDetailModel.start_time;
    
    self.lineOrderPriceAdjustLabel.text = self.lineOrderDetailModel.price_adjus;
    
    self.lineOrderPayableLabel.text = self.lineOrderDetailModel.price_payable;
    
    self.lineOrderMemoLabel.text = self.lineOrderDetailModel.memo;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
}


-(void)setUI{
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

}


-(void)fetchData{
    
//    NSDictionary *param = @{
//                            @"uid":[DLUtils getUid],
//                            @"tour_id":@"802",
//                            @"sign_token" : [DLUtils getSign_token],
//                            };
//    @weakify(self);
//    
//    [DLHomeViewTask getAgencyLineOrderListDetails:param completion:^(id result, NSError *error) {
//        @strongify(self);
//        if (result) {
//            NSArray *lineOrderDetailArray = [DLLineOrderDetailModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
//            [self.lineOrderDetailList removeAllObjects];
//            [self.lineOrderDetailList addObjectsFromArray:lineOrderDetailArray];
//            [self.view reloadInputViews];
//        } else {
//            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
//        }
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
