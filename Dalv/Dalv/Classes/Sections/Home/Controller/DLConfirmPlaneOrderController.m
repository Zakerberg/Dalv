//
//  DLConfirmPlaneOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/28.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLConfirmPlaneOrderController.h"

@interface DLConfirmPlaneOrderController ()
/// 航班名称
@property (weak, nonatomic) IBOutlet UILabel *flightName;
/// 航班号
@property (weak, nonatomic) IBOutlet UILabel *flightNo;
/// 机型
@property (weak, nonatomic) IBOutlet UILabel *planeModel;
/// 单人总价
@property (weak, nonatomic) IBOutlet UILabel *perMoney;
/// 结算价
@property (weak, nonatomic) IBOutlet UILabel *settlementPrice;
/// 基建费
@property (weak, nonatomic) IBOutlet UILabel *airPortMoney;
/// 燃油费
@property (weak, nonatomic) IBOutlet UILabel *fuelMoney;
/// 出发日期
@property (weak, nonatomic) IBOutlet UILabel *startDate;
/// 乘机人类型
@property (weak, nonatomic) IBOutlet UILabel *passengerType;
/// 联系人姓名
@property (weak, nonatomic) IBOutlet UILabel *contractPeople;
/// 订单总额
@property (weak, nonatomic) IBOutlet UILabel *priceTotal;
/// 始发航站楼
@property (weak, nonatomic) IBOutlet UILabel *orgJetquay;
/// 到达航站楼
@property (weak, nonatomic) IBOutlet UILabel *dstJetquay;
/// 出发时间
@property (weak, nonatomic) IBOutlet UILabel *depTime;
/// 出发城市
@property (weak, nonatomic) IBOutlet UILabel *depCode;
/// 到达城市
@property (weak, nonatomic) IBOutlet UILabel *arrCode;
/// 到达时间
@property (weak, nonatomic) IBOutlet UILabel *arrTime;
@property(nonatomic,strong) UIButton * confirmBtn;

@end

@implementation DLConfirmPlaneOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI{
    
    self.title = @"确认支付订单";
    
    self.confirmBtn = [[UIButton alloc] init];
    [_confirmBtn setTitle:@"确认支付订单" forState:UIControlStateNormal];
    [_confirmBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    _confirmBtn.backgroundColor = [UIColor colorWithHexString:@"#4d67ee"];
    _confirmBtn.layer.cornerRadius = 8.0;
    
    [self.view addSubview:_confirmBtn];
    
    [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceTotal.mas_bottom).offset(40);
        make.height.offset(44);
        make.left.equalTo(@15);
        make.right.equalTo(self.view.mas_right).offset(-15);
    }];


}


-(void) btnClick {
    
    
    
    
    
    
    
}

@end
