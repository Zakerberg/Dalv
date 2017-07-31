//
//  DLMyAgencyController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/21.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLMyAgencyController.h"
#import "DLMyAgencyUnBindingController.h"

@interface DLMyAgencyController ()
@property (nonatomic,strong) NSDictionary *myAgencyList;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel  * nameLabel;
@property (nonatomic,strong) UILabel * nickNameLabel;
@property (nonatomic,strong) UILabel * sexLabel;
@property (nonatomic,strong) UILabel * ageLabel;
@property (nonatomic,strong) UILabel * workTimeLabel;
@property (nonatomic,strong) UITextView * personTV;
@property (nonatomic,strong) UILabel * numberLabel;
@property (nonatomic,strong) UILabel * mailLabel;
@property (nonatomic,strong) UITextView * noteTV;
@property (nonatomic,strong) UIButton * unBindingBtn;
@property(nonatomic,strong) UIButton * contractBtn;
@end

@implementation DLMyAgencyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI{
    
    self.title = @"我的顾问";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    self.imageView = imageView;
    [imageView setImage:[UIImage imageNamed:@"v2_my_avatar"]];
    
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = (30);
    imageView.layer.borderWidth = 2.0;
    imageView.layer.borderColor = [UIColor colorWithHexString:@"#7286fc"].CGColor;
    
    [self.view addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    nameLabel.font = [UIFont systemFontOfSize:16];
    nameLabel.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(16.0)];
    nameLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
    [nameLabel sizeToFit];
    
    [self.view addSubview:nameLabel];
    
    UILabel *nick = [[UILabel alloc] init];
    nick.text = @"昵称:";
    nick.textColor = [UIColor colorWithHexString:@"#a6a6a6"];
    [nick sizeToFit];
    nick.font = [UIFont systemFontOfSize:14];
    
    [self.view addSubview:nick];
    
    
    UILabel *nickNameLabel = [[UILabel alloc] init];
    self.nickNameLabel = nickNameLabel;
    nickNameLabel.textColor = [UIColor colorWithHexString:@"#a6a6a6"];
    nickNameLabel.font = [UIFont systemFontOfSize:14];
    [nickNameLabel sizeToFit];
    
    [self.view addSubview:nickNameLabel];
    
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    
    [self.view addSubview:line];
    
    UILabel *sex = [[UILabel alloc] init];
    sex.text = @"性别:";
    sex.font = [UIFont systemFontOfSize:15];
    [sex sizeToFit];
    sex.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
    
    [self.view addSubview:sex];
    
    UILabel *sexLabel = [[UILabel alloc] init];
    self.sexLabel = sexLabel;
    sexLabel.font = [UIFont systemFontOfSize:15];
    [sexLabel sizeToFit];
    sexLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
    
    [self.view addSubview:sexLabel];
    
    
    UILabel *age = [[UILabel alloc] init];
    age.text = @"年龄:";
    age.font = [UIFont systemFontOfSize:15];
    [age sizeToFit];
    age.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
    
    [self.view addSubview:age];
    
    UILabel *ageLabel = [[UILabel alloc] init];
    self.ageLabel = ageLabel;
    ageLabel.font = [UIFont systemFontOfSize:15];
    [ageLabel sizeToFit];
    ageLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
    
    [self.view addSubview:ageLabel];
    
    UILabel *workTimeLabel = [[UILabel alloc] init];
    self.workTimeLabel = workTimeLabel;
    workTimeLabel.font = [UIFont systemFontOfSize:15];
    [workTimeLabel sizeToFit];
    workTimeLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
    
    [self.view addSubview:workTimeLabel];
    
    UILabel *workTime = [[UILabel alloc] init];
    workTime.text = @"从业时间:";
    workTime.font = [UIFont systemFontOfSize:15];
    [workTime sizeToFit];
    workTime.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
    
    [self.view addSubview:workTime];
    
    
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    
    [self.view addSubview:line1];
    
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"标签:";
    title.font = [UIFont systemFontOfSize:15];
    [title sizeToFit];
    title.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    
    [self.view addSubview:title];
    
    UITextView *personTV = [[UITextView alloc] init];
    self.personTV = personTV;
    
    personTV.font = [UIFont systemFontOfSize:15];
    personTV.textColor = [UIColor colorWithHexString:@"#6b6b6b"];
    
    [self.view addSubview:personTV];
    
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    
    [self.view addSubview:line2];
    
    UILabel *number = [[UILabel alloc] init];
    number.text = @"手机号:";
    number.font = [UIFont systemFontOfSize:15];
    [number sizeToFit];
    number.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
    
    [self.view addSubview:number];
    
    
    UILabel *numberLabel = [[UILabel alloc] init];
    self.numberLabel = numberLabel;
    numberLabel.font = [UIFont systemFontOfSize:15];
    [numberLabel sizeToFit];
    numberLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
    
    [self.view addSubview:numberLabel];
    
    UIView *line3 = [[UIView alloc] init];
    line3.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    
    [self.view addSubview:line3];
    
    
    UILabel *mail = [[UILabel alloc] init];
    mail.text = @"邮箱:";
    mail.font = [UIFont systemFontOfSize:15];
    [mail sizeToFit];
    mail.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
    
    [self.view addSubview:mail];
    
    
    UILabel *mailLabel = [[UILabel alloc] init];
    self.mailLabel = mailLabel;
    mailLabel.font = [UIFont systemFontOfSize:15];
    [mailLabel sizeToFit];
    mailLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
    
    [self.view addSubview:mailLabel];
    
    
    UIView *line4 = [[UIView alloc] init];
    line4.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    
    [self.view addSubview:line4];
    
    
    UITextView *noteTV = [[UITextView alloc] init];
    self.noteTV = noteTV;
    noteTV.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    noteTV.font = [UIFont systemFontOfSize:16];
    
    [self.view addSubview:noteTV];
    
    
    UIButton *contractBtn = [[UIButton alloc] init];
    self.contractBtn = contractBtn;
    contractBtn.backgroundColor = [UIColor colorWithHexString:@"#6177f9"];
    [contractBtn addTarget:self action:@selector(contractBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [contractBtn setTitle:@"联系顾问" forState:UIControlStateNormal];
    [contractBtn setTintColor:[UIColor colorWithHexString:@"#ffffff"]];
    
    [self.view addSubview:contractBtn];
    
    
    UIButton *unBindingBtn = [[UIButton alloc] init];
    self.unBindingBtn = unBindingBtn;
    unBindingBtn.backgroundColor = [UIColor redColor];
    
    if ([[DLUtils getUser_bingdingState] isEqualToString:@"1"]) {
        
        [unBindingBtn addTarget:self action:@selector(unBindingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [unBindingBtn setTitle:@"解绑顾问" forState:UIControlStateNormal];
        
    }else{
        
        [unBindingBtn addTarget:self action:@selector(bindingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [unBindingBtn setTitle:@"绑定顾问" forState:UIControlStateNormal];
        
    }
    
    [unBindingBtn setTintColor:[UIColor colorWithHexString:@"#979797"]];
    
    [self.view addSubview:unBindingBtn];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@20);
        make.height.width.equalTo(@60);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(14);
        make.centerY.equalTo(imageView.mas_centerY).offset(-16);
        make.height.offset(16);
    }];
    
    [nick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left).offset(0);
        make.top.equalTo(nameLabel.mas_bottom).offset(12);
        make.height.offset(14);
    }];
    
    [nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nick.mas_right);
        make.height.offset(14);
        make.centerY.equalTo(nick);
    }];
    
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).with.offset(15);
        make.width.equalTo(self.view);
        make.height.equalTo(@0.5);
    }];
    
    [sex mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(15);
        make.height.left.offset(15);
    }];
    
    [sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sex.mas_right).offset(4);
        make.height.offset(15);
        make.centerY.equalTo(sex);
    }];
    
    [age mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(15);
        make.centerX.offset(-30);
        make.height.offset(15);
    }];
    
    [ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(age.mas_right).offset(4);
        make.height.offset(15);
        make.top.equalTo(line.mas_bottom).offset(15);
    }];
    
    
    [workTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-15);
        make.top.equalTo(line.mas_bottom).offset(15);
        make.height.offset(15);
    }];
    
    [workTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(15);
        make.top.equalTo(line.mas_bottom).offset(15);
        make.right.equalTo(workTimeLabel.mas_left).offset(-4);
    }];
    
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sexLabel.mas_bottom).with.offset(15);
        make.width.equalTo(self.view);
        make.height.equalTo(@0.5);
    }];
    
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(15);
        make.height.left.offset(15);
    }];
    
    [personTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.height.offset(75);
        make.top.equalTo(line1.mas_bottom).offset(5);
        make.left.equalTo(title.mas_right).offset(5);
    }];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(80);
        make.height.equalTo(@0.5);
        make.width.equalTo(self.view);
    }];
    
    [number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.mas_bottom).offset(15);
        make.height.left.offset(15);
    }];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(number.mas_right).offset(4);
        make.height.offset(15);
        make.centerY.equalTo(number);
    }];
    
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(number.mas_bottom).offset(15);
        make.height.equalTo(@0.5);
        make.width.equalTo(self.view);
    }];
    
    [mail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line3.mas_bottom).offset(15);
        make.height.left.offset(15);
    }];
    
    [mailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mail.mas_right).offset(4);
        make.height.offset(15);
        make.centerY.equalTo(mail);
    }];
    
    
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mail.mas_bottom).offset(15);
        make.height.equalTo(@0.5);
        make.width.equalTo(self.view);
    }];
    
    [noteTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line4.mas_bottom).offset(15);
        make.height.offset(100);
        make.left.offset(15);
        make.width.equalTo(self.view);
    }];
    
    
    [contractBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.offset(0);
        make.height.offset(45);
        make.width.offset(MAIN_SCREEN_WIDTH/2);
    }];
    
    
    [unBindingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.offset(0);
        make.height.offset(45);
        make.width.offset(MAIN_SCREEN_WIDTH/2);
    }];
}

#pragma mark ----- fetchData

-(void)fetchData {
    
    if([[DLUtils getUser_bingdingState] isEqualToString:@"0"]){ /// 重新绑定
        
        NSDictionary *param = @{
                                @"uid":[DLUtils getUid],
                                @"sign_token" : [DLUtils getSign_token],
                                @"agency_id": self.agencyID
                                };
        
        [DLHomeViewTask getTouristPersonlAgencyDetails:param completion:^(id result, NSError *error) {
            
            self.myAgencyList = result[@"agencyInfo"];
            
            NSURL *url = [NSURL URLWithString:self.myAgencyList[@"head_pic"]];
            
            [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
            
            self.nameLabel.text = self.myAgencyList[@"name"];
            self.nickNameLabel.text = self.myAgencyList[@"nick_name"];
            
            if ([_myAgencyList[@"sex"] isEqualToString:@"1"]) {
                self.sexLabel.text = @"男";
            } else if ([_myAgencyList[@"sex"] isEqualToString:@"2"]){
                self.sexLabel.text = @"女";
            } else {
                self.sexLabel.text = @"保密";
            }
            self.workTimeLabel.text = self.myAgencyList[@"working_time"] ? self.myAgencyList[@"working_time"] : @"暂未设置";
            self.noteTV.text = self.myAgencyList[@"been_where"] ? self.myAgencyList[@"been_where"] : @"暂未设置";
            self.mailLabel.text = self.myAgencyList[@"email"] ? self.myAgencyList[@"email"] : @"暂未设置";
            self.ageLabel.text = self.myAgencyList[@"age"] ? self.myAgencyList[@"age"] : @"暂未设置";
            self.personTV.text = self.myAgencyList[@"personal_label"] ?  : @"暂未设置";
            self.numberLabel.text = self.myAgencyList[@"mobile"];
        }];
        
    }else{/// 已经绑定
        
        NSDictionary *param = @{
                                @"uid":[DLUtils getUid],
                                @"sign_token" : [DLUtils getSign_token]
                                };
        
        [DLHomeViewTask getTouristPersonalMyAgenct:param completion:^(id result, NSError *error) {
            
            self.myAgencyList = result[@"agencyInfo"];
            
            NSURL *url = [NSURL URLWithString:self.myAgencyList[@"head_pic"]];
            
            [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
            
            self.nameLabel.text = self.myAgencyList[@"name"];
            self.nickNameLabel.text = self.myAgencyList[@"nick_name"];
            
            if ([_myAgencyList[@"sex"] isEqualToString:@"1"]) {
                self.sexLabel.text = @"男";
            } else if ([_myAgencyList[@"sex"] isEqualToString:@"2"]){
                self.sexLabel.text = @"女";
            } else {
                self.sexLabel.text = @"保密";
            }
            self.workTimeLabel.text = self.myAgencyList[@"working_time"] ? self.myAgencyList[@"working_time"] : @"暂未设置";
            self.noteTV.text = self.myAgencyList[@"been_where"] ? self.myAgencyList[@"been_where"] : @"暂未设置";
            self.mailLabel.text = self.myAgencyList[@"email"] ? self.myAgencyList[@"email"] : @"暂未设置";
            self.ageLabel.text = self.myAgencyList[@"age"] ? self.myAgencyList[@"age"] : @"暂未设置";
            self.personTV.text = self.myAgencyList[@"personal_label"] ?  : @"暂未设置";
            self.numberLabel.text = self.myAgencyList[@"mobile"];
        }];
    }
}

#pragma mark ----- BtnClick

/// 联系顾问
-(void)contractBtnClick {
    
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",self.numberLabel.text];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

/// 解除绑定
-(void)unBindingBtnClick {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"解绑后后您需要重新绑定新的顾问,是否解绑?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"解绑" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSDictionary *param = @{
                                @"uid":[DLUtils getUid],
                                @"sign_token" : [DLUtils getSign_token]
                                };
        [DLHomeViewTask getTouristPersonPageUnbundingAgency:param completion:^(id result, NSError *error) {
            
            if ([result[@"status"] isEqualToString:@"00000"]) {
                [self.navigationController popViewControllerAnimated:YES];
                
                UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"解绑成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [successV show];
                [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"binding_state"];
                
            }else{
                
                if ([result[@"status"] isEqualToString:@"00025"]) {
                    
                    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"解绑失败,联系客服!" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                    [alertV show];
                }
            }
        }];
    }];
    
    UIAlertAction *actionCancle = [UIAlertAction actionWithTitle:@"在想想" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:actionOk];
    [alert addAction:actionCancle];
    
    [self presentViewController:alert animated:YES completion:nil];
}

/// 绑定顾问
-(void)bindingBtnClick {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您确定绑定此顾问?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSDictionary *param = @{
                                @"uid":[DLUtils getUid],
                                @"sign_token" : [DLUtils getSign_token],
                                @"agency_id": self.agencyID
                                };
        
        [DLHomeViewTask getTouristPersonlBindingAgency:param completion:^(id result, NSError *error) {
            
            [self.navigationController popViewControllerAnimated:YES];
            [self.navigationController popViewControllerAnimated:YES];
            
            UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"绑定成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [successV show];
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"binding_state"];
            
        }];
    }];
    
    UIAlertAction *actionCancle = [UIAlertAction actionWithTitle:@"再想想" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:actionOk];
    [alert addAction:actionCancle];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
