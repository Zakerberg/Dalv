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

// 1.测试默认首页模块地址
#define DL_HomeIndexMod DL_HOST@"index.php/Api/index/indexMod"

// 2.测试默认首页线路列表地址
#define DL_HomeIndexLineList DL_HOST@"index.php/Api/index/indexLineList"

// 3.测试默认详情页地址：①
#define DL_LineDetials DL_HOST@"index.php/Api/index/details"

// 4.测试详情页地址-行程安排：②
#define DL_LineDetialsScheduling DL_HOST@"index.php/Api/index/detailsScheduling"

// 5测试详情页地址-产品亮点：③
#define DL_LineDetialsEdge DL_HOST@"index.php/Api/index/detailsEdge"

// 6.测试详情页地址-费用说明：④
#define DL_LineDetialsCostExplain DL_HOST@"index.php/Api/index/detailsCostExplain"

// 7.测试详情页地址-注意事项：⑤
#define DL_LineDetialsNotice DL_HOST@"index.php/Api/index/detailsNotice"

// 8.测试登陆接口地址
#define DL_Login DL_HOST@"index.php/Api/login/agencyIndex"

// 9.测试顾问首页模块接口地址
#define DL_HomeAgencyIndexMod DL_HOST@"index.php/Api/index/agencyIndexMod"

// 10.测试顾问首页线路列表接口地址
#define DL_HomeAgencyLinelist DL_HOST@"index.php/Api/index/agencyIndexLinelist"

// 11.测试顾问（登陆状态）线路详情页接口地址
#define DL_AgencyDetails DL_HOST@"index.php/Api/agency/details"

//// 12.测试顾问线路修改标题接口地址  暂无有问题
//#define DL_AgencyDetails DL_HOST@"index.php/Api/agencyPersonal/index"

// 13.测试顾问个人中心接口地址
#define DL_AgencyPersonal DL_HOST@"/index.php/Api/agencyPersonal/index"

// 14.测试顾问修改密码页面接口
#define DL_AgencyEditPass DL_HOST@"index.php/Api/agencyPersonal/agencyEditPass"

// 15.测试顾问修改密码处理接口
#define DL_AgencyEditPassHandle DL_HOST@"index.php/Api/agencyPersonal/agencyEditPassHandle"

// 16.测试顾问页面设置页面接口
#define DL_AgencyPageSetUp DL_HOST@"index.php/Api/agencyPersonal/agencyPageSetUp"

// 17.测试顾问模块排序页面接口
#define DL_AgencyColumnSort DL_HOST@"index.php/Api/agencyPersonal/agencyColumnSort"

// 18.测试顾问模块排序处理接口
#define DL_AgencyColumnSortHandle DL_HOST@"index.php/Api/agencyPersonal/agencyColumnSortHandle"

// 19.测试顾问线路订单列表接口
#define DL_AgencyLineOrder DL_HOST@"index.php/api/Agencypersonal/agencyLineOrder.html"

// 20.测试顾问签证订单列表接口
#define DL_AgencyOrderVisaOrder DL_HOST@"index.php/Api/agencyOrder/visaOrder"

// 21.测试顾问Wifi订单列表接口
#define DL_AgencyOrderWifiOrder DL_HOST@"index.php/Api/agencyOrder/wifiOrder"

// 22.测试顾问其他订单列表接口
#define DL_AgencyOrderOtherOrder DL_HOST@"index.php/Api/agencyOrder/otherOrder"

// 23.测试顾问财务管理列表接口
#define DL_AgencyFinance DL_HOST@"index.php/Api/agencyFinance/index"

// 24.测试顾问财务管理->交易记录接口
#define DL_AgencyFinanceAccountTransaction DL_HOST@"index.php/Api/agencyFinance/accountTransaction"

// 25.测试顾问财务管理->充值申请页面接口
#define DL_AgencyFinanceApplyTopup DL_HOST@"index.php/Api/agencyFinance/applyTopup"

// 26.测试顾问财务管理->充值申请处理接口（线下充值）
#define DL_AgencyFinanceApplyTopupHandle DL_HOST@"index.php/Api/agencyFinance/applyTopupHandle"

// 27.测试顾问财务管理->充值申请记录接口
#define DL_AgencyFinanceTopupList DL_HOST@"index.php/Api/agencyFinance/topupList"

// 28.测试顾问财务管理->提现申请页面接口
#define DL_AgencyFinanceApplyWithdraw DL_HOST@"index.php/Api/agencyFinance/applyWithdraw"

// 29.测试顾问财务管理->提现申请页面接口
#define DL_AgencyFinanceApplyWithdrawHandle DL_HOST@"index.php/Api/agencyFinance/applyWithdrawHandle"

// 30.测试顾问财务管理->提现记录列表接口
#define DL_AgencyFinanceWithdrawList DL_HOST@"index.php/Api/agencyFinance/withdrawList"

// 31.测试顾问财务管理->发票申请页面接口
#define DL_AgencyFinanceApplyInvoicet DL_HOST@"index.php/Api/agencyFinance/applyInvoice"

// 32.测试顾问财务管理->发票申请处理接口
#define DL_AgencyFinanceApplyInvoicetHandle DL_HOST@"index.php/Api/agencyFinance/applyInvoiceHandle"

// 33.测试顾问财务管理->发票记录列表接口
#define DL_AgencyFinanceInvoicetList DL_HOST@"index.php/Api/agencyFinance/invoiceList"

// 34.测试顾问财务管理->合同申请页面接口
#define DL_AgencyFinanceApplyContract DL_HOST@"index.php/Api/agencyFinance/applyContract"

// 35.测试顾问财务管理->合同申请处理接口
#define DL_AgencyFinanceApplyContractHandle DL_HOST@"index.php/Api/agencyFinance/applyContractHandle"

// 36.测试顾问财务管理->合同申请记录列表接口
#define DL_AgencyFinanceContractList DL_HOST@"index.php/Api/agencyFinance/contractList"

// 37.测试顾问个人中心->我的推荐列表接口
#define DL_AgencyFinanceMyRecommend DL_HOST@"index.php/Api/agencyFinance/myrecommend"

//  获取验证码
#define DL_consultGetCode DL_HOST@"index.php/Api/login/agencyVerificationCode"
//  注册
#define DL_ConsultRegister DL_HOST@"index.php/Api/login/agencyRegister"

//  供应商查询
#define DL_providerQuery DL_HOST@"index.php/Api/agencyPersonal/providerQuery"


//  顾客注册的接口
#define  DL_CustomerRegister DL_HOST@"index.php/TouristApi/TouristLogin/touristRegister"



#endif /* InterfaceConfig_h */
