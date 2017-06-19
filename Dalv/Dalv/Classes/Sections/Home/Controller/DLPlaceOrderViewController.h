//
//  DLPlaceOrderViewController.h
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineTourDetailInforModel.h"
#import "DLRecommendRouteModel.h"
@interface DLPlaceOrderViewController : UIViewController
/// 传入线路模型
@property (nonatomic, strong) DLLineTourDetailInforModel *detaiInfoModel;
@property (nonatomic, strong) DLRecommendRouteModel *routeModel;

@end
