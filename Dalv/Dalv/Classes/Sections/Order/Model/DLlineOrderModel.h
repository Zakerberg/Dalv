//
//  DLlineOrderModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLlineOrderModel : NSObject
@property(nonatomic,copy) NSString *lineId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *start_time;
@property(nonatomic,copy) NSString *price_total;
@property(nonatomic,copy) NSString *price_adjust;
@property(nonatomic,copy) NSString *state;
@property(nonatomic,copy) NSString *cover_pic;
@property(nonatomic,copy) NSString *price_payable;
@end
