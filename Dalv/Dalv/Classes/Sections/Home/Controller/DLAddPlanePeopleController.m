//
//  DLAddPlanePeopleController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/21.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLAddPlanePeopleController.h"
#import "DLSubmitPlaneOrderController.h"
#import "DLAddPeopleCell.h"
#import "BLMPickerView.h"

@interface DLAddPlanePeopleController ()<UITableViewDelegate,UITableViewDataSource,BLMPickerDelegate>
@property (weak,nonatomic) UITableViewCell* personCell;
@property (nonatomic,strong) UITableView * planePeopleTableView;
@property (strong, nonatomic) UIButton *searchBtn;
@property (nonatomic,strong) NSString * str1;
@property (nonatomic,strong) NSString * peopleTypeStr; //0成人，1儿童
@property (nonatomic,strong) NSString * certicicateTypeStr; //1身份证，2护照，3军官证，4士兵证，5台胞证，6港澳通行证
@end
static NSString *cell1ID = @"cell1ID";
static NSString *cellID = @"cellID";

@implementation DLAddPlanePeopleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setTab];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ----- setUI

- (void)setUI {
    
    self.title = @"添加乘机人";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
}

#pragma mark ----- setTab

-(void)setTab{
    
    self.planePeopleTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.planePeopleTableView.dataSource = self;
    self.planePeopleTableView.delegate = self;
    self.planePeopleTableView.tableFooterView = [UIView new];
    self.planePeopleTableView.backgroundColor = [UIColor ms_backgroundColor];
    [self.planePeopleTableView registerClass:[DLAddPeopleCell class] forCellReuseIdentifier:cell1ID];
    
    [self.view addSubview:self.planePeopleTableView];
    
    UIButton *btn = [[UIButton alloc] init];
    self.searchBtn = btn;
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor colorWithHexString:@"#4d67ee"];
    btn.layer.cornerRadius = 8.0;
    
    [self.planePeopleTableView addSubview:btn];
    
    [self.planePeopleTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.planePeopleTableView.tableFooterView.mas_top).offset(43);
        make.height.offset(44);
        make.left.equalTo(@15);
        make.right.equalTo(self.view.mas_right).offset(-15);
    }];
}


+ (BOOL) IsIdentityCard:(NSString *)IDCardNumber

{
    if (IDCardNumber.length <= 0)
        
    {
        return NO;
    }
    
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    
    NSPredicate *identityCardPredicate = [NSPredicate
                                          
                                          predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [identityCardPredicate evaluateWithObject:IDCardNumber];
}

/// 确认
-(void)btnClick {
    
    if ([self.nameTF.text isEqualToString:@""]) {
        
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请填写乘机人姓名" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
        
    }else if (!self.peopleTypeStr){
        
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择乘客身份" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
        
    }else if (!self.certicicateTypeStr){
        
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择证件类型" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
        
    }else if ([self.certificatenNumTF.text isEqualToString:@""]){
        
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请填写证件号码" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
        
    }else{
        
   
    [self.peopleTypeStr isEqualToString:@"儿童"] ? (self.peopleTypeStr = @"1") : (self.peopleTypeStr = @"0");

        if ([self.certicicateTypeStr isEqualToString:@"身份证"]) {
            self.certicicateTypeStr = @"1";
        } else if ([self.certicicateTypeStr isEqualToString:@"护照"]){
            self.certicicateTypeStr = @"2";
        }else if ([self.certicicateTypeStr isEqualToString:@"军官证"]){
            self.certicicateTypeStr = @"3";
        }else if ([self.certicicateTypeStr isEqualToString:@"士兵证"]){
            self.certicicateTypeStr = @"4";
        }else if ([self.certicicateTypeStr isEqualToString:@"台胞证"]){
            self.certicicateTypeStr = @"5";
        }else if ([self.certicicateTypeStr isEqualToString:@"其它(包括港澳通行证)"]){
            self.certicicateTypeStr = @"6";
        }
        
        NSDictionary *param = @{
                                @"uid":[DLUtils getUid],
                                @"sign_token" : [DLUtils getSign_token],
                                @"passenger_name":self.nameTF.text,
                                @"passenger_type":self.peopleTypeStr,
                                @"identity_type": self.certicicateTypeStr,
                                @"identity_no":self.certificatenNumTF.text
                                };
        
        [DLHomeViewTask getFlightAddFrequentPassenger:param completion:^(id result, NSError *error) {
            
 
        }];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"completePassenger" object:nil userInfo:@{
                       @"name":self.nameTF.text,
                       @"customerType":self.peopleTypeStr,
                       @"cerTypeStr":self.certicicateTypeStr,
                       @"cerNumber":self.certificatenNumTF.text
                       }];
        
        [self.navigationController popViewControllerAnimated:YES];
 
    }
}


#pragma mark ----- UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        DLAddPeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1ID];
        self.nameTF = cell.TF;
        cell.textLabel.text = @"乘机人姓名";
        self.nameTF.placeholder = @"请输入乘机人姓名";
        
        return cell;
        
    } else if (indexPath.row == 1){
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                          reuseIdentifier: cellID];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.textLabel.text = @"乘客类型";
        cell.accessoryType = 1;
        UILabel *peopleTypeLabel = [[UILabel alloc] init];
        self.peopleTypeLabel = peopleTypeLabel;
        peopleTypeLabel.font = [UIFont systemFontOfSize:15];
        peopleTypeLabel.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
        cell.detailTextLabel.text = self.peopleTypeLabel.text;
        
        [cell.contentView addSubview:peopleTypeLabel];
        
        [peopleTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15);
            make.height.offset(44);
            make.top.offset(0);
        }];
        
        return cell;
        
    }else if (indexPath.row == 2){
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                          reuseIdentifier: cellID];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.textLabel.text = @"证件类型";
        cell.accessoryType = 1;
        
        UILabel *certificateType = [[UILabel alloc] init];
        self.certificateType = certificateType;
        certificateType.font = [UIFont systemFontOfSize:15];
        certificateType.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
        cell.detailTextLabel.text = self.certificateType.text;
        
        [cell.contentView addSubview:certificateType];
        
        [certificateType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15);
            make.height.offset(44);
            make.top.offset(0);
        }];
        
        return cell;
        
    }else{
        
        DLAddPeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1ID];
        self.certificatenNumTF = cell.TF;
        cell.textLabel.text = @"证件号码";
        self.certificatenNumTF.keyboardType = 4;
        self.certificatenNumTF.placeholder = @"请输入证件号码";
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 1){  // 乘客类型
        self.str1 = @"1";
        BLMPickerView *picker = [[BLMPickerView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        picker.arrayType = customerType;
        [self.view addSubview:picker];
        
    }else if (indexPath.row == 2){ // 证件类型
        
        BLMPickerView *picker = [[BLMPickerView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        picker.arrayType = certificateType;
        [self.view addSubview:picker];
    }
}

#pragma mark ------- BLMPickerDelegate

-(void)PickerSelectorIndixString:(NSString *)str

{
    if ([self.str1 isEqualToString: @"1"]) {
        
        self.peopleTypeLabel.text = str;
        self.str1 = @"";
        self.peopleTypeStr = str;
        
    }else{
        
        self.certificateType.text = str;
        self.certicicateTypeStr = str;
    }
}

@end
