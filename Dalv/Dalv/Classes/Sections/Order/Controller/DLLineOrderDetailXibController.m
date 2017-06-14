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

@property (nonatomic, strong) UITableView *lineOrderDetailTableView;


@property(nonatomic,strong) DLLineOrderDetailModel * lineOrderDetailModel;




@end

@implementation DLLineOrderDetailXibController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    [self setUI];
}


-(void)setUI{
    
    
    self.lineOrderNameLabel.text = self.lineOrderDetailModel.name;
    
}


-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"tour_id":self.lineOrderDetailModel.name,
                            @"sign_token" : [DLUtils getSign_token],
                            };
    @weakify(self);
    [DLHomeViewTask getAgencyLineOrderList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            NSArray *lineOrderDetailArray = [DLLineOrderDetailModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineOrderDetailList removeAllObjects];
            [self.lineOrderDetailList addObjectsFromArray:lineOrderDetailArray];
            [self.lineOrderDetailTableView reloadData];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
