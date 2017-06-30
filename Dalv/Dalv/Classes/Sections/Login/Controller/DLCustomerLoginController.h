//
//  DLCustomerLoginController.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/21.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ------------------  顾客登录   -------------------

#import <UIKit/UIKit.h>

@interface DLCustomerLoginController : UIViewController
//绑定状态
@property(nonatomic,strong) NSString* BindingStateStr;
//用户类型
@property(nonatomic,strong) NSString* userTypeStr;
@end
