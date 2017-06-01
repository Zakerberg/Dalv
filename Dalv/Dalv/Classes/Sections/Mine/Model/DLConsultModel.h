//
//  DLConsultModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
name：姓名
province ： 城市 选择，1北京市，3天津市，4石家庄市，5唐山市，1其他（并附加输入框，附件一个参数 thecity）
phone：手机
vercode ：验证码  
password：密码
vocation ：职务（员工，导游）
*/

@interface DLConsultModel : NSObject
@property(nonatomic,strong) NSString * Name;
@property(nonatomic,strong) NSString * province;
@property(nonatomic,strong) NSString * phone;
@property(nonatomic,strong) NSString * vercode;
@property(nonatomic,strong) NSString * password;
@property(nonatomic,strong) NSString * vocation;
@end
