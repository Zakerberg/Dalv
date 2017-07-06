//
//  DLSupplierQueryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------- 供应商查询 ---- ---------------

#import "DLSupplierQueryController.h"

@interface DLSupplierQueryController ()

@end

@implementation DLSupplierQueryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI{
    self.title = @"";
}

-(void)fetchData{
    
}

@end
