//
//  DLLineOrderConfirmController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLLineOrderConfirmController.h"
#import "DLLineOrderController.h"
#import "DLHomeViewTask.h"

@interface DLLineOrderConfirmController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *adultCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *childCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *lineOrderMoney;
@property (weak, nonatomic) IBOutlet UILabel *lineOrderAdjustPrice;
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPayablePrice;
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPayMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *payMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *adultBorderLabel;
@property (weak, nonatomic) IBOutlet UILabel *childBorderLabel;
@property (weak, nonatomic) IBOutlet UILabel *lineOrderTipsLabel;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UILabel *memoLabel;
@property (weak, nonatomic) IBOutlet UILabel *starTimeLabel;
@property (strong, nonatomic) NSString *keyidStr;///keyID
@property(nonatomic,strong) DLLineOrderController * orderVC;
@end

@implementation DLLineOrderConfirmController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
}

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


- (IBAction)confirmBtnClick:(id)sender {
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            @"line_id":self.linePayID,
                            @"keyid":self.keyidStr
                            };
    
    if ([self.BtnType isEqualToString:@"1"]) {/// 全款

    [DLHomeViewTask getAgencyLineOrderAllPayed:param completion:^(id result, NSError *error) {
        
        if([result[@"status"] isEqualToString: @"00033"]){

            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您的可用余额不足,请先充值!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [alertV show];
       
        }else{
        
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"payFullMoney" object:sender];
            
            [self.navigationController popViewControllerAnimated:YES];
            
            [self.navigationController popViewControllerAnimated:YES];
            UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"付款成功!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [successV show];
        }
    }];
        
        
    }else if ([self.BtnType isEqualToString:@"2"]){/// 预付款
   
        [DLHomeViewTask getAgencyLineOrderPrePayed:param completion:^(id result, NSError *error) {

            if([result[@"status"] isEqualToString: @"00033"]){
                
                UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您的可用余额不足,请先充值!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [alertV show];
                
            }else{
                
                
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"payPreMoney" object:sender];
                
                [self.navigationController popViewControllerAnimated:YES];
                
                [self.navigationController popViewControllerAnimated:YES];
                UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"付款成功!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [successV show];
            }
        }];
        
    }else if ([self.BtnType isEqualToString:@"3"]){/// 尾款
        
        [DLHomeViewTask getAgencyLineOrderPreForum:param completion:^(id result, NSError *error) {

            if([result[@"status"] isEqualToString: @"00033"]){
    
                UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您的可用余额不足,请先充值!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [alertV show];
                
            }else if ([result[@"status"] isEqualToString: @"00031"]){
              
                UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"运营商账户余额不足，详情请咨询010-85626326!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                
                [alertV show];
                
            }else{
                
                //发送通知
                [[NSNotificationCenter defaultCenter] postNotificationName:@"payTailMoney" object:sender];
                
                [self.navigationController popViewControllerAnimated:YES];
                UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"付款成功!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [successV show];
            }
        }];
    }
}


#pragma mark --- fetchData

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
//      NSString *prepayAmount = dict[@"prepay_amount"];
        
        //尾款金额 (3状态有)
        NSString *preForumStr = dict[@"preForum"];
        
//      keyID
//      self.keyidStr = dict[@"keyid"];
        
        /// 全款 1
        if ([self.BtnType isEqualToString:@"1"]) {
            
            self.payMoneyLabel.text = @"全款金额";
            self.lineOrderTipsLabel.text = @"您确定要支付全款吗?";
            //应付金额
            self.lineOrderPayablePrice.text = [NSString stringWithFormat:@"%.2f",[payStr integerValue]/100.00];
            //keyID
            self.keyidStr = dict[@"keyid"];
            
            //总额
          self.lineOrderPayMoneyLabel.text = [NSString stringWithFormat:@"%.2f",[payStr integerValue]/100.00];
            
            //预付款 2
        }else if ([self.BtnType isEqualToString:@"2"]){
            self.payMoneyLabel.text = @"预付款金额";
            self.lineOrderTipsLabel.text = @"您确定要支付预付款吗?";
            //keyID
            self.keyidStr = dict[@"keyid"];

            //预付款
            self.lineOrderPayablePrice.text = [NSString stringWithFormat:@"%.2f",[prepayStr integerValue]/100.00];
            
              self.lineOrderPayMoneyLabel.text = [NSString stringWithFormat:@"%.2f",[prepayStr integerValue]/100.00];
            
            //尾款 3
        }else if ([self.BtnType isEqualToString:@"3"]){
            
            self.payMoneyLabel.text = @"尾款金额";
            self.lineOrderTipsLabel.text = @"您确定要支付尾款吗?";
            //keyID
            self.keyidStr = dict[@"keyid"];

            //尾款
            self.lineOrderPayablePrice.text = [NSString stringWithFormat:@"%.2f",[preForumStr integerValue]/100.00];
            
            
           self.lineOrderPayMoneyLabel.text = [NSString stringWithFormat:@"%.2f",[preForumStr integerValue]/100.00];
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
