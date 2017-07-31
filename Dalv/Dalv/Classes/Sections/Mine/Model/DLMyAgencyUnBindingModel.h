//
//  DLMyAgencyUnBindingModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLMyAgencyUnBindingModel : NSObject
/*
 "id": "295",							顾问id
 "name": "杨小毛",						顾问姓名
 "integral": "70",						顾问积分
 "head_pic": 				"http://file.m.lydlr.com/c/300/300/agency/20170117/587dcb30c43c3.jpg",   头像
 "sex": "1",							顾问性别
 "working_time": "10"					工作时间
 */

/** 顾问id **/
@property(nonatomic,copy) NSString *myAgencyId;
/** 顾问姓名 **/
@property(nonatomic,copy) NSString *name;
/** 顾问积分 **/
@property(nonatomic,copy) NSString *integral;
/** 头像 **/
@property(nonatomic,copy) NSString *head_pic;
/** 顾问性别 **/
@property(nonatomic,copy) NSString *sex;
/** 工作时间 **/
@property(nonatomic,copy) NSString *working_time;

@end
