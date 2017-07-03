//
//  DLCustomerChangePersonDataController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/3.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCustomerChangePersonDataController.h"
#import "DLCustomerChangeDataCell.h"
#import "DLHomeViewTask.h"
#import "BLMPickerView.h"

@interface DLCustomerChangePersonDataController ()<UITableViewDelegate,UITableViewDataSource,BLMPickerDelegate>
@property(nonatomic,strong) UITableView * personalDataTableView;
@property(nonatomic,strong) UILabel * label;
@property(nonatomic,strong) UITextField * nameTF;
@property(nonatomic,strong) UITextField * nickNameTF;
@property(nonatomic,strong) UILabel * phoneLabel;
@property(nonatomic,strong) UILabel * sexLabel;
@property(nonatomic,strong) UITextField * QQTF;
@property(nonatomic,strong) UITextField * mailTF;
@end

static NSString *cellID = @"cellID";
static NSString *cell1ID = @"cell1ID";

@implementation DLCustomerChangePersonDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
    [self setTab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI{
    self.title = @"修改个人资料";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(completeClick)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithHexString:@"4d65f3"];
}

-(void)setTab{
    
    self.personalDataTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.personalDataTableView.dataSource = self;
    self.personalDataTableView.delegate = self;
    self.personalDataTableView.tableFooterView = [UIView new];
    self.personalDataTableView.backgroundColor = [UIColor ms_backgroundColor];
    
    [self.personalDataTableView registerClass:[DLCustomerChangeDataCell class] forCellReuseIdentifier: cellID];
    [self.personalDataTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cell1ID];
    
    [self.view addSubview:self.personalDataTableView];
    
    [self.personalDataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

///邮箱地址的正则表达式
- (BOOL)isValidateEmail:(NSString *)email{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


#pragma mark ------ fetchData
-(void)fetchData{
    
        NSDictionary *param = @{
                                @"uid":[DLUtils getUid],
                                @"sign_token" : [DLUtils getSign_token]
                                };
    
        [DLHomeViewTask getTouristPersonPageData:param completion:^(id result, NSError *error) {
           
            NSDictionary *dict = result[@"agencyInfo"];
            self.nameTF.text = dict[@"name"];
            self.phoneLabel.text = dict[@"mobile"];

        }];
}

///保存
-(void)completeClick {
    
    
    if ([self isValidateEmail:self.mailTF.text]) {
        
        
        NSDictionary *param = @{
                                @"uid":[DLUtils getUid],
                                @"sign_token" : [DLUtils getSign_token],
                                @"name":self.nameTF.text,
                                @"nick_name":self.nickNameTF.text,
                                @"email":self.mailTF.text,
                                @"sex":self.sexLabel.text,
                                @"qq":self.QQTF.text
                                };
        
        [DLHomeViewTask getTouristPersonPageData:param completion:^(id result, NSError *error) {
            NSLog(@"修改成功!");
            
            UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"修改成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [successV show];
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
    }else{
    
        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"修改成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [successV show];
        [self.navigationController popViewControllerAnimated:YES];

    }
}


#pragma mark ----- UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    return 10;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == 2) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1ID];
        cell.textLabel.text = @"手机号:";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
        self.phoneLabel.text = cell.textLabel.text;
        
        UILabel *phoneLabel = [[UILabel alloc] init];
        self.phoneLabel = phoneLabel;
        phoneLabel.font = [UIFont systemFontOfSize:15];
        phoneLabel.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
        
        [cell.contentView addSubview:phoneLabel];
        
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15);
            make.height.offset(44);
            make.top.offset(0);
        }];
        return cell;
    }
    
    DLCustomerChangeDataCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    self.label = cell.label;
    cell.backgroundColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        
        self.label.text = @"姓名:";
        self.nameTF = cell.TF;
        self.nameTF.placeholder = @"请输入您的姓名";
   
    }else if(indexPath.row == 1) {
        
        self.label.text = @"昵称:";
        self.nickNameTF = cell.TF;
        self.nickNameTF.placeholder = @"请输入您的昵称";
        
    }else if(indexPath.row == 3) {
       
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
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

    }else if(indexPath.row == 4) {
        
        self.label.text = @"QQ号:";
        self.QQTF = cell.TF;
        self.QQTF.placeholder = @"请输入您的QQ号";
        
    }else if(indexPath.row == 5) {
        
        self.label.text = @"邮箱:";
        self.mailTF = cell.TF;
        self.mailTF.placeholder = @"请输入您的邮箱";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 3) {
        
        BLMPickerView *picker = [[BLMPickerView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        picker.arrayType = GenderArray;
        [self.view addSubview:picker];

    }
}

#pragma mark - -------------- BLMPickerDelegate -------------------

-(void)PickerSelectorIndixString:(NSString *)str
{
    self.sexLabel.text = str;

}

@end
