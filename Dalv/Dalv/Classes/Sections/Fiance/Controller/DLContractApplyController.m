//
//  DLContractApplyController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  -------------------  合同申请 ---------------------

#import "DLContractApplySection1Cell.h"
#import "DLContractApplySection2Cell.h"
#import "DLContractApplySection3Cell.h"
#import "DLContractApplySection4Cell.h"
#import "DLContractApplySection5Cell.h"
#import "DLContractApplySection0Cell.h"
#import "DLContractApplyController.h"
#import "DLAddReduceButton.h"
#import "DLRequestSerVice.h"
#import "DLHomeViewTask.h"

@interface DLContractApplyController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,DLAddReduceButtonDelegate>
/*** 自取inviteBtn  ***/
@property(nonatomic,strong)UIButton *inviteBtn;
/*** 快递CourierBtn ***/
@property(nonatomic,strong)UIButton *courierBtn;
/*** 到付Btn  ***/
@property(nonatomic,strong)UIButton *payforBtn;
/*** 邮寄Btn  ***/
@property(nonatomic,strong)UIButton *mailBtn;
/*** 邮寄地址TextView  ***/
@property(nonatomic,strong) UITextView * addressTV;

/*** 提交申请Btn  ***/
@property(nonatomic,strong) UIButton * submitBtn;

/*** 联系人姓名TextFiled  ***/
@property(nonatomic,strong) UITextField *nameTF;
/*** 联系人电话TextFiled  ***/
@property(nonatomic,strong) UITextField *numberTF;



@property (nonatomic, strong) UITableView *contractTableView;

@property(nonatomic,assign) NSInteger Section1Number;
@property(nonatomic,assign) NSInteger Section2Number;
@property(nonatomic,assign) NSInteger Section3Number;

//获取方式
@property(nonatomic,weak) NSString *methodBtnNumber;

//费用
@property(nonatomic,weak) NSString *express_feeNumber;

@property(nonatomic,strong)DLAddReduceButton *button1;
@property(nonatomic,strong)DLAddReduceButton *button2;
@property(nonatomic,strong)DLAddReduceButton *button3;

/* 公司地址 */
@property(nonatomic,strong) UILabel * addressLabel1;
/* 公司电话 */
@property(nonatomic,strong) UILabel * numberLabel1;

//空白自取blankInviteBtn
@property(nonatomic,strong)UIButton *blankInviteBtn;
//空白快递blankCourierBtn
@property(nonatomic,strong)UIButton *blankCourierBtn;
//空白到付blankPayforBtn
@property(nonatomic,strong)UIButton *blankPayforBtn;
//空白邮寄blankMailBtn
@property(nonatomic,strong)UIButton *blankMailBtn;

@end

//static NSString *nibCellID = @"nibCellID";
static NSString *section0CellID = @"section0CellID";
static NSString *section1CellID = @"section1CellID";
static NSString *section2CellID = @"section2CellID";
static NSString *section3CellID = @"section3CellID";
static NSString *section4CellID = @"section4CellID";
static NSString *section5CellID = @"section5CellID";

@implementation DLContractApplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"合同申请";
    [self setTableView];
    
    [self fetchData];
    
    self.Section1Number = 2;
    self.Section2Number = 0;
    self.Section3Number = 0;
}

#pragma mark ----------------- fetchData -----------------

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    
    [DLHomeViewTask getAgencyFinanceApplyContract:param completion:^(id result, NSError *error) {
        
        NSDictionary *invoiceDict = result;
        
        NSDictionary *operatorInfo = invoiceDict[@"contractFeeInfo"];
        
        NSString *companyStr = operatorInfo[@"address"];
        self.addressLabel1.text = companyStr;
        NSString *numStr = operatorInfo[@"tel"];
        self.numberLabel1.text = numStr;
        
    }];
}

#pragma mark ----------------- Set TableView -----------------

-(void)setTableView {
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    self.contractTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.contractTableView.dataSource = self;
    self.contractTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.contractTableView.delegate = self;
    [self.contractTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contractTableView.showsVerticalScrollIndicator = NO;
    
    /*注册
     [self.contractTableView registerNib:[UINib nibWithNibName:@"DLContractApplyViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
     [self.contractTableView registerClass:[DLContractApplySection0Cell class] forCellReuseIdentifier:section0CellID];
     */
    
    [self.contractTableView registerNib:[UINib nibWithNibName:@"DLContractApplySection0Cell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:section0CellID];
    
    [self.contractTableView registerClass:[DLContractApplySection1Cell class] forCellReuseIdentifier:section1CellID];
    
    [self.contractTableView registerClass:[DLContractApplySection2Cell class] forCellReuseIdentifier:section2CellID];
    
    [self.contractTableView registerClass:[DLContractApplySection3Cell class] forCellReuseIdentifier:section3CellID];
    
    [self.contractTableView registerClass:[DLContractApplySection4Cell class] forCellReuseIdentifier:section4CellID];
    
    [self.contractTableView registerClass:[DLContractApplySection5Cell class] forCellReuseIdentifier:section5CellID];
    
    
    [self.view addSubview:self.contractTableView];
    
    [self.contractTableView mas_makeConstraints:^(MASConstraintMaker *make) {
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

#pragma mark -----------  BtnClick ----------------

/*** 自取按钮 ***/
-(void)inviteBtnClick {
    
    self.methodBtnNumber = @"1";
    
    [self.inviteBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
    [self.courierBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    
    self.Section1Number = 2;
    self.Section2Number = 0;
    self.Section3Number = 0;
    [self.contractTableView reloadData];
}

/***  快递按钮 ***/
-(void)courierBtnClick {
    
    self.methodBtnNumber = @"2";
    
    [self.courierBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
    [self.inviteBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    
    self.Section1Number = 1;
    self.Section2Number = 1;
    self.Section3Number = 1;
    [self.contractTableView reloadData];
    
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
    
    if(self.button1.currentNumber != 0 || self.button2.currentNumber
       != 0 || self.button3.currentNumber != 0){
    
    //自取
    if ([self.methodBtnNumber isEqualToString:@"1"]) {
        
        NSDictionary *param1 = @{
                                 
                                 @"uid":[DLUtils getUid],
                                 @"sign_token" : [DLUtils getSign_token],
                                 @"request_method":self.methodBtnNumber,
                                 @"inland":[NSString stringWithFormat:@"%ld",self.button1.currentNumber],
                                 @"outbound":[NSString stringWithFormat:@"%ld",self.button2.currentNumber],
                                 @"peritem":[NSString stringWithFormat:@"%ld",self.button3.currentNumber],
                                 
                                 @"code":@"400",
                                 };
        
        [DLHomeViewTask getAgencyFinanceApplyContractHandle:param1 completion:^(id result, NSError *error) {
            
            UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"申请成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [successV show];
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    
    //快递
    else if ([self.methodBtnNumber isEqualToString:@"2"]){
        
        if (self.addressTV.text != nil && self.nameTF.text != nil && self.numberTF.text != nil) {
            
            NSDictionary *param = @{
                                    
                                    @"uid" : [DLUtils getUid],
                                    @"sign_token" : [DLUtils getSign_token],
                                    @"addr":self.addressTV.text,
                                    @"name":self.nameTF.text,
                                    @"phone":self.numberTF.text,
                                    @"request_method":self.methodBtnNumber,
                                    @"express_fee":self.express_feeNumber,
                                    @"inland":[NSString stringWithFormat:@"%ld",self.button1.currentNumber],
                                    @"outbound":[NSString stringWithFormat:@"%ld",self.button2.currentNumber],
                                    @"peritem":[NSString stringWithFormat:@"%ld",self.button3.currentNumber],
                                    
                                    @"code":@"400",
                                    };
            [DLHomeViewTask getAgencyFinanceApplyContractHandle:param completion:^(id result, NSError *error) {
                NSLog(@"%@",result);
                
                UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"申请成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [successV show];
                [self.navigationController popViewControllerAnimated:YES];
                
            }];
        }else{
            
        }
    }
        
    }else{
        
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"至少申请一份合同" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
    }
}
#pragma mark  ----------UITable View Delegate------------

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    
    if (section == 3)
    {
        return 10;
    }
    
    return 25;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0 ) {
        return 52*3;
    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        return 80;
    }
    if (indexPath.section == 4)
    {
        return 80;
    }
    if (indexPath.section == 3){
        
        return 165;
    }
    
    return 45;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 1;
    }
    
    else if (section == 1){
        return self.Section1Number;
    }
    
    else if (section == 2){
        return self.Section2Number;
    }
    
    else if (section == 4){
        return 1;
    }
    
    return self.Section3Number;
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        DLContractApplySection0Cell *cell = [tableView dequeueReusableCellWithIdentifier:section0CellID];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.button1 = cell.button1;
        self.button2 = cell.button2;
        self.button3 = cell.button3;
        
        return cell;
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
        
        DLContractApplySection1Cell *cell = [tableView dequeueReusableCellWithIdentifier:section1CellID];
        self.inviteBtn = cell.inviteBtn;
        self.courierBtn = cell.courierBtn;

        self.blankCourierBtn = cell.blankCourierBtn;
        self.blankInviteBtn = cell.blankInviteBtn;
        
        [cell.blankInviteBtn addTarget:self action:@selector(inviteBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [cell.blankCourierBtn  addTarget:self action:@selector(courierBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.inviteBtn addTarget:self action:@selector(inviteBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.courierBtn addTarget:self action:@selector(courierBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    
    else if (indexPath.section == 1 && indexPath.row == 1) {
        
        DLContractApplySection2Cell *cell = [tableView dequeueReusableCellWithIdentifier:section2CellID];
        
        //公司的地址和电话
        self.addressLabel1 = cell.addressLabel1;
        self.numberLabel1 = cell.numberLabel1;
        
        return cell;
    }
    
    else if (indexPath.section == 2) {
        
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
    else if (indexPath.section == 3){
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
    if ([textView.text isEqualToString:@"请填写您的收货地址"]) {
        textView.text = @"";
        textView.textColor = [UIColor colorWithHexString:@"b6b6b6"];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    if (textView.text == nil) {
        textView.textColor = [UIColor blackColor];
    }
}

#pragma mark ---------  DLAddReduceButtonDelegate  -------------


- (void)pp_numberButton:(__kindof UIView *)numberButton number:(NSInteger)number increaseStatus:(BOOL)increaseStatus{
    
}

@end
