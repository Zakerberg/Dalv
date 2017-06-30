//
//  DLInvioiceApplyController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//    ---------------   发票申请   ------------

#import "DLInvioiceApplyController.h"
#import "DLContractApplySection1Cell.h"
#import "DLContractApplySection4Cell.h"
#import "DLContractApplySection5Cell.h"
#import "DLinvoiceSection1Cell.h"
#import "DLHomeViewTask.h"
#import "DLSalertView.h"
#import "DLCityPickerView.h"
#import "DLAddReduceButton.h"
#import "DLinvoiceApplySection0Cell.h"
#import "DLContractApplySection3Cell.h"
#import "DLContractApplySection2Cell.h"

@interface DLInvioiceApplyController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,DLCityPickerViewDelegate,DLSalertViewDelegate>

@property (nonatomic, strong) UITableView *invoiceTableView;
///发票金额TF
@property(nonatomic,strong) UITextField *invoiceAmountTF;
///发票备注TF
@property(nonatomic,strong) UITextView *noteTextView;
///发票类型数据
@property(nonatomic,strong) NSMutableArray *dataArrM;
@property(nonatomic,assign) NSInteger Section2Number;
@property(nonatomic,assign) NSInteger Section3Number;
@property(nonatomic,assign) NSInteger Section4Number;
///发票抬头TF
@property(nonatomic,strong) UITextField *companyTF;
///发票项目TF
@property(nonatomic,strong) UITextField *projectTF;
/// 邮寄地址TextView
@property(nonatomic,strong) UITextView *addressTV;
/// 提交申请Btn
@property(nonatomic,strong) UIButton *submitBtn;
///快递CourierBtn
@property(nonatomic,strong) UIButton *courierBtn;
/// 联系人姓名TextFiled
@property(nonatomic,strong) UITextField *nameTF;
///自取inviteBtn
@property(nonatomic,strong) UIButton *inviteBtn;
///到付Btn
@property(nonatomic,strong) UIButton *payforBtn;
/// 邮寄Btn
@property(nonatomic,strong) UIButton *mailBtn;
///联系人电话TextFiled
@property(nonatomic,strong) UITextField *numberTF;
///剩余发票额度Label
@property(nonatomic,strong) UILabel *moneyLabel;
//获取方式
@property(nonatomic,strong) NSString *methodBtnNumber;
//邮寄方式
@property(nonatomic,strong) NSString *express_feeNumber;
///发票项目 Btn
@property(nonatomic,strong) UIButton *projctButton;
@property (nonatomic,strong) DLSalertView *alertView;
@property(nonatomic,strong) UITextField *firstField;
@property(nonatomic,strong) DLAddReduceButton *currentBtn;
///公司地址
@property(nonatomic,strong) UILabel *addressLabel1;
/// 公司电话
@property(nonatomic,strong) UILabel *numberLabel1;
@property(nonatomic,strong) NSString *companyStr;
@property(nonatomic,strong) NSString *numStr;
///发票纳税人识别号TF
@property(nonatomic,strong) UITextField *identificationNumTF;
///空白自取blankInviteBtn
@property(nonatomic,strong) UIButton *blankInviteBtn;
///空白快递blankCourierBtn
@property(nonatomic,strong) UIButton *blankCourierBtn;
///空白到付blankPayforBtn
@property(nonatomic,strong) UIButton *blankPayforBtn;
///空白邮寄blankMailBtn
@property(nonatomic,strong) UIButton *blankMailBtn;
@property(nonatomic,weak) DLinvoiceApplySection0Cell *section0Cell;

@end

static NSString *invoiceSection1cellID = @"invoiceSection1cellID";
static NSString *section0CellID = @"section0CellID";
static NSString *section1CellID = @"section1CellID";
static NSString *section2CellID = @"section2CellID";
static NSString *section3CellID = @"section3CellID";
static NSString *section4CellID = @"section4CellID";
static NSString *section5CellID = @"section5CellID";

@implementation DLInvioiceApplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self fetchData];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"发票申请";

    self.Section2Number = 2;
    self.Section3Number = 0;
    self.Section4Number = 1;
}

#pragma mark ----------------- Set TableView -----------------

-(void)setTableView {
    
    self.invoiceTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.invoiceTableView.dataSource = self;
    self.invoiceTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.invoiceTableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.invoiceTableView.showsVerticalScrollIndicator = NO;
    
    [self.invoiceTableView registerClass:[DLinvoiceApplySection0Cell class] forCellReuseIdentifier:section0CellID];
    
    [self.invoiceTableView registerClass:[DLinvoiceSection1Cell class] forCellReuseIdentifier:invoiceSection1cellID];
    
    [self.invoiceTableView registerClass:[DLContractApplySection1Cell class] forCellReuseIdentifier:section1CellID];
    
    [self.invoiceTableView registerClass:[DLContractApplySection2Cell class] forCellReuseIdentifier:section2CellID];
    
    [self.invoiceTableView registerClass:[DLContractApplySection3Cell class] forCellReuseIdentifier:section3CellID];
    
    [self.invoiceTableView registerClass:[DLContractApplySection4Cell class] forCellReuseIdentifier:section4CellID];
    
    [self.invoiceTableView registerClass:[DLContractApplySection5Cell class] forCellReuseIdentifier:section5CellID];
    
    [self.view addSubview:self.invoiceTableView];
    
    [self.invoiceTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----------  Fetch data --------------

- (void)fetchData {
    
    NSDictionary *param = @{
                            
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    
    [DLHomeViewTask getAgencyFinanceApplyInvoicet:param completion:^(id result, NSError *error) {
        
        NSDictionary *invoiceDict = result;
        
        NSArray *arr = invoiceDict[@"invoiceTypeList"];
        self.dataArrM = [NSMutableArray array];
      
        for (NSDictionary *dic in arr) {
            NSString *str = dic[@"detail"];
//            [arrM addObject:str];
            [self.dataArrM addObject:str];
           
        }
        
        NSDictionary *operatorInfo = invoiceDict[@"operatorInfo"];
        
        NSString *companyStr = operatorInfo[@"address"];
        
        if ([companyStr isEqualToString:@""]) {
            self.addressLabel1.text = @"哎呦喂,居然没有地址 ^ 0 ^ ";
        }else{
         self.addressLabel1.text = companyStr;
        }
        
        NSString *numStr = operatorInfo[@"tel"];
        
        if ([numStr isEqualToString:@""]) {
            self.numberLabel1.text = @"哎呦喂,居然没有电话 ^ 0 ^ ";
        }else{
            self.numberLabel1.text = numStr;
        }
        
        NSString * moneyStr = invoiceDict[@"lastTotal"];
        
        NSInteger MoneyInter = [moneyStr integerValue];
        
        NSInteger finaInter = MoneyInter/100;
        self.moneyLabel.text = [NSString stringWithFormat:@"%ld",(long)finaInter];
    }];
}

#pragma mark -----------  BtnClick ----------------

/***  发票项目 Btn ***/
-(void)projectBtnClick {
    
    NSMutableArray *arrayData = [NSMutableArray arrayWithArray:self.dataArrM];
    
    DLCityPickerView *pickerSingle = [[DLCityPickerView alloc]init];
    
    [pickerSingle setDataArray:arrayData];
    [pickerSingle setDefalutSelectRowStr:arrayData[0]];
    [pickerSingle setDelegate:self];
    [pickerSingle show];
    [self.view endEditing:YES];
    
}

/*** 自取按钮 ***/
-(void)inviteBtnClick {
    
    self.methodBtnNumber = @"1";
    
    [self.inviteBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
    [self.courierBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    
    
    self.Section2Number = 2;
    self.Section3Number = 0;
    self.Section4Number = 1;
    [self.invoiceTableView reloadData];
    
}

/***  快递按钮 ***/
-(void)courierBtnClick {
    

    self.methodBtnNumber = @"2";
    [self.courierBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
    [self.inviteBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    
    self.Section2Number = 1;
    self.Section3Number = 1;
    self.Section4Number = 1;
    
    [self.invoiceTableView reloadData];
    
}

/*** 到付按钮 ***/
-(void)payforBtnCLick {
    
    
    self.express_feeNumber = @"3";
    
    [self.payforBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
    [self.mailBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
}

/*** 邮寄按钮 ***/
-(void)mailBtnCLick {

    self.express_feeNumber = @"4";
    
    [self.payforBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    [self.mailBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
}


/*** 提交申请按钮 ***/
-(void)submitBtnClick {

    if ([self.identificationNumTF.text isEqualToString:@""]) {
        
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入纳税人识别号" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
        
    }else if([self.companyTF.text isEqualToString:@""]){
      
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入发票抬头" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
        
    }else if([self.invoiceAmountTF.text isEqualToString:@""]){
        
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入金额" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
    }else if([self.projctButton.titleLabel.text isEqualToString:@" "]){
        
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入发票项目" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
    }else{
        //自取
        if ([self.methodBtnNumber isEqualToString:@"1"]) {
            
            NSDictionary *param1 = @{
                                     
                                     @"uid":[DLUtils getUid],
                                     @"sign_token" : [DLUtils getSign_token],
                                     @"title":self.companyTF.text,
                                     @"amount":self.invoiceAmountTF.text,
                                     @"detail":self.projctButton.titleLabel.text,
                                     @"detail_comm":self.noteTextView.text,
                                     @"request_method":self.methodBtnNumber,
                                     @"tax_number":self.identificationNumTF.text,
                                     @"code":@"400"
                                     
                                     };
            
            [DLHomeViewTask getAgencyFinanceApplyInvoicetHandle:param1 completion:^(id result, NSError *error) {
                
                //写个提示申请成功! ---> 跳转!
                UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"申请成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [successV show];
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }
        //快递
        else if ([self.methodBtnNumber isEqualToString:@"2"]){
            
            if (![self.addressTV.text  isEqual: @""] && ![self.nameTF.text  isEqual: @""] && ![self.numberTF.text  isEqual: @""]) {
                
                NSDictionary *param = @{
                                        
                                        @"uid":[DLUtils getUid],
                                        @"sign_token" : [DLUtils getSign_token],
                                        @"title":self.companyTF.text,
                                        @"amount":self.invoiceAmountTF.text,
                                        @"detail":self.projctButton.titleLabel.text,
                                        @"detail_comm":self.noteTextView.text,
                                        @"request_method":self.methodBtnNumber,
                                        @"express_fee":self.express_feeNumber,
                                        @"addr":self.addressTV.text,
                                        @"name":self.nameTF.text,
                                        @"phone":self.numberTF.text,
                                        @"tax_number":self.identificationNumTF.text,                                    @"code":@"400"
                                        };
                [DLHomeViewTask getAgencyFinanceApplyInvoicetHandle:param completion:^(id result, NSError *error) {
                    
                    //写个提示申请成功! ---> 跳转!
                    UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"申请成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                    [successV show];
                    
                    [self.navigationController popViewControllerAnimated:YES];
                }];
                
            }else{
                
                UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请补全收货信息" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [alertV show];
            }
        }
    }
}

#pragma mark  ----------UITable View Delegate------------

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    
    if (section == 1){
        return 1;
    }
    if (section == 4){
        return 2;
    }
    
    return 10;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 222+45;
    }
    
    else if (indexPath.section == 2 && indexPath.row == 1){
        return 80;
    }
    
    else if (indexPath.section == 5){
        return 80;
    }
    
    else if (indexPath.section == 4){
        return 165;
    }
    
    return 45;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 1;
    }
    
    if (section == 1) {
        return 1;
    }
    
    else if (section == 2){
        return self.Section2Number;
    }
    
    else if (section == 3){
        return self.Section3Number;
    }
    
    else if (section == 4){
        return self.Section3Number;
    }
    
    return self.Section4Number;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        DLinvoiceApplySection0Cell *section0Cell = [tableView dequeueReusableCellWithIdentifier:section0CellID];
        
        self.section0Cell = section0Cell;
        //抬头
        self.companyTF = section0Cell.companyTF;
        //项目
        self.projctButton = section0Cell.projctButton;
        
        //备注
        self.noteTextView = section0Cell.noteTextView;
        
        //剩余金额
        self.moneyLabel = section0Cell.moneyLabel;
    
        /***  发票纳税人识别号TF ***/
        self.identificationNumTF = section0Cell.identificationNumTF;
        
//        self.noteTextView.text = @"请填写备注 如代订机票等";
//        self.noteTextView.delegate = self;
        [self.projctButton addTarget:self action:@selector(projectBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        return section0Cell;
    }
    
    /**发票金额**/
    else  if (indexPath.section == 1 ){
        
        DLinvoiceSection1Cell *cell = [tableView dequeueReusableCellWithIdentifier:invoiceSection1cellID];
        
        //发票金额
        self.invoiceAmountTF = cell.invoiceAmountTF;
        return cell;
    }
    
    else if (indexPath.section == 2 && indexPath.row == 0){
        
        DLContractApplySection1Cell *cell = [tableView dequeueReusableCellWithIdentifier:section1CellID];
        
        self.inviteBtn = cell.inviteBtn;
        self.courierBtn = cell.courierBtn;
        
        
        self.blankCourierBtn = cell.blankCourierBtn;
        self.blankInviteBtn = cell.blankInviteBtn;
        
        [cell.blankInviteBtn addTarget:self action:@selector(inviteBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.blankCourierBtn addTarget:self action:@selector(courierBtnClick) forControlEvents:UIControlEventTouchUpInside];

        [cell.inviteBtn addTarget:self action:@selector(inviteBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.courierBtn addTarget:self action:@selector(courierBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    
    else if (indexPath.section == 2 && indexPath.row == 1)
    {
        DLContractApplySection2Cell *cell = [tableView dequeueReusableCellWithIdentifier:section2CellID];
        
        //公司的地址和电话
        self.addressLabel1 = cell.addressLabel1;
        self.numberLabel1 = cell.numberLabel1;
        
        return cell;
    }
    
    else if (indexPath.section == 3) {
        
        DLContractApplySection3Cell *cell = [tableView dequeueReusableCellWithIdentifier:section3CellID];
        
        self.mailBtn = cell.mailBtn;
        self.payforBtn = cell.payforBtn;
        
        
        self.blankMailBtn = cell.blankMailBtn;
        self.blankPayforBtn = cell.blankPayforBtn;
        
        [cell.blankPayforBtn addTarget:self action:@selector(payforBtnCLick) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.blankMailBtn addTarget:self action:@selector(mailBtnCLick) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.payforBtn addTarget:self action:@selector(payforBtnCLick) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.mailBtn addTarget:self action:@selector(mailBtnCLick) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
        
    }
    else if (indexPath.section == 4){
        DLContractApplySection4Cell *cell = [tableView dequeueReusableCellWithIdentifier:section4CellID];
        
        self.addressTV = cell.addressTV;
        self.nameTF = cell.nameTF;
        self.numberTF = cell.numberTF;
        self.addressTV.delegate = self;
        
        self.addressTV.font = [UIFont systemFontOfSize:15];
        self.self.addressTV.text = @"请填写您的收货地址";
        self.addressTV.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
        
        return cell;
        
    }
    else {
        
        DLContractApplySection5Cell *cell = [tableView dequeueReusableCellWithIdentifier:section5CellID];
        
        self.submitBtn = cell.submitBtn;
        
        [self.submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        cell.backgroundColor = [UIColor clearColor];
        
        return cell;
    }
}

#pragma mark ---------  UITextViewDelegate  -------------

-(void)textViewDidBeginEditing:(UITextView *)textView{
//    if ([textView.text isEqualToString:@"请填写备注 如代订机票等"]) {
//        textView.text = @"";
//        textView.textColor = [UIColor colorWithHexString:@"c1c1c1"];
//    }
    
    if ([textView.text isEqualToString:@"请填写您的收货地址"]) {
        textView.text = @"";
        textView.textColor = [UIColor colorWithHexString:@"c1c1c1"];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    if (textView.text == nil) {
        textView.textColor = [UIColor blackColor];
    }
}

#pragma mark  ----------DLCityPickerViewDelegate------------

-(void)customPickView:(DLCityPickerView *)customPickView selectedTitle:(NSString *)selectedTitle{
    
    [self.projctButton setTitle:selectedTitle forState:UIControlStateNormal];
    
}

-(void)requestEventAction:(UIButton *)button{
    
    [self.alertView closeView];
}

#pragma mark  ----------DLSalertViewDelegate------------

-(DLSalertView *)alertView{
    if (!_alertView) {
        self.alertView = [[DLSalertView alloc] initWithFrame:CGRectMake(40, 200, [UIScreen mainScreen].bounds.size.width - 80, 220)];
        self.firstField = self.alertView.firstField;
        self.alertView.backgroundColor = [UIColor whiteColor];
        self.alertView.delegate = self;
    }
    return _alertView;
}

@end
