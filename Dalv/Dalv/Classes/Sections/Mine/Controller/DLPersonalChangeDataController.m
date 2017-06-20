//
//  DLPersonalChangeDataController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLPersonalChangeDataController.h"
#import "DLChangePasswordController.h"
#import "DLPersonalChangeDataCell.h"
#import "DLHomeViewTask.h"
#import "JHPickView.h"

@interface DLPersonalChangeDataController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,JHPickerDelegate>
@property(nonatomic,strong) UITableView * personalDataTableView;
@property (assign,nonatomic) NSIndexPath* selectedIndexPath;
@property (weak,nonatomic) UITableViewCell* cell;
@property (weak,nonatomic) DLPersonalChangeDataCell* personalCell;
@property(nonatomic,strong) UILabel *label;
/**** 昵称  ****/
@property (weak, nonatomic) UITextField *nickNameTF;
/**** 标签  ****/
@property (weak, nonatomic) UITextField *noteLabelTF;
/**** 邮箱  ****/
@property (weak, nonatomic) UITextField *mailTF;
/**** 年龄  ****/
@property (weak, nonatomic) UITextField *ageTF;
/**** 去过的城市textView  *****/
@property (weak, nonatomic) UITextView *goCityView;
/**** 名字  ****/
@property (weak, nonatomic) UILabel *nameLabel;
/**** 手机号  ****/
@property (weak, nonatomic) UILabel *numLabel;


@property (weak, nonatomic) UITextField * userSexText;


@end

static NSString *cellID = @"cellID";
static NSString *tableViewCellID = @"tableViewCellID";
@implementation DLPersonalChangeDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改个人资料";
    [self setTableView];
    [self fetchData];
}

- (BOOL)dl_blueNavbar {
    return YES;
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


#pragma mark  ----------------  fetchData  ------------------

-(void)fetchData{
    
    NSDictionary *param = @{
                            
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    [DLHomeViewTask getAgencyPersonalPageSetUp:param completion:^(id result, NSError *error) {
       
        NSDictionary *dict = result[@"agencyInfo"];
        
        self.nameLabel.text = dict[@"name"];
        self.numLabel.text = dict[@"mobile"];
        self.nickNameTF.text = dict[@"nick_name"];
        self.goCityView.text = dict[@"been_where"];
        self.ageTF.text = dict[@"age"];
        self.noteLabelTF.text = dict[@"personal_label"];
        self.mailTF.text = dict[@"email"];
        
    }];
}

#pragma mark ------------- UITableView Delegate -------------

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
        
        DLPersonalChangeDataCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        self.label = cell.label;
        
        if (indexPath.row == 2 || indexPath.row == 3){
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
        }else if (indexPath.row == 1) {//昵称
            
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
        }else if (indexPath.row == 2) {//性别
            self.label.text = @"性别:";
            
            
            
            
            
            
            
        }else if (indexPath.row == 3) {//年龄
            self.label.text = @"年龄:";
            
            UITextField *ageTF = [[UITextField alloc] init];
            self.ageTF = ageTF;
            ageTF.textAlignment = NSTextAlignmentRight;
            ageTF.keyboardType = UIKeyboardTypeNumberPad;
            ageTF.font = [UIFont systemFontOfSize:15];
            
            [cell.contentView addSubview:ageTF];
            
            [ageTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-15);
                make.height.offset(44);
                make.top.offset(0);
                make.left.equalTo(self.label.mas_right).offset(0);
            }];
         }else if (indexPath.row == 4) {//从业时间
            self.label.text = @"从业时间:";
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
            
        }else if (indexPath.row == 5) {//标签
            
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
            
        }else if (indexPath.row == 6) {//手机号
            
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

        }else if (indexPath.row == 7) {//邮箱
            
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
            
        }else if (indexPath.row == 8) {//去过的地方
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

    
    if (indexPath.row == 2) {//性别
        JHPickView *picker = [[JHPickView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        picker.arrayType = GenderArray;
        [self.view addSubview:picker];
        
        
    }else if (indexPath.section == 1) {    /*** 修改密码 ***/
        DLChangePasswordController * changePwdVC = [[DLChangePasswordController alloc] init];
        [self.navigationController pushViewController:changePwdVC animated:YES];
    }
}

#pragma mark ---------  UITextViewDelegate  -------------

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

#pragma mark - -------------- JHPickerDelegate -------------------

-(void)PickerSelectorIndixString:(NSString *)str
{
    
    UITableViewCell* cell = [self.personalDataTableView cellForRowAtIndexPath:self.selectedIndexPath] ;
    cell.detailTextLabel.text = str ;
    
}

@end
