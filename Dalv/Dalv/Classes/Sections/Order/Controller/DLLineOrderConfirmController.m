//
//  DLLineOrderConfirmController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ----------------  线路订单确认支付 -----------------

#import "DLLineOrderConfirmController.h"

@interface DLLineOrderConfirmController ()

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

-(void)fetchData{
    
    
    
    
}

#pragma mark ------------- setButton -------------------

-(void)setButton{
    
    
    
    
    
    
}


@end
