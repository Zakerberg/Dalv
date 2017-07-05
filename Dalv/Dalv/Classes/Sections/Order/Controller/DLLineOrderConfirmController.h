//
//  DLLineOrderConfirmController.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ----------------  线路订单确认支付 -----------------

#import <UIKit/UIKit.h>

@interface DLLineOrderConfirmController : UIViewController
@property(nonatomic,strong) NSString * linePayID;
@property(nonatomic,strong) NSString * BtnType;
///付款成功
@property(nonatomic,strong) NSString * PayedStatus;
@end
