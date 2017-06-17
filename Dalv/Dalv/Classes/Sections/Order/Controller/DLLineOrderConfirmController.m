//
//  DLLineOrderConfirmController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ----------------  线路订单确认支付 -----------------

#import "DLLineOrderConfirmController.h"
#import "DLHomeViewTask.h"

@interface DLLineOrderConfirmController ()

@property(nonatomic,strong) NSString * BtnType;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *adultCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *childCountLabel;

/* 订单金额 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderMoney;

/* 调整金额 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderAdjustPrice;
/* 应付金额 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPayablePrice;

/* 预付款金额 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPayMoneyLabel;


/* 下面的提示Label */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderTipsLabel;

/* 确认Button */
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;


@end

@implementation DLLineOrderConfirmController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
}

#pragma mark ------------- setUI -------------------

-(void)setUI{
    
    self.title = @"确认支付";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

#pragma mark ------------- BtnClick -------------------
- (IBAction)confirmBtnClick:(id)sender {
    
    
    
    
    
}



#pragma mark ------------- fetchData -------------------

/*
 {uid，sign_token ，line_id: (线路订单id)，
 如果付全款页面 click_type =1
 如果付预付款页面 click_type =2
 如果付尾款页面 click_type =3
 }
 */

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            @"line_id":self.linePayID,
                            @"click_type":self.BtnType,
                            };
    
    [DLHomeViewTask getAgencyLineOrderdetailConfirmPayment:param completion:^(id result, NSError *error) {
       
        NSLog(@"%@",result);
    }];
}







































@end
