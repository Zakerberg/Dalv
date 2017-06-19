//
//  DLHomeViewTask.m
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomeViewTask.h"

@implementation DLHomeViewTask

+ (void)getHomeIndexMod:(NSDictionary *)param
             completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_HomeIndexMod param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getHomeIndexLineList:(NSDictionary *)param
                  completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_HomeIndexLineList param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getLineDetials:(NSDictionary *)param
            completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_LineDetials param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getLineDetialsScheduling:(NSDictionary *)param
            completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_LineDetialsScheduling param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getLineDetialsEdge:(NSDictionary *)param
            completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_LineDetialsEdge param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getLineDetialsCostExplain:(NSDictionary *)param
            completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_LineDetialsCostExplain param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getLineDetialsNotice:(NSDictionary *)param
               completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_LineDetialsNotice param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getLoginAgencyVerificationCode:(NSDictionary *)param
                  completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_LoginAgencyVerificationCode param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getLoginAgencyRegister:(NSDictionary *)param
                  completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_LoginAgencyRegister param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

//+ (void)loginWithUserName:(NSString *)phoneStr
//                 password:(NSString *)password
//               completion:(void (^)(id result, NSError *error))completionHandler {
//    
//    NSDictionary * param = [[NSMutableDictionary alloc]init];
//    [param setValue:phoneStr forKey:@""];
//    
//    [DLRequestSerVice POST:DL_Login param:param success:^(id responseData) {
//        completionHandler ? completionHandler (responseData, nil) : nil;
//    } failure:^(NSError *error) {
//        completionHandler ? completionHandler (nil, error) : nil;
//    }];
//    
//}
+ (void)getLogin:(NSDictionary *)param
      completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_Login param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}




+ (void)getHomeAgencyIndexModl:(NSDictionary *)param
                    completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_HomeAgencyIndexMod param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getHomeAgencyLinelist:(NSDictionary *)param
                   completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_HomeAgencyLinelist param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getAgencyDetails:(NSDictionary *)param
              completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyDetails param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyPersonalChangeTitle:(NSDictionary *)param
              completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyPersonalChangeTitle param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyChangePrice:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyChangePrice param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyChangePriceHandle:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyChangePriceHandle param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyRecommend:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyRecommend param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyOrderInfo:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyOrderInfo param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyOrderInfoHandle:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyOrderInfoHandle param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}


+ (void)getAgencyPersonal:(NSDictionary *)param
               completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyPersonal param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyEditPass:(NSDictionary *)param
               completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyEditPass param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyEditPassHandle:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyEditPassHandle param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyPageSetUp:(NSDictionary *)param
                completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyPageSetUp param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyColumnSort:(NSDictionary *)param
                 completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyColumnSort param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyColumnSortHandle:(NSDictionary *)param
                       completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyColumnSortHandle param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyLineOrder:(NSDictionary *)param
                completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyLineOrder param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyOrderVisaOrder:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyOrderVisaOrder param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyOrderWifiOrder:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyOrderWifiOrder param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyOrderOtherOrder:(NSDictionary *)param
                      completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyOrderOtherOrder param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinance:(NSDictionary *)param
              completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinance param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceAccountTransaction:(NSDictionary *)param
                                completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceAccountTransaction param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceApplyTopup:(NSDictionary *)param
                        completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceApplyTopup param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceApplyTopupHandle:(NSDictionary *)param
                              completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceApplyTopupHandle param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceTopupList:(NSDictionary *)param
                       completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceTopupList param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceApplyWithdraw:(NSDictionary *)param
                           completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceApplyWithdraw param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceApplyWithdrawHandle:(NSDictionary *)param
                                 completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceApplyWithdrawHandle param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceWithdrawList:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceWithdrawList param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceApplyInvoicet:(NSDictionary *)param
                           completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceApplyInvoicet param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceApplyInvoicetHandle:(NSDictionary *)param
                                 completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceApplyInvoicetHandle param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceInvoicetList:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceInvoicetList param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceApplyContract:(NSDictionary *)param
                           completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceApplyContract param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceApplyContractHandle:(NSDictionary *)param
                                 completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceApplyContractHandle param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

//合同申请记录列表
+ (void)getAgencyFinanceContractList:(NSDictionary *)param
                          completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceContractList param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceMyRecommend:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceMyRecommend param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFinanceMyRecommendDel:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceMyRecommendDel param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFlightMyPlaneTicket:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFlightMyPlaneTicket param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFlightPlaneTicketDetail:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFlightPlaneTicketDetail param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFlightFlightProfit:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFlightFlightProfit param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFlightVisitorPlaneTicket:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFlightVisitorPlaneTicket param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyFlightPlaneProfitDetail:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFlightPlaneProfitDetail param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}

+ (void)getAgencyPersonalProviderQuery:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyPersonalProviderQuery param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}


//线路订单界面接口
+ (void)getAgencyLineOrderList:(NSDictionary *)param
                    completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_AgencyLineOrderList param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}


//线路订单详情页面接口
+ (void)getAgencyLineOrderListDetails:(NSDictionary *)param
                           completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyLineOrderListDetails param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

//我的直客列表接口
+ (void)getAgencyMyCustomerList:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler{
    
    [DLRequestSerVice POST:DL_AgencyMyCustomerList param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
}


+ (void)getAgencyMorePics:(NSDictionary *)param
                     completion:(void (^)(id result, NSError *error))completionHandler{
    
    [DLRequestSerVice POST:DL_AgencyMorePics param:param success:^(id responseData){
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}
    
//测试顾问线路订单详情页-付全款，付预付，付尾款页面接口
+ (void)getAgencyLineOrderdetailConfirmPayment:(NSDictionary *)param
                                    completion:(void (^)(id result, NSError *error))completionHandler
{
    
    [DLRequestSerVice POST:DL_AgencyLineOrderDetailConfirmPayment param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];

    
}
@end
