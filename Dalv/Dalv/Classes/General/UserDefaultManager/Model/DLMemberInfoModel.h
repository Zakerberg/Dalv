//
//  DLMemberInfoModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/1.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLMemberInfoModel : NSObject<NSCoding>
@property (nonatomic,strong)NSString *u_id;//用户id
@property (nonatomic,strong)NSString *userPassword;//密码
@property (nonatomic,strong)NSString *u_icon;//用户头像
@property (nonatomic,strong)NSString *u_r_id;//角色id
@property (nonatomic,strong)NSString *u_type;//用户类型
@property (nonatomic,strong)NSString *u_typename;//用户类型
//@property (nonatomic,strong)NSString *u_truename;//真名 ? 
@property (nonatomic,strong)NSString *u_mobile;//手机号
@property (nonatomic,strong)NSString *token;//token
@property (nonatomic,assign)double u_amount_avail;//可用余额
@property (nonatomic,assign)double u_amount_frozen;//冻结余额
@end
