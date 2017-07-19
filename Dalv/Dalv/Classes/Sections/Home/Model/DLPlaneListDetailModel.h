//
//  DLPlaneListDetailModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ---------- 机票查询列表和机票详情界面的模型 ------------

#import <Foundation/Foundation.h>
/*
{
    "status": "00000",
    "msg": "成功",
    "now": "20170706134914",		此字段是和flightinfo数组中的days做比较的
    "date": "2017-07-06",			机票日期
 
    "flightinfo": [
                   {
                       "orgCity": "KMG",					出发城市三字码
                       "depname": "昆明",					出发城市
                       "depTime": "1250",					出发时间（12:50）
                       "arrDate": "2017-07-06",				出发日期
                       "dstCity": "TNA",					到达城市三字码
                       "arrname": "济南",					到达城市
                       "arriTime": "1605",					到达时间（16:05）
                       "flightNo": "SC4874",					航班号
                       "flightNoLetter": "SC",				航班号截取前两位
                       "planeType": "738",					机型
                       "dstJetquay": "--",					到达航站楼
                       "orgJetquay": "--",					出发航站楼
                       "fuelTax": "0.0",			燃油费
                       "airportTax": "50.0",					基建费
                       "share": "false",						是否共享
                       "stop": "0",						经停次数
                       "day": "2017-07-06",					抵达日期
                       "days": "20170706125000",			抵达日期拼接出发时间
                       "price": [
                                 {
                                     "id": 0,					仓位数组的key
                                     "seatMsg": "经济舱",			仓位说明
                                     "ticketnum": "A",				仓位状态
                                     "agio": "0.83",				折扣
                                     "seatCode": "H",				仓位码
                                     "policyId": "199044368",		政策ID
                                     "commisionMoney": "21.5",		返现金额，web端暂未使用该字段
                                     "needSwitchPNR": "1",			是否更换PNR（1更换）
                                     "parPrice": "1980",			票面价
                                     "settlePrice": 1970,			成人的结算价
                                     "earnPrice": 10				顾问所赚的利润
                                 }, 
                                 ]
                   }, 
                   ]
}
*/

@interface DLPlaneListDetailModel : NSObject
/// 出发城市三字码
@property(nonatomic,copy) NSString *orgCity;
/// 出发城市
@property(nonatomic,copy) NSString *depname;
/// 机票日期
@property(nonatomic,copy) NSString *date;
/// 出发时间（12:50）
@property(nonatomic,copy) NSString *depTime;
/// 出发日期
@property(nonatomic,copy) NSString *arrDate;
/// 到达城市
@property(nonatomic,copy) NSString *arrname;
/// 到达时间（16:05）
@property(nonatomic,copy) NSString *arriTime;
 /// 航班号
@property(nonatomic,copy) NSString *flightNo;
/// 航空公司
@property(nonatomic,copy) NSString *flightName;
/// 航班号截取前两位
@property(nonatomic,copy) NSString *flightNoLetter;
/// 机型
@property(nonatomic,copy) NSString *planeType;
/// 到达航站楼
@property(nonatomic,copy) NSString *dstJetquay;
/// 出发航站楼
@property(nonatomic,copy) NSString *orgJetquay;
/// 出发机场
@property(nonatomic,copy) NSString *orgCityName;
/// 到达机场
@property(nonatomic,copy) NSString *dstCityName;
/// 燃油费
@property(nonatomic,copy) NSString *fuelTax;
/// 基建费
@property(nonatomic,copy) NSString *airportTax;
/// 是否共享
@property(nonatomic,assign) BOOL share;
/// 经停次数
@property(nonatomic,copy) NSString *stop;
/// 抵达日期
@property(nonatomic,copy) NSString *day;
/// 抵达日期拼接出发时间
@property(nonatomic,copy) NSString *days;
/// 仓位数组的key
@property(nonatomic,copy) NSString *planeId;
/// 仓位说明
@property(nonatomic,copy) NSString *seatMsg;
/// 仓位状态
@property(nonatomic,copy) NSString *ticketnum;
/// 折扣
@property(nonatomic,copy) NSString *agio;
/// 仓位码
@property(nonatomic,copy) NSString *seatCode;
/// 政策ID
@property(nonatomic,copy) NSString *policyId;
/// 返现金额，web端暂未使用该字段
@property(nonatomic,copy) NSString *commisionMoney;
/// 是否更换PNR（1更换）
@property(nonatomic,copy) NSString *needSwitchPNR;
/// 票面价
@property(nonatomic,copy) NSString *parPrice;
/// 成人的结算价
@property(nonatomic,copy) NSString *settlePrice;
/// 顾问所赚的利润
@property(nonatomic,copy) NSString *earnPrice;
///

@end
