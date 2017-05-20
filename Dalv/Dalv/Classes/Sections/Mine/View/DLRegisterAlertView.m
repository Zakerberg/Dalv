//
//  DLRegisterAlertView.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/19.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRegisterAlertView.h"

@implementation DLRegisterAlertView


- (IBAction)CancelButtonClick:(UIButton *)sender {
}

//普通用户注册
- (IBAction)generalRegisterAction:(UIButton *)sender {
    self.toRegisterVCStr(@"generalVC");
    self.hidden = YES;
    
}

//供应商注册
- (IBAction)supplierRegisterAction:(UIButton *)sender {
    
    self.toRegisterVCStr(@"supplierVC");
    self.hidden = YES;
    
}

@end
