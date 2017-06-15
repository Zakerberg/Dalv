//
//  DLCustomerListModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/15.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLCustomerListModel : NSObject

/*
 
 "id": "12",
 "name": "刘振兴",
 "nick_name": "寂寞龙",
 "mobile": "18310084054",
 "head_img": "0",
 "create_time": "2017-06-09 13:37:44"
 
 */

@property(nonatomic,copy)NSString * customerid;
@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * nick_name;
@property(nonatomic,copy)NSString * mobile;
@property(nonatomic,copy)NSString * head_img;
@property(nonatomic,copy)NSString * create_time;

@end
