//
//  DLLineOrderDetailModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLLineOrderDetailModel : NSObject
@property(nonatomic,copy) NSString *lineDetailId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *client_adult_count;
@property(nonatomic,copy) NSString *client_child_count;
@property(nonatomic,copy) NSString *start_time;
@property(nonatomic,copy) NSString *price_total;
@property(nonatomic,copy) NSString *price_adjus;
@property(nonatomic,copy) NSString *create_time;
@property(nonatomic,copy) NSString *state;
@property(nonatomic,copy) NSString *cover_pic;
@property(nonatomic,copy) NSString *memo;
@property(nonatomic,copy) NSString *price_payable;
@end
