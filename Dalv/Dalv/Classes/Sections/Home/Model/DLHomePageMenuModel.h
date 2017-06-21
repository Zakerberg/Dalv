//
//  DLHomePageMenuModel.h
//  Dalv
//
//  Created by Nie on 2017/6/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DLHomeMenuItem;
@class AgencyInfo;

@interface DLHomePageMenuModel : NSObject

@property (nonatomic, strong) NSArray <DLHomeMenuItem *> *columnList;//菜单信息

@property (nonatomic, strong) AgencyInfo *agencyInfo;//顾问详情

@end


// 顾问详情
@interface AgencyInfo : NSObject

/** 运营商id */
@property (nonatomic, copy) NSString *operator_id;

/**顾问id */
@property (nonatomic, copy) NSString *agencyId;

/** 顾问手机号 */
@property (nonatomic, copy) NSString *mobile;

/** 模块排序 */
@property (nonatomic, copy) NSString *column_sort;

/** 顾问名称 */
@property (nonatomic, copy) NSString *name;

/** 顾问头像 */
@property (nonatomic, copy) NSString *head_pic;

@end


// 菜单模型
@interface DLHomeMenuItem : NSObject
/**  首页菜单图标 */
@property (nonatomic, copy) NSString *pic_icon;

/**  首页菜单名称 */
@property (nonatomic, copy) NSString *name;

/**  跳转url */
@property (nonatomic, copy) NSString *url;

/**  跳转type */
@property (nonatomic, copy) NSString *type;

/**  排序 */
@property (nonatomic, copy) NSString *sort;

@end

