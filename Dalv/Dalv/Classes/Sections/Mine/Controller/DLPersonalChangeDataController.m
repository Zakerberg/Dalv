//
//  DLPersonalChangeDataController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLPersonalChangeDataController.h"
#import "DLChangePasswordController.h"
#import "DLPersonalChangeDataCell.h"
#import "BLMPickerView.h"

@interface DLPersonalChangeDataController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,BLMPickerDelegate>

@property (nonatomic,strong) UITableView * personalDataTableView;
@property (assign,nonatomic) NSIndexPath* selectedIndexPath;
@property (weak,nonatomic) UITableViewCell* cell;
@property (weak,nonatomic) DLPersonalChangeDataCell* personalCell;
@property (nonatomic,strong) UILabel *label;
@property (weak, nonatomic) UITextField *nickNameTF;
@property (weak, nonatomic) UITextField *noteLabelTF;
@property (weak, nonatomic) UITextField *mailTF;
@property (weak, nonatomic) UITextField *ageTF;
@property (weak, nonatomic) UITextView *goCityView;
@property (weak, nonatomic) UILabel *nameLabel;
@property (weak, nonatomic) UILabel *numLabel;
@property (nonatomic,strong) UILabel * sexLabel;
@property (weak, nonatomic) UITextField *workTimeTF;
@property (nonatomic,strong) NSString * sexStr;
@end

static NSString *cellID = @"cellID";
static NSString *tableViewCellID = @"tableViewCellID";
@implementation DLPersonalChangeDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setTableView];
    [self fetchData];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI{
    
    self.title = @"修改个人资料";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(completeClick)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithHexString:@"4d65f3"];
}

-(void)setTableView {
    
    self.personalDataTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.personalDataTableView.dataSource = self;
    self.personalDataTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.personalDataTableView.delegate = self;
    [self.personalDataTableView registerClass:[DLPersonalChangeDataCell class] forCellReuseIdentifier:cellID];
    [self.personalDataTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellID];
    
    [self.view addSubview:self.personalDataTableView];
    
    [self.personalDataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}


- (BOOL)isValidateMobile:(NSString *)mobile{
   
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


- (BOOL)isValidateEmail:(NSString *)email{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark  -------  fetchData

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    
    [DLHomeViewTask getAgencyPersonalPageSetUp:param completion:^(id result, NSError *error) {
        
        NSDictionary *dict = result[@"agencyInfo"];
        
        self.nameLabel.text = dict[@"name"];
        self.numLabel.text = dict[@"mobile"];
        
        self.nickNameTF.text = dict[@"nick_name"] ? dict[@"nick_name"] : @"未设置";
        self.mailTF.text = dict[@"email"] ? dict[@"email"] : @"未设置";
        
        self.goCityView.text = dict[@"been_where"];
        self.ageTF.text = dict[@"age"];
        self.noteLabelTF.text = dict[@"personal_label"];
        self.workTimeTF.text = dict[@"working_time"];
        self.sexLabel.text = dict[@"sex"];
        if ([dict[@"sex"] isEqualToString:@"1"]) {
            self.sexLabel.text = @"男";
        }else if([dict[@"sex"] isEqualToString:@"2"]) {
            self.sexLabel.text = @"女";
            
        }else {
            self.sexLabel.text = @"保密";
        }
    }];
}

-(void)completeClick {
    
    if ([self isValidateEmail:self.mailTF.text]) {
        
        if ([self.sexLabel.text isEqualToString:@"男"]) {
            self.sexLabel.text = @"1";
        }else if ([self.sexLabel.text isEqualToString:@"女"]){
            self.sexLabel.text = @"2";
        }else if ([self.sexLabel.text isEqualToString:@"保密"]){
            self.sexLabel.text = @"0";
        }
        
        NSDictionary *param = @{
                                @"uid":[DLUtils getUid],
                                @"sign_token" : [DLUtils getSign_token],
                                @"nick_name":self.nickNameTF.text,
                                @"email":self.mailTF.text,
                                @"sex":self.sexLabel.text,
                                @"age":self.ageTF.text,
                                @"working_time":self.workTimeTF.text,
                                @"personal_label":self.noteLabelTF.text,
                                @"been_where":self.goCityView.text
                                };
        
        [DLHomeViewTask getAgencyPersonaSetUpHandle:param completion:^(id result, NSError *error) {
            NSLog(@"修改成功!");
            UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"修改成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [successV show];
            [self.navigationController popViewControllerAnimated:YES];
            
        }];
        
    } else {
        
        UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的邮箱有误,请重新输入" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        [alertPhoneNum show];
        
        self.mailTF.text = nil;
    }
}

#pragma mark ----- UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 8) {
        return 88;
    }
    
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 9;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        DLPersonalChangeDataCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        self.label = cell.label;
        
        if (indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        if(indexPath.row == 0){//姓名
            self.label.text = @"姓名:";
            UILabel *nameLabel = [[UILabel alloc] init];
            self.nameLabel = nameLabel;
            nameLabel.font = [UIFont systemFontOfSize:15];
            nameLabel.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
            
            [cell.contentView addSubview:nameLabel];
            
            [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-15);
                make.height.offset(44);
                make.top.offset(0);
            }];
        }else if (indexPath.row == 1) {
            
            self.label.text = @"昵称:";
            UITextField *nickNameTF = [[UITextField alloc] init];
            self.nickNameTF = nickNameTF;
            nickNameTF.placeholder = @"请输入您的昵称";
            nickNameTF.textAlignment = NSTextAlignmentRight;
            nickNameTF.font = [UIFont systemFontOfSize:15];
            
            [cell.contentView addSubview:nickNameTF];
            
            [nickNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-15);
                make.height.offset(44);
                make.top.offset(0);
                make.left.equalTo(self.label.mas_right).offset(0);
            }];
        }else if (indexPath.row == 2) {
            self.label.text = @"性别:";
            
            UILabel *sexLabel = [[UILabel alloc] init];
            self.sexLabel = sexLabel;
            [sexLabel sizeToFit];
            sexLabel.font = [UIFont systemFontOfSize:17];
            sexLabel.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
            
            [cell.contentView addSubview:sexLabel];
            
            [sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-10);
                make.height.offset(44);
                make.top.offset(0);
            }];
            
        }else if (indexPath.row == 3) {
            self.label.text = @"年龄:";
            
            UITextField *ageTF = [[UITextField alloc] init];
            self.ageTF = ageTF;
            ageTF.textAlignment = NSTextAlignmentRight;
            ageTF.keyboardType = UIKeyboardTypeNumberPad;
            ageTF.font = [UIFont systemFontOfSize:17];
            
            [cell.contentView addSubview:ageTF];
            
            [ageTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-10);
                make.height.offset(44);
                make.top.offset(0);
                make.left.equalTo(self.label.mas_right).offset(0);
            }];
        }
        else if (indexPath.row == 4) {
            self.label.text = @"从业时间:";
            
            UITextField *workTimeTF = [[UITextField alloc] init];
            self.workTimeTF = workTimeTF;
            workTimeTF.placeholder = @"请输入您的从业时间";
            workTimeTF.textAlignment = NSTextAlignmentRight;
            workTimeTF.keyboardType = UIKeyboardTypeNumberPad;
            workTimeTF.font = [UIFont systemFontOfSize:17];
            
            [cell.contentView addSubview:workTimeTF];
            
            [workTimeTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-10);
                make.height.offset(44);
                make.top.offset(0);
                make.left.equalTo(self.label.mas_right).offset(0);
            }];
        }
        else if (indexPath.row == 5) {
            
            self.label.text = @"标签:";
            
            UITextField *noteLabelTF = [[UITextField alloc] init];
            self.noteLabelTF = noteLabelTF;
            noteLabelTF.placeholder = @"限填写5个,用逗号隔开";
            noteLabelTF.textAlignment = NSTextAlignmentRight;
            noteLabelTF.font = [UIFont systemFontOfSize:15];
            
            [cell.contentView addSubview:noteLabelTF];
            
            [noteLabelTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-15);
                make.height.offset(44);
                make.top.offset(0);
                make.left.equalTo(self.label.mas_right).offset(0);
            }];
            
        }else if (indexPath.row == 6) { 
            
            self.label.text = @"手机号:";
            UILabel *numLabel = [[UILabel alloc] init];
            self.numLabel = numLabel;
            numLabel.font = [UIFont systemFontOfSize:15];
            numLabel.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
            
            [cell.contentView addSubview:numLabel];
            
            [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-15);
                make.height.offset(44);
                make.top.offset(0);
            }];
            
        }else if (indexPath.row == 7) {
            
            self.label.text = @"邮箱:";
            
            UITextField *mailTF = [[UITextField alloc] init];
            self.mailTF = mailTF;
            mailTF.placeholder = @"请填写您的邮箱";
            mailTF.textAlignment = NSTextAlignmentRight;
            mailTF.font = [UIFont systemFontOfSize:15];
            
            [cell.contentView addSubview:mailTF];
            
            [mailTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-15);
                make.height.offset(44);
                make.top.offset(0);
                make.left.equalTo(self.label.mas_right).offset(0);
            }];
            
        }else if (indexPath.row == 8) {
            self.label.text = @"去过的地方:";
            
            UITextView *goCityView = [[UITextView alloc] init];
            
            self.goCityView = goCityView;
            goCityView.font = [UIFont systemFontOfSize:15];
            goCityView.delegate = self;
            goCityView.textColor = [UIColor colorWithHexString:@"#6b6b6b"];
            goCityView.text = @"描述你去过的地方";
            [cell.contentView addSubview:goCityView];
            
            [goCityView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-15);
                make.height.offset(80);
                make.top.offset(5);
                make.left.equalTo(self.label.mas_right).offset(0);
            }];
        }
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @"修改密码";
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectedIndexPath = indexPath ;
    self.personalCell = [self.personalDataTableView cellForRowAtIndexPath:self.selectedIndexPath];
    
    
    if (indexPath.row == 2) {
        
        BLMPickerView *picker = [[BLMPickerView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        picker.arrayType = GenderArray;
        [self.view addSubview:picker];
        
    }else if (indexPath.section == 1) {
        DLChangePasswordController * changePwdVC = [[DLChangePasswordController alloc] init];
        [self.navigationController pushViewController:changePwdVC animated:YES];
    }
}

#pragma mark ---- UITextViewDelegate

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"描述你去过的地方"]) {
        textView.text = @"";
        textView.textColor = [UIColor colorWithHexString:@"b6b6b6"];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    if (textView.text == nil) {
        textView.textColor = [UIColor blackColor];
    }
}

#pragma mark ------- BLMPickerDelegate

-(void)PickerSelectorIndixString:(NSString *)str
{
    
    self.sexLabel.text = str;
    
}

@end
