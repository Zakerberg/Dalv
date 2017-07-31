//
//  DLSubmitPlaneOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLSubmitPlaneSection2Row1Cell.h"
#import "DLSubmitPlaneSection2Row2Cell.h"
#import "DLConfirmPlaneOrderController.h"
#import "DLSubmitPlaneOrderController.h"
#import "DLAddPlanePeopleController.h"
#import "DLSubmitPlaneSection0Cell.h"
#import "DLSubmitSection1Cell.h"
#import "DLSubmitSection3Cell.h"

@interface DLSubmitPlaneOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *submitPlaneTableView;
@property(nonatomic,strong) UIButton *addBtn;
@property(nonatomic,assign) NSInteger Section2Number;
@property(nonatomic,strong) UIButton * deleBtn;
@property(nonatomic,strong) UIButton * submitBtn;
@property(nonatomic,strong) UILabel * totalMoney;
@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * customerTypeLabel; // 乘客类型
@property(nonatomic,strong) UILabel * certificateTypeLabel;// 证件类型
@property(nonatomic,strong) UILabel * numberLabel;
@end

static NSString * submitPlaneSection0Cell = @"submitPlaneSection0Cell";
static NSString * submitPlaneSection1Cell = @"submitPlaneSection1Cell";
static NSString * submitPlaneSection2Row1Cell = @"submitPlaneSection2Row1Cell";
static NSString * submitPlaneSection2Row2Cell = @"submitPlaneSection2Row2Cell";
static NSString * submitSection3Cell = @"submitSection3Cell";
static NSString * cellID = @"cellID";

static NSInteger addBtnCount ;

@implementation DLSubmitPlaneOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setUI];
    
    self.Section2Number = 0;
    addBtnCount = 0;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addPassenger:) name:@"completePassenger" object:nil];
}


-(void)addPassenger:(NSNotification *)sender

{
    NSDictionary *dict = sender.userInfo;
    self.nameLabel.text = dict[@"name"];
    self.numberLabel.text = dict[@"cerNumber"];

    [dict[@"customerType"] isEqualToString:@"1"] ? (self.customerTypeLabel.text = @"儿童") : (self.customerTypeLabel.text = @"成人");
   
    if ([dict[@"cerTypeStr"] isEqualToString:@"1"]) {
        
        self.certificateTypeLabel.text = @"身份证";
        
    }else if ([dict[@"cerTypeStr"] isEqualToString:@"2"]){
        
         self.certificateTypeLabel.text = @"护照";
        
    }else if ([dict[@"cerTypeStr"] isEqualToString:@"3"]){
        
        self.certificateTypeLabel.text = @"军官证";
        
    }else if ([dict[@"cerTypeStr"] isEqualToString:@"4"]){
        
        self.certificateTypeLabel.text = @"士兵证";
        
    }else if ([dict[@"cerTypeStr"] isEqualToString:@"5"]){
        
        self.certificateTypeLabel.text = @"台胞证";
        
    }else{
        
        self.certificateTypeLabel.text = @"其他";
    }
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI {
    
    self.title = @"提交机票订单";
    
    self.submitBtn = [UIButton buttonWithType:0];
    self.submitBtn.backgroundColor = [UIColor colorWithHexString:@"#fe603b"];
    [self.submitBtn setTitle:@"确认" forState:UIControlStateNormal];
    self.submitBtn.tintColor = [UIColor whiteColor];
    
    [self.submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:self.submitBtn];
    
    UILabel *total = [[UILabel alloc] init];
    total.text = @"订单总额:";
    
    [self.view addSubview:total];
    
    self.totalMoney = [[UILabel alloc] init];
    self.totalMoney.text = @"4563";
    self.totalMoney.font = [UIFont systemFontOfSize:16];
    self.totalMoney.textColor = [UIColor colorWithHexString:@"#fe603b"];
    
    [self.view addSubview:self.totalMoney];
    
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.offset(0);
        make.height.offset(50);
        make.width.offset(130);
    }];
    
    [total mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.bottom.offset(-10);
    }];
    
    [self.totalMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(total.mas_right).offset(20);
        make.centerY.equalTo(total.mas_centerY).offset(0);
    }];
}


#pragma mark -------- setTableView

-(void)setTableView{
    
    self.submitPlaneTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.submitPlaneTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.submitPlaneTableView.dataSource = self;
    self.submitPlaneTableView.delegate = self;
    
    [self.submitPlaneTableView registerNib:[UINib nibWithNibName:@"DLSubmitPlaneSection0Cell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:submitPlaneSection0Cell];
    
    [self.submitPlaneTableView registerNib:[UINib nibWithNibName:@"DLSubmitSection1Cell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:submitPlaneSection1Cell];
    
    [self.submitPlaneTableView registerClass:[DLSubmitPlaneSection2Row1Cell class] forCellReuseIdentifier:submitPlaneSection2Row1Cell];
    
    [self.submitPlaneTableView registerClass:[DLSubmitPlaneSection2Row2Cell class] forCellReuseIdentifier:submitPlaneSection2Row2Cell];
    
    [self.submitPlaneTableView registerClass:[DLSubmitSection3Cell class] forCellReuseIdentifier:submitSection3Cell];
    
    [self.submitPlaneTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:self.submitPlaneTableView];
    
    [self.submitPlaneTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-48);
    }];
}

#pragma mark ------ BtnClick

-(void)addBtnClick {
    
    NSLog(@"addBtnClick");
    
    addBtnCount++;
    
    self.Section2Number = 3 *addBtnCount;
    
    [self.submitPlaneTableView reloadData];
    
    DLAddPlanePeopleController *addVC = [[DLAddPlanePeopleController alloc] init];
    
    [self.navigationController pushViewController:addVC animated:YES];
    
}

-(void)submitBtnClick {
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    DLConfirmPlaneOrderController *vc = [[DLConfirmPlaneOrderController alloc] init];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark ------ UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 1;
        
    }else if (section == 1){
        
        return 1;
        
    }else if (section == 2){
        
        return self.Section2Number;
        
    }else if (section == 3){
        
        return 4;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) { // 机票信息
        
        DLSubmitPlaneSection0Cell *cell = [tableView dequeueReusableCellWithIdentifier:submitPlaneSection0Cell];
        
        cell.airlinesLabel.text = self.orderModel.flightName; // 出发时间
        cell.flightNo.text = self.orderModel.flightNo;
        cell.planeType.text = self.orderModel.planeType;
        cell.arrDate.text = self.orderModel.arrDate;
        cell.depname.text = self.orderModel.depname;
        cell.arrname.text = self.orderModel.arrname;
        cell.startTimeLabel.text = self.orderModel.depTime;
        cell.startPlaceLabel.text = self.orderModel.orgCityName;
        cell.fuelTax.text = self.orderModel.fuelTax;
        cell.airportTax.text = self.orderModel.airportTax;
        cell.arriveTimeLabel.text = self.orderModel.arriTime;
        cell.arrivePlaceLabel.text = self.orderModel.dstCityName;
        cell.startOrgjetquery.text = self.orderModel.orgJetquay;
        cell.dstJetqury.text = self.orderModel.dstJetquay;
        
        cell.settlement_price.text = self.settlementStr;
        
        cell.settlePrice.text = self.settlePriceStr;
        
        cell.fuelTax.text = self.orderModel.fuelTax;
        cell.airportTax.text = self.orderModel.airportTax;
        return cell;
        
    }else if (indexPath.section == 1) {
        
        DLSubmitSection1Cell *cell = [tableView dequeueReusableCellWithIdentifier:submitPlaneSection1Cell];
        
        self.addBtn = cell.addBtn;
        [self.addBtn setTitle:@"添加乘机人" forState:UIControlStateNormal];
        
        [self.addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
        
    }else if (indexPath.section == 2) { /// 添加乘机人
        

        
        if ((indexPath.row%3) == 1) {
            
            DLSubmitPlaneSection2Row1Cell *cell = [tableView dequeueReusableCellWithIdentifier:submitPlaneSection2Row1Cell];
            cell.name.text = @"姓名:";
            self.nameLabel = cell.nameLabel;
            
            return cell;
            
        }else if ((indexPath.row%3) == 2) {
            
            DLSubmitPlaneSection2Row2Cell * cell = [tableView dequeueReusableCellWithIdentifier:submitPlaneSection2Row2Cell];
            
            self.customerTypeLabel = cell.customerTypeLabel;
            self.certificateTypeLabel = cell.certificateTypeLabel;
            self.deleBtn = cell.deleBtn;
            
            return cell;
            
        }else if ((indexPath.row%3) == 0){
            
            DLSubmitPlaneSection2Row1Cell *cell = [tableView dequeueReusableCellWithIdentifier:submitPlaneSection2Row1Cell];
            cell.name.text = @"证件号码:";
            self.numberLabel = cell.nameLabel;
            
            return cell;
            
        }else{
            
            return nil;
        }
        

    }else{ /// 
        
        if (indexPath.row == 0) {
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                              reuseIdentifier: cellID];
            }
            cell.textLabel.text = @"联系人信息";
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            return cell;
            
        }else if (indexPath.row == 1) {
            
            DLSubmitSection3Cell *cell = [tableView dequeueReusableCellWithIdentifier:submitSection3Cell];
            
            cell.NAME.text = @"姓名:";
            cell.TF.placeholder = @"填写常用联系人";
            
            return cell;
            
        }else if (indexPath.row == 2) {
            
            DLSubmitSection3Cell *cell = [tableView dequeueReusableCellWithIdentifier:submitSection3Cell];
            
            cell.NAME.text = @"手机号:";
            cell.TF.placeholder = @"填写手机号";
            //cell.TF.keyboardType = UIKeyboardTypeNumberPad;
            return cell;
            
        }else{
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                              reuseIdentifier: cellID];
            }
            cell.textLabel.text = @"<该手机号收到出票通知>";
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        return 176;
        
    }else if (indexPath.section == 1) {
        
        return 45;
        
    }else {
        
        if (indexPath.row == 0 || indexPath.row == 3) {
            return 34;
            
        }else{
            
            return 44;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 0.1;
        
    }else if (section == 2){
        
        return 1;
    }
    
    return 10.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
