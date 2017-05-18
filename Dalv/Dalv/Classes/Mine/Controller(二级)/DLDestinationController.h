//
//  DLDestinationController.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^CityBlock)(NSString *);

@interface DLDestinationController : UIViewController
@property (nonatomic ,copy)CityBlock cityBlock;

@end
