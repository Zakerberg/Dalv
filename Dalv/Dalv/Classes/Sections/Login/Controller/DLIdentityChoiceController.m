//
//  DLIdentityChoiceController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/30.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLIdentityChoiceController.h"

@interface DLIdentityChoiceController ()

@end

@implementation DLIdentityChoiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (BOOL)dl_blueNavbar {
    return YES;
    
}

-(void)setUI{
    
    self.title = @"选择身份登陆";
    self.view.backgroundColor = [UIColor colorWithHexString:@"efefef"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
