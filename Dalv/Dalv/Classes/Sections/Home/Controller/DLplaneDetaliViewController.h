//
//  DLplaneDetaliViewController.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------ 机票订单舱位列表详情界面 ----------------

#import <UIKit/UIKit.h>

@interface DLplaneDetaliViewController : UIViewController
@property (nonatomic,strong) NSMutableArray * planeListDataArr;
/// 达到城市
@property(nonatomic,strong) NSString * destination;
/// 出发城市
@property(nonatomic,strong) NSString * departure;

@end
