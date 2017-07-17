//
//  DLPlaneTicketViewController.h
//  Dalv
//
//  Created by Nie on 2017/7/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------- 首页机票 ----------------------

#import <UIKit/UIKit.h>

@interface DLPlaneTicketViewController : UIViewController
@property(nonatomic,strong) UILabel * starLabel;/// 出发城市
@property(nonatomic,strong) UILabel * destinationLabel;/// 目的地城市
@property(nonatomic,strong) UILabel * startDate;/// 出发日期
@end
