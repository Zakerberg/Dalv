//
//  DLOptionModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 
 status = 00000;
	sign_token = 5c412fb8536ac336a8714ce1aa4e3e17;
	title = 财务管理;
	msg = 成功;
	uid = 1132;
	agencyInfo = {
	mobile = 13126997216;
	id = 295;
	availableBalance = 22099;
	account_balance = 24099;
	freezeMoney = 2000;
	share_home_title = 我的旅行社;
	name = 杨小毛;
	operator_id = 1;
 */

@interface DLOptionModel : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, weak) NSString *title;
@property (nonatomic, weak) NSString *msg;
@property (nonatomic, weak) NSString *mobile;
@property (nonatomic, weak) NSString *id;
@property (nonatomic, weak) NSString *availableBalance;
@property (nonatomic, weak) NSString *account_balance;
@property (nonatomic, weak) NSString *freezeMoney;
@property (nonatomic, weak) NSString *share_home_title;
@property (nonatomic, weak) NSString *name;
@property (nonatomic, weak) NSString *operator_id;
@property(nonatomic,strong) NSDictionary * agencyInfo;


+(instancetype)dLOptionModelWithDict:(NSDictionary *)dict;
@end
