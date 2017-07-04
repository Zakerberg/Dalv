//
//  DLLineDestinationViewController.h
//  Dalv
//
//  Created by Nie on 2017/6/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLRecommendRouteModel.h"

@interface DLLineDestinationViewController : UIViewController
@property (nonatomic, strong) DLRecommendRouteModel *routeModel;

/**  跳转type */
@property (nonatomic, copy) NSString *type;

/**  跳转标题 */
@property (nonatomic, copy) NSString *name;

@end
