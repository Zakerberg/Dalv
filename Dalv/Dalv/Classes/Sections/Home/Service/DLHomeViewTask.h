//
//  DLHomeViewTask.h
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLHomeViewTask : NSObject

/**
 * 1 测试默认首页模块地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getHomeIndexMod:(NSDictionary *)param
             completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 2 测试默认首页线路列表地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getHomeIndexLineList:(NSDictionary *)param
                  completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 3 测试默认详情页地址：①
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getLineDetials:(NSDictionary *)param
           completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 4 测试详情页地址-行程安排：②
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getLineDetialsScheduling:(NSDictionary *)param
            completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 5 测试详情页地址-产品亮点：③
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getLineDetialsEdge:(NSDictionary *)param
            completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 6 测试详情页地址-费用说明：④
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getLineDetialsCostExplain:(NSDictionary *)param
            completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 7 测试详情页地址-注意事项：⑤
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getLineDetialsNotice:(NSDictionary *)param
            completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 8 测试注册时发送短信接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getLoginAgencyVerificationCode:(NSDictionary *)param
                  completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 9 测测试顾问注册接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getLoginAgencyRegister:(NSDictionary *)param
                  completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 10 测试登陆接口地址
 *  @param phoneStr 用户名：手机号
 *  @param password 密码
 *  @param completionHandler 完成后的回调
 */

//+ (void)loginWithUserName:(NSString *)phoneStr
//                 password:(NSString *)password
//               completion:(void (^)(id result, NSError *error))completionHandler;
+ (void)getLogin:(NSDictionary *)param
                    completion:(void (^)(id result, NSError *error))completionHandler;



/**
 * 11 测试顾问首页模块接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getHomeAgencyIndexModl:(NSDictionary *)param
                    completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 12 测试顾问首页线路列表接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getHomeAgencyLinelist:(NSDictionary *)param
                   completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 13 测试顾问（登陆状态）线路详情页接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyDetails:(NSDictionary *)param
              completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 14 测试顾问线路修改标题接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyPersonalChangeTitle:(NSDictionary *)param
              completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 15 测试顾问线路修改价格页面接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyChangePrice:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 16 测试顾问线路修改价格处理接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyChangePriceHandle:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 17 测试顾问推荐线路处理接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyRecommend:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 18 测试顾问提交订单页面接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyOrderInfo:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 19 测试顾问提交订单处理接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyOrderInfoHandle:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 20 测试顾问个人中心接口地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyPersonal:(NSDictionary *)param
               completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 21 测试顾问修改密码页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyEditPass:(NSDictionary *)param
               completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 22 测试顾问修改密码处理接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyEditPassHandle:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 23 测试顾问页面设置页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyPageSetUp:(NSDictionary *)param
                completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 24 测试顾问模块排序页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyColumnSort:(NSDictionary *)param
                 completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 25 测试顾问模块排序处理接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyColumnSortHandle:(NSDictionary *)param
                       completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 26 测试顾问线路订单列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyLineOrder:(NSDictionary *)param
                completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 27 测试顾问签证订单列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyOrderVisaOrder:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 28 测试顾问Wifi订单列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyOrderWifiOrder:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler;
/**
 * 29 测试顾问其他订单列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyOrderOtherOrder:(NSDictionary *)param
                      completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 30 测试顾问财务管理列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinance:(NSDictionary *)param
              completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 31 测试顾问财务管理->交易记录接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceAccountTransaction:(NSDictionary *)param
                                completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 32 测试顾问财务管理->充值申请页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceApplyTopup:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 33 测试顾问财务管理->充值申请处理接口（线下充值)
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceApplyTopupHandle:(NSDictionary *)param
                              completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 34 测试顾问财务管理->充值申请记录接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceTopupList:(NSDictionary *)param
                       completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 35 测试顾问财务管理->提现申请页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceApplyWithdraw:(NSDictionary *)param
                           completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 36 测试顾问财务管理->提现申请处理接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceApplyWithdrawHandle:(NSDictionary *)param
                                 completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 37 测试顾问财务管理->提现记录列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceWithdrawList:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 38 测试顾问财务管理->发票申请页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceApplyInvoicet:(NSDictionary *)param
                           completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 39 测试顾问财务管理->发票申请处理接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceApplyInvoicetHandle:(NSDictionary *)param
                                 completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 40 测试顾问财务管理->发票记录列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceInvoicetList:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 41 测试顾问财务管理->合同申请页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceApplyContract:(NSDictionary *)param
                           completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 42 测试顾问财务管理->合同申请处理接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceApplyContractHandle:(NSDictionary *)param
                                 completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 43 测试顾问财务管理->合同申请记录列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceContractList:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 44 测试顾问个人中心->我的推荐列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceMyRecommend:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 45 测试顾问个人中心->我的推荐线路删除接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFinanceMyRecommendDel:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 46 测试顾问个人中心->我的机票列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFlightMyPlaneTicket:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 47 测试顾问个人中心->我的机票详情接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFlightPlaneTicketDetail:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 48 测试顾问个人中心->我的直客页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFlightFlightProfit:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 49 测试顾问个人中心->我的直客机票订单列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFlightVisitorPlaneTicket:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 50 测试顾问个人中心->我的直客机票订单详情页接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyFlightPlaneProfitDetail:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 51 测试顾问个人中心->供应商查询页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyPersonalProviderQuery:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 52 测试顾订单->线路订单页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyLineOrderList:(NSDictionary *)param
                            completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 53 测试顾订单->线路订单详情页面接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyLineOrderListDetails:(NSDictionary *)param
                    completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 54 测试顾问个人中心->我的直客列表接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyMyCustomerList:(NSDictionary *)param
                           completion:(void (^)(id result, NSError *error))completionHandler;



/**
 * 55 测试详情页地址-目的地图册
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getAgencyMorePics:(NSDictionary *)param
             completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 56 测试详情页地址-确认支付界面

 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getAgencyLineOrderdetailConfirmPayment:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 57 测试顾问线路订单详情页-付全款处理接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getAgencyLineOrderAllPayed:(NSDictionary *)param
                                    completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 58 测试顾问线路订单详情页-付预付款处理接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getAgencyLineOrderPrePayed:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 59 测试顾问线路订单详情页-付尾款处理接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getAgencyLineOrderPreForum:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 60 测试首页线路输入搜素接口地址
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getLineSearch:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 61 测试首页出发城市搜素接口地址
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getDepartureSearc:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 62 测试（首页模块）栏目接口地址（如出境游，国内游等）
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getHomeOutbound:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 63 测试顾问修改头像处理接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getAgencyEditHendImgHandle:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 64 测试顾问个人资料设置页面接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getAgencyPersonalPageSetUp:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 65 测试顾问个人资料设置处理接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getAgencyPersonaSetUpHandle:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 66 测试普通用户绑定前获取验证码地址接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristVerificationCode:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 67 测试普通用户绑定并直接登陆地址接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristLoginRegister:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 68 测试普通用户-绑定顾问后首页模块接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristAgencyIndexMod:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler;



/**
 * 69 测试普通用户个人中心地址接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristPersonalIndex:(NSDictionary *)param
                      completion:(void (^)(id result, NSError *error))completionHandler;




/**
 * 70 测试普通用户个人中心-我的顾问（已绑定）详情地址接口：
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristPersonalMyAgenct:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 71 测试普通用户个人中心-我的顾问（未绑定）列表地址接口：
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristPersonalMyAgenctUnBinding:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 72 测试（首页模块）栏目二级列表接口地址（如出境游，国内游等
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getOutboundLists:(NSDictionary *)param
                                 completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 73 测试普通用户修改个人资料页面地址接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristPersonPageData:(NSDictionary *)param
              completion:(void (^)(id result, NSError *error))completionHandler;



/**
 * 74 测试普通用户修改个人资料处理地址接口：
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristPersonPageDataHandle:(NSDictionary *)param
                      completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 75 测试普通用户个人中心-我的顾问（已绑定）解绑接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristPersonPageUnbundingAgency:(NSDictionary *)param
                            completion:(void (^)(id result, NSError *error))completionHandler;

/**
 * 76 测试普通用户-绑定顾问后首页模块接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

//+ (void)getTouristAgencyIndexMod:(NSDictionary *)param
//                                 completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 77 测试普通用户-绑定顾问后首页线路列表接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristAgencyIndexLinelist:(NSDictionary *)param
                      completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 78 测试普通用户-绑定顾问后线路详情接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristIndexDetails:(NSDictionary *)param
                      completion:(void (^)(id result, NSError *error))completionHandler;


/**
 * 76 测试普通用户个人中心-我的顾问（未绑定）绑定接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristPersonlBindingAgency:(NSDictionary *)param
                                 completion:(void (^)(id result, NSError *error))completionHandler;




/**
 * 77 测试普通用户个人中心-我的顾问（未绑定）详情页地址接口
 
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */

+ (void)getTouristPersonlAgencyDetails:(NSDictionary *)param
                            completion:(void (^)(id result, NSError *error))completionHandler;
@end
