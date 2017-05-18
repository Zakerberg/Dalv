//
//  InterfaceConfig.h
//  Dalv
//
//  Created by Nie on 2017/5/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#ifndef InterfaceConfig_h
#define InterfaceConfig_h


// 接口服务器
#define DL_HOST @"http://dalvuapi.dalvu.com/"

// 1.测试默认首页地址
#define DL_HomeRequest DL_HOST@"index.php/Api/index/index"

// 2.测试登陆接口地址
#define DL_Login DL_HOST@"index.php/Api/login/agencyIndex"

// 3.测试顾问首页接口地址
#define DL_AgencyHome DL_HOST@"index.php/Api/index/agencyIndex"

// 4.测试顾问个人中心接口地址
#define DL_AgencyPersonal DL_HOST@"index.php/Api/agencyPersonal/index"

// 5.测试顾问修改密码接口页面
#define DL_AgencyPersonalEditPass DL_HOST@"index.php/Api/agencyPersonal/agencyEditPass"

// 6.测试顾问修改密码处理接口
#define DL_AgencyPersonalEditPassHandle DL_HOST@"index.php/Api/agencyPersonal/agencyEditPassHandle"

// 7.测试顾问页面设置页面接口
#define DL_AgencyPersonalPageSetUp DL_HOST@"index.php/Api/agencyPersonal/agencyPageSetUp"

// 8.测试顾问模块排序页面接口
#define DL_AgencyPersonalColumnSort DL_HOST@"index.php/Api/agencyPersonal/agencyColumnSort"

// 9.测试顾问模块排序处理接口
#define DL_AgencyPersonalColumnSortHandle DL_HOST@"index.php/Api/agencyPersonal/agencyColumnSortHandle"

// 10.测试顾问线路订单列表接口
#define DL_AgencyPersonalLineOrder DL_HOST@"index.php/api/Agencypersonal/agencyLineOrder.html"


#endif /* InterfaceConfig_h */
