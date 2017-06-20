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

// 8.测试注册时发送短信接口地址
#define DL_LoginAgencyVerificationCode DL_HOST@"index.php/Api/login/agencyVerificationCode"

// 9.测试顾问注册接口地址
#define DL_LoginAgencyRegister DL_HOST@"index.php/Api/login/agencyRegister"

// 10.测试登陆接口地址
#define DL_Login DL_HOST@"index.php/Api/login/agencyIndex"

// 11.测试顾问首页模块接口地址
#define DL_HomeAgencyIndexMod DL_HOST@"index.php/Api/index/agencyIndexMod"

// 12.测试顾问首页线路列表接口地址
#define DL_HomeAgencyLinelist DL_HOST@"index.php/Api/index/agencyIndexLinelist"

// 13.测试顾问（登陆状态）线路详情页接口地址
#define DL_AgencyDetails DL_HOST@"index.php/Api/agency/details"

// 14.测试顾问线路修改标题接口地址
#define DL_AgencyPersonalChangeTitle DL_HOST@"index.php/Api/agency/changeTitle"

// 15.测试顾问线路修改价格页面接口地址
#define DL_AgencyChangePrice DL_HOST@"index.php/Api/agency/changePrice"

// 16.测试顾问线路修改价格处理接口地址
#define DL_AgencyChangePriceHandle DL_HOST@"index.php/Api/agency/changePriceHandle"

// 17.测试顾问推荐线路处理接口地址
#define DL_AgencyRecommend DL_HOST@"index.php/Api/agency/recommend"

// 18.测试顾问提交订单页面接口地址
#define DL_AgencyOrderInfo DL_HOST@"index.php/Api/agency/orderInfo"

// 19.测试顾问提交订单处理接口地址
#define DL_AgencyOrderInfoHandle DL_HOST@"index.php/Api/agency/orderInfoHandle"

// 20.测试顾问个人中心接口地址
#define DL_AgencyPersonal DL_HOST@"index.php/Api/agencyPersonal/index"

// 21.测试修改密码页面接口
#define DL_AgencyEditPass DL_HOST@"index.php/Api/agencyPersonal/agencyEditPass"

// 22.测试顾问修改密码处理接口
#define DL_AgencyEditPassHandle DL_HOST@"index.php/Api/agencyPersonal/agencyEditPassHandle"

// 23.测试顾问页面设置页面接口
#define DL_AgencyPageSetUp DL_HOST@"index.php/Api/agencyPersonal/agencyPageSetUp"

// 24.测试顾问模块排序页面接口
#define DL_AgencyColumnSort DL_HOST@"index.php/Api/agencyPersonal/agencyColumnSort"

// 25.测试顾问模块排序处理接口
#define DL_AgencyColumnSortHandle DL_HOST@"index.php/Api/agencyPersonal/agencyColumnSortHandle"

// 26.测试顾问线路订单列表接口
#define DL_AgencyLineOrder DL_HOST@"index.php/api/Agencypersonal/agencyLineOrder.html"

// 27.测试顾问签证订单列表接口
#define DL_AgencyOrderVisaOrder DL_HOST@"index.php/Api/agencyOrder/visaOrder"

// 28.测试顾问Wifi订单列表接口
#define DL_AgencyOrderWifiOrder DL_HOST@"index.php/Api/agencyOrder/wifiOrder"

// 29.测试顾问其他订单列表接口
#define DL_AgencyOrderOtherOrder DL_HOST@"index.php/Api/agencyOrder/otherOrder"

// 30.测试顾问财务管理列表接口
#define DL_AgencyFinance DL_HOST@"index.php/Api/agencyFinance/index"

// 31.测试顾问财务管理->交易记录接口
#define DL_AgencyFinanceAccountTransaction DL_HOST@"index.php/Api/agencyFinance/accountTransaction"

// 32.测试顾问财务管理->充值申请页面接口
#define DL_AgencyFinanceApplyTopup DL_HOST@"index.php/Api/agencyFinance/applyTopup"

// 33.测试顾问财务管理->充值申请处理接口（线下充值）
#define DL_AgencyFinanceApplyTopupHandle DL_HOST@"index.php/Api/agencyFinance/applyTopupHandle"

// 34.测试顾问财务管理->充值申请记录接口
#define DL_AgencyFinanceTopupList DL_HOST@"index.php/Api/agencyFinance/topupList"

// 35.测试顾问财务管理->提现申请页面接口
#define DL_AgencyFinanceApplyWithdraw DL_HOST@"index.php/Api/agencyFinance/applyWithdraw"

// 36.测试顾问财务管理->提现申请处理接口
#define DL_AgencyFinanceApplyWithdrawHandle DL_HOST@"index.php/Api/agencyFinance/applyWithdrawHandle"

// 37.测试顾问财务管理->提现记录列表接口
#define DL_AgencyFinanceWithdrawList DL_HOST@"index.php/Api/agencyFinance/withdrawList"

// 38.测试顾问财务管理->发票申请页面接口
#define DL_AgencyFinanceApplyInvoicet DL_HOST@"index.php/Api/agencyFinance/applyInvoice"

// 39.测试顾问财务管理->发票申请处理接口
#define DL_AgencyFinanceApplyInvoicetHandle DL_HOST@"index.php/Api/agencyFinance/applyInvoiceHandle"

// 40.测试顾问财务管理->发票记录列表接口
#define DL_AgencyFinanceInvoicetList DL_HOST@"index.php/Api/agencyFinance/invoiceList"

// 41.测试顾问财务管理->合同申请页面接口
#define DL_AgencyFinanceApplyContract DL_HOST@"index.php/Api/agencyFinance/applyContract"

// 42.测试顾问财务管理->合同申请处理接口
#define DL_AgencyFinanceApplyContractHandle DL_HOST@"index.php/Api/agencyFinance/applyContractHandle"

// 43.测试顾问财务管理->合同申请记录列表接口
#define DL_AgencyFinanceContractList DL_HOST@"index.php/Api/agencyFinance/contractList"

// 44.测试顾问个人中心->我的推荐列表接口
#define DL_AgencyFinanceMyRecommend DL_HOST@"index.php/Api/agencyFinance/myrecommend"

// 45.测试顾问个人中心->我的推荐线路删除接口
#define DL_AgencyFinanceMyRecommendDel DL_HOST@"index.php/Api/agencyFinance/myRecommendDel"

// 46.测试顾问个人中心->我的机票列表接口
#define DL_AgencyFlightMyPlaneTicket DL_HOST@"index.php/Api/agencyFlight/myPlaneTicket"

// 47.测试顾问个人中心->我的机票详情接口
#define DL_AgencyFlightPlaneTicketDetail DL_HOST@"index.php/Api/agencyFlight/planeTicketDetail"

// 48.测试顾问个人中心->我的直客页面接口
#define DL_AgencyFlightFlightProfit DL_HOST@"index.php/Api/agencyFlight/flightProfit"

// 49.测试顾问个人中心->我的直客机票订单列表接口
#define DL_AgencyFlightVisitorPlaneTicket DL_HOST@"index.php/Api/agencyFlight/visitorPlaneTicket"

// 50.测试顾问个人中心->我的直客机票订单详情页接口
#define DL_AgencyFlightPlaneProfitDetail DL_HOST@"index.php/Api/agencyFlight/planeProfitDetail"

// 51.测试顾问个人中心->供应商查询页面接口
#define DL_AgencyPersonalProviderQuery DL_HOST@"index.php/Api/agencyPersonal/providerQuery"

//  获取验证码
#define DL_consultGetCode DL_HOST@"index.php/Api/login/agencyVerificationCode"
//  注册
#define DL_ConsultRegister DL_HOST@"index.php/Api/login/agencyRegister"

//  供应商查询
#define DL_providerQuery DL_HOST@"index.php/Api/agencyPersonal/providerQuery"

//  顾客注册的接口
#define DL_CustomerRegister DL_HOST@"index.php/TouristApi/TouristLogin/touristRegister"

// 52.顾问订单列表界面接口
#define DL_AgencyLineOrderList DL_HOST@"index.php/api/AgencyOrder/lineOrder"


// 53.顾问订单详情界面接口
#define DL_AgencyLineOrderListDetails DL_HOST@"index.php/Api/agencyOrder/lineDetails"

// 54.我的直客列表接口
#define DL_AgencyMyCustomerList DL_HOST@"index.php/Api/agencyFlight/visitorList"


// 55.测试顾问线路订单详情页-付全款，付预付，付尾款页面接口
#define DL_AgencyLineOrderDetailConfirmPayment DL_HOST@"index.php/Api/agencyPersonal/agencyShowAllPayed"

// 56.测试首页线路输入搜素接口地址
#define DL_LineSearch DL_HOST@"index.php/Api/index/indexLineSearch"

// 57.测试首页出发城市搜素接口地址
#define DL_DepartureSearch DL_HOST@"index.php/Api/index/indexDepartureSearch"

// 58.测试（首页模块）栏目接口地址（如出境游，国内游等）
#define DL_HomeOutbound DL_HOST@"index.php/Api/Outbound/index"

// 59.测试顾问修改头像处理接口
#define DL_AgencyEditHendImgHandle DL_HOST@"index.php/Api/agencyPersonal/agencyEditHendImgHandle"

// 60.测试详情页地址-目的地图册
#define DL_AgencyMorePics DL_HOST@"index.php/Api/agency/morePics"

//61.测试顾问线路订单详情页-付全款处理接口
#define DL_AgencyAllpayed DL_HOST@"index.php/Api/agencyPersonal/agencyAllPayed"


//62.测试顾问线路订单详情页-付预付款处理接口
#define DL_AgencyPrePayed DL_HOST@"index.php/Api/agencyPersonal/agencyPrePayed"


//63.测试顾问线路订单详情页-付尾款处理接口
#define DL_AgencyPreForum DL_HOST@"index.php/Api/agencyPersonal/agencyPreForum"

//64.测试顾问个人资料设置页面接口
#define DL_AgencyPersonalPageSetUp DL_HOST@"index.php/Api/agencyPersonal/agencyPageSetUp"

//65.测试顾问个人资料设置页面接口
#define DL_AgencyPersonalSetUpHandle DL_HOST@"index.php/Api/agencyPersonal/agencyPageSetUpHandle"



#endif /* InterfaceConfig_h */
