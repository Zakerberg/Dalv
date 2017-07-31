//
//  DLPlaneTicketListViewController.h
//  Dalv
//
//  Created by Nie on 2017/7/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import <UIKit/UIKit.h>
@interface DLPlaneTicketListViewController : UIViewController
@property (nonatomic,strong) NSMutableArray * planeListDataArr;
@property (nonatomic,strong) NSMutableArray * PlanepriceArr;
/// 出发时间
@property(nonatomic,strong) NSString * timestart;
/// 达到城市
@property(nonatomic,strong) NSString * destination;
/// 出发城市
@property(nonatomic,strong) NSString * departure;
@property(nonatomic,strong) NSArray * nextArr;
@end
