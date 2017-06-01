//
//  DLsupplierQueryModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/1.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLsupplierQueryModel : NSObject
/*
 
 "list": [
 {
 "id": "145",                    			供应商id
 "name": "安广利旅游",						供应商名称
 "full_name": "北京众合国际旅行社有限公司",	供应商全称
 "contact_person": "王平",					联系人
 "mobile": "13381002543",					联系人手机号码
 "destinations": "四川"						经销目的地
 }

 */
@property(nonatomic,strong) NSString * name;
@property(nonatomic,strong) NSString * full_name;
@property(nonatomic,strong) NSString * contact_person;
@property(nonatomic,strong) NSString * mobile;
@property(nonatomic,strong) NSString * destinations;
@end
