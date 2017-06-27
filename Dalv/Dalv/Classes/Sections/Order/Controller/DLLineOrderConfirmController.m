//
//  DLLineOrderConfirmController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ----------------  线路订单确认支付 -----------------

#import "DLLineOrderConfirmController.h"
#import "DLLineOrderController.h"
#import "DLHomeViewTask.h"

@interface DLLineOrderConfirmController ()

/* 线路名称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/* 成人数量 */
@property (weak, nonatomic) IBOutlet UILabel *adultCountLabel;

/* 儿童数量 */
@property (weak, nonatomic) IBOutlet UILabel *childCountLabel;

/* 订单金额 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderMoney;

/* 调整金额 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderAdjustPrice;
/* 应付金额 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPayablePrice;

/* 付款金额 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPayMoneyLabel;

//左边判断是全款 , 预付款 , 尾款Label
@property (weak, nonatomic) IBOutlet UILabel *payMoneyLabel;


//边框成人和儿童的label
@property (weak, nonatomic) IBOutlet UILabel *adultBorderLabel;
@property (weak, nonatomic) IBOutlet UILabel *childBorderLabel;


/* 下面的提示Label */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderTipsLabel;

/* 确认Button */
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

//特别说明
@property (weak, nonatomic) IBOutlet UILabel *memoLabel;

//出发日期
@property (weak, nonatomic) IBOutlet UILabel *starTimeLabel;


//keyID
@property (strong, nonatomic) NSString *keyidStr;

@property(nonatomic,strong) DLLineOrderController * orderVC;


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

#pragma mark ------------- 确认支付 -------------------

- (IBAction)confirmBtnClick:(id)sender {
    
    NSDictionary *param = @{
                            
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            @"line_id":self.linePayID,
                            @"keyid":self.keyidStr
                            };
    //全款
    if ([self.BtnType isEqualToString:@"1"]) {

    [DLHomeViewTask getAgencyLineOrderAllPayed:param completion:^(id result, NSError *error) {
        
        if([result[@"status"] isEqualToString: @"00033"]){

            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您的可用余额不足,请先充值!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [alertV show];
       
        }else{
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }];
        
        //预付款
    }else if ([self.BtnType isEqualToString:@"2"]){
   
        [DLHomeViewTask getAgencyLineOrderPrePayed:param completion:^(id result, NSError *error) {

            if([result[@"status"] isEqualToString: @"00033"]){
                
                UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您的可用余额不足,请先充值!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [alertV show];
                
            }else{
                
                [self.navigationController popViewControllerAnimated:YES];

            }
        }];
        //尾款
    }else if ([self.BtnType isEqualToString:@"3"]){
        
        [DLHomeViewTask getAgencyLineOrderPreForum:param completion:^(id result, NSError *error) {
            
            if([result[@"status"] isEqualToString: @"00033"]){
    
                UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您的可用余额不足,请先充值!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [alertV show];
                
            }else{
                
                [self.navigationController popViewControllerAnimated:YES];
                
            }
        }];
    }
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
        
        NSDictionary *dict = result[@"orderTourList"];
        
        NSString *nameStr = dict[@"name"];
        NSString *adultCountStr = dict[@"client_adult_count"];
        NSString *childCountStr = dict[@"client_child_count"];
        NSString *startTimeStr = dict[@"start_time"];
        //订单金额
        NSString *priceStr = dict[@"price_total"];
        //调整金额
        NSString *adjustStr = dict[@"price_adjust"];
        //应付金额
        NSString *payStr = dict[@"totalMoney"];
        
        //预付款金额 (2,3状态有)
        NSString *prepayStr = dict[@"prepay_amount"];
        
        //特别说明
        NSString *memoStrt = dict[@"memo"];
        
        
        //尾款金额 (3状态有)
        NSString *preForumStr = dict[@"preForum"];
        
        //keyID
//        self.keyidStr = dict[@"keyid"];
        
        //全款 1
        if ([self.BtnType isEqualToString:@"1"]) {
            
            self.payMoneyLabel.text = @"全款金额";
            self.lineOrderTipsLabel.text = @"您确定要支付全款吗?";
            //应付金额
            self.lineOrderPayablePrice.text = [NSString stringWithFormat:@"%.2f",[payStr integerValue]/100.00];
            //keyID
            self.keyidStr = dict[@"keyid"];

            
            //预付款 2
        }else if ([self.BtnType isEqualToString:@"2"]){
            self.payMoneyLabel.text = @"预付款金额";
            self.lineOrderTipsLabel.text = @"您确定要支付预付款吗?";
            //keyID
            self.keyidStr = dict[@"keyid"];

            //预付款
            self.lineOrderPayablePrice.text = [NSString stringWithFormat:@"%.2f",[prepayStr integerValue]/100.00];
            
            //尾款 3
        }else if ([self.BtnType isEqualToString:@"3"]){
            
            self.payMoneyLabel.text = @"尾款金额";
            self.lineOrderTipsLabel.text = @"您确定要支付尾款吗?";
            //keyID
            self.keyidStr = dict[@"keyid"];

            //尾款
            self.lineOrderPayablePrice.text = [NSString stringWithFormat:@"%.2f",[preForumStr integerValue]/100.00];
        }
        
        self.nameLabel.text = nameStr;
        self.adultCountLabel.text = adultCountStr;
        self.childCountLabel.text = childCountStr;
        //订单金额
        self.lineOrderMoney.text = [NSString stringWithFormat:@"%.2f",[priceStr integerValue]/100.00];;
        
        //调整金额
        self.lineOrderAdjustPrice.text = [NSString stringWithFormat:@"%.2f",[adjustStr integerValue]/100.00];;
        
        self.memoLabel.text = memoStrt;
        
        self.starTimeLabel.text = startTimeStr;
    }];
}

@end
