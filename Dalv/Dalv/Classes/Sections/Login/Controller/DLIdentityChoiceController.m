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
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *logoImageView = [[UIImageView alloc] init];
    [logoImageView setImage:[UIImage imageNamed:@"Loginlogo"]];
    
    [self.view addSubview:logoImageView];
    
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        
        
        
    }];
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
