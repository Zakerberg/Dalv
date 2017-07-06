//
//  DLSupplierQueryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------- 供应商查询 --------------------

#import "DLSupplierQueryController.h"
#import "DLHomeViewTask.h"

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

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI{
    
    self.title = @"供应商查询";
    
    
    
    
    
    
    
    
}

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token]
                            };
    
    [DLHomeViewTask getAgencyPersonalProviderQuery:param completion:^(id result, NSError *error) {
       
        
        NSLog(@"%@",result);
        
    }];
    
    
    
    
}

@end
