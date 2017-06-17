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

@end

@implementation DLLineOrderConfirmController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
    [self setButton];

}

#pragma mark ------------- setUI -------------------

-(void)setUI{
    
    self.title = @"确认支付";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}

- (BOOL)dl_blueNavbar {
    return YES;
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
    
    
    
    
    
    
    
    
    
    
}

#pragma mark ------------- setButton -------------------

-(void)setButton{
    
    
    
    
}


@end
