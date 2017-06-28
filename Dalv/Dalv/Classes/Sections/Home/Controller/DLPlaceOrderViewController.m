//
//  DLPlaceOrderViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLPlaceOrderViewController.h"
#import "DLLineOrderPriceTableViewCell.h"
#import "DLLineOrderChoiceDateTableViewCell.h"
#import "DLLineOrderTripNumebrTableViewCell.h"
#import "DLLineOrderSingleRoomTableViewCell.h"
#import "DLLineOrderContactsTableViewCell.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "DLHomeViewTask.h"
#import "DLCalendarViewController.h"
#import "DLLineOrderController.h"
#import "AppDelegate.h"
#import "DLAddReduceButton.h"
#import "MSPickerView.h"

@interface DLPlaceOrderViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,DLLineOrderChoiceDateTableViewCellDelegate,DLAddReduceButtonDelegate,MSPickerViewDelegate>

@property (nonatomic, strong) UITableView *homeTableView;

@property (nonatomic, strong) UILabel *totalOrderLab;//订单总额

@property (nonatomic, strong) DLPlaceLineOrderModel *lineOrderoModel;//提交订单模型

@property (nonatomic, strong) MSPickerView *pickerView;

@property (nonatomic, strong) DLAddReduceButton *singleRoomButton;
@property (nonatomic, strong) DLAddReduceButton *adultButton;
@property (nonatomic, strong) DLAddReduceButton *childButton;
@property (nonatomic, strong) UITextField *contacsTextField;
@property (nonatomic, strong) UITextField *tellTextField;
@property (nonatomic, strong) UITextField *remarksTextField;
@property (nonatomic, strong) UILabel *datelab;

@end

@implementation DLPlaceOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self cofigureBottomView];
    [self fetchData];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enable = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [IQKeyboardManager sharedManager].enable = NO;
}

#pragma mark - Setup navbar
- (void)setupNavbar {
    self.title = @"填写和提交";
}
- (BOOL)dl_blueNavbar {
    return YES;
    
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.homeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.homeTableView.dataSource = self;
    self.homeTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.homeTableView.delegate = self;
    [self.homeTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.homeTableView.showsVerticalScrollIndicator = NO;
    [self.homeTableView registerClass:[DLLineOrderPriceTableViewCell class] forCellReuseIdentifier:[DLLineOrderPriceTableViewCell cellIdentifier]];
    [self.homeTableView registerClass:[DLLineOrderChoiceDateTableViewCell class] forCellReuseIdentifier:[DLLineOrderChoiceDateTableViewCell cellIdentifier]];
    [self.homeTableView registerClass:[DLLineOrderTripNumebrTableViewCell class] forCellReuseIdentifier:[DLLineOrderTripNumebrTableViewCell cellIdentifier]];
    [self.homeTableView registerClass:[DLLineOrderSingleRoomTableViewCell class] forCellReuseIdentifier:[DLLineOrderSingleRoomTableViewCell cellIdentifier]];
    [self.homeTableView registerClass:[DLLineOrderContactsTableViewCell class] forCellReuseIdentifier:[DLLineOrderContactsTableViewCell cellIdentifier]];
    [self.view addSubview:self.homeTableView];
    
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
}

- (void)cofigureBottomView {
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor ms_separatorColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@48);
    }];
    
    UILabel *totalOrderLab = [[UILabel alloc]init];
    totalOrderLab.backgroundColor = [UIColor whiteColor];
    totalOrderLab.textColor = [UIColor colorWithHexString:@"#fE603B"];
    [bottomView addSubview:totalOrderLab];
    self.totalOrderLab = totalOrderLab;
    
    [totalOrderLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView);
        make.bottom.equalTo(bottomView);
        make.height.equalTo(@47.5);
        make.width.equalTo(bottomView).multipliedBy(0.67);
    }];
    
    UIButton *placeOrderBtn = [[UIButton alloc]init];
    [placeOrderBtn addTarget:self action:@selector(placeOrderBtn) forControlEvents:UIControlEventTouchUpInside];
    placeOrderBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
    [placeOrderBtn setTitle:@"提交订单" forState:(UIControlStateNormal)];
    [bottomView addSubview:placeOrderBtn];
    
    [placeOrderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bottomView);
        make.bottom.equalTo(bottomView);
        make.height.equalTo(@47.5);
        make.width.equalTo(bottomView).multipliedBy(0.33);
    }];
    
    
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DLLineOrderPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderPriceTableViewCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.lineOrderoModel = self.lineOrderoModel;
        [cell configureCell:self.lineOrderoModel];
        return cell;
    } else if (indexPath.section == 1) {
        DLLineOrderChoiceDateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderChoiceDateTableViewCell cellIdentifier]];
        cell.delegate = self;
        self.datelab = cell.datelab;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 2){
        DLLineOrderTripNumebrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderTripNumebrTableViewCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.adultButton = cell.adultButton;
        self.childButton = cell.childButton;
        self.adultButton.delegate = self;
        self.childButton.delegate = self;
        return cell;
    } else if (indexPath.section == 3){
        DLLineOrderSingleRoomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderSingleRoomTableViewCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.singleRoomButton = cell.singleRoomButton;
        self.singleRoomButton.delegate = self;
        return cell;
    } else {
        DLLineOrderContactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineOrderContactsTableViewCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.tellTextField = cell.tellTextField;
        self.contacsTextField = cell.contacsTextField;
        self.remarksTextField = cell.remarksTextField;

        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            CGFloat titleHeight = [self.detaiInfoModel.list.name autolableHeightWithFont:[UIFont systemFontOfSize:16] Width:(self.view.width - 30)];
            return titleHeight + 125;
            
        }
            break;
        case 1:
            return 80;
            break;
        case 2:
            return 95;
            break;
        case 3:
            return 70;
            break;
        case 4:
            return 180;
            break;
        default:
            return 0;
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - DLAddReduceButtonDelegate

- (void)pp_numberButton:(__kindof UIView *)numberButton number:(NSInteger)number increaseStatus:(BOOL)increaseStatus {
    
    if (numberButton == self.adultButton) {
        NSLog(@"成人%ld",number);
    } else if (numberButton == self.childButton){
        NSLog(@"儿童%ld",number);
    } else {
        NSLog(@"单房差%ld",number);
    }
    
    NSString *str = [NSString stringWithFormat:@"%.f",[self.lineOrderoModel.list.price_adult_agency integerValue]/100.00];
    NSString *str1 = [NSString stringWithFormat:@"%.f",[self.lineOrderoModel.list.price_child_agency integerValue]/100.00];
    NSString *str2 = [NSString stringWithFormat:@"%.f",[self.lineOrderoModel.list.price_hotel_agency integerValue]/100.00];
    
    NSInteger count = [str integerValue] * [[NSString stringWithFormat:@"%ld",self.adultButton.currentNumber] integerValue] + [str1 integerValue] * [[NSString stringWithFormat:@"%ld",self.childButton.currentNumber] integerValue] + [str2 integerValue] * [[NSString stringWithFormat:@"%ld",self.singleRoomButton.currentNumber] integerValue];

    self.totalOrderLab.text = [NSString stringWithFormat:@"    订单总额：¥%ld",count];
}

#pragma mark - MSPickerViewDelegate

- (void)pickerView:(MSPickerView *)pickerView didSelectCompleteAtItem:(MSPickerItem *)item {
    self.datelab.text = item.title;
}

- (void)fetchData {
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"tour_id" : self.routeModel.routeId,
                            @"sign_token" : [DLUtils getSign_token],};
    [[DLHUDManager sharedInstance] showProgressWithText:@"正在加载"];
    @weakify(self);
    [DLHomeViewTask getAgencyOrderInfo:param completion:^(id result, NSError *error) {
        @strongify(self);
        [[DLHUDManager sharedInstance] hiddenHUD];
        if (result) {
            self.lineOrderoModel = [DLPlaceLineOrderModel mj_objectWithKeyValues:result];
            [self.homeTableView reloadData];
            self.totalOrderLab.text = [NSString stringWithFormat:@"    订单总额：¥%.f",[self.lineOrderoModel.list.price_adult_agency integerValue]/100.00];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
    
}

#pragma mark - Event Handler

- (void)orderSelectDateViewDelegate:(UITapGestureRecognizer *)tapdate{
    if (self.lineOrderoModel.tour_date.count == 0) {
        [[DLHUDManager sharedInstance] showTextOnly:@"没有团期"];
        return;
    }
    
    NSMutableArray *dateArray = [[NSMutableArray alloc]init];
     for (DLPlaceOrderTourDate *field in self.lineOrderoModel.tour_date) {
        [dateArray addObject:[MSPickerItem itemWithTitle:field.start_time value:field.tourDateId]];
    }
    self.pickerView.pickerItems = dateArray;
    [self.pickerView show];
    
}

- (void)placeOrderBtn {
    
    if (self.lineOrderoModel.tour_date.count == 0) {
        [[DLHUDManager sharedInstance] showTextOnly:@"没有团期"];
        return;
    }
    if (self.adultButton.currentNumber == 0 && self.childButton.currentNumber == 0) {
        [[DLHUDManager sharedInstance]showTextOnly:@"至少选择一个出行人哦"];
        return;
    }
    if ([NSString isBlank: self.contacsTextField.text]) {
        [[DLHUDManager sharedInstance]showTextOnly:@"请填写联系人"];
        return;
    }
    if ([NSString isBlank: self.tellTextField.text]) {
        [[DLHUDManager sharedInstance]showTextOnly:@"请填写联系人手机号"];
        return;
    }

    UIAlertView *placeOrderAlert = [[UIAlertView alloc]initWithTitle:@"确定提交订单吗？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    placeOrderAlert.tag = 45;
    [placeOrderAlert show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 45){
        if (buttonIndex == 1) {
            NSDictionary *param = @{@"uid" : [DLUtils getUid],
                                    @"id" : self.routeModel.routeId,
                                    @"sign_token" : [DLUtils getSign_token],
                                    @"client_adult_count" : [NSString stringWithFormat:@"%ld",self.adultButton.currentNumber],
                                    @"client_child_count" : [NSString stringWithFormat:@"%ld",self.childButton.currentNumber],
                                    @"contact_phone" : self.tellTextField.text,
                                    @"contact" : self.contacsTextField.text,
                                    @"hotel_count" : [NSString stringWithFormat:@"%ld",self.singleRoomButton.currentNumber],
                                    @"memo" : self.remarksTextField.text ? : @"",
                                    @"start_time" : self.datelab.text,
                                    };
            [[DLHUDManager sharedInstance] showProgressWithText:@"正在加载"];
            @weakify(self);
            [DLHomeViewTask getAgencyOrderInfoHandle:param completion:^(id result, NSError *error) {
                @strongify(self);
                [[DLHUDManager sharedInstance] hiddenHUD];
                if ([[result objectForKey:@"status"] isEqualToString:@"00000"]) {
                   [self.navigationController popViewControllerAnimated:YES];
                [[DLHUDManager sharedInstance] showTextOnly:[result objectForKey:@"msg"]];
                } else {
                    [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
                }
            }];
            
        }
    }
}


#pragma mark - Getter

- (MSPickerView *)pickerView {
    if (_pickerView == nil) {
        _pickerView = [[MSPickerView alloc] init];
        _pickerView.delegate = self;
    }
    return _pickerView;
}
@end
