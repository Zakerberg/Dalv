//
//  DLMyAgencyController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/21.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ------------------ 我的顾问  ----------------------

#import "DLMyAgencyController.h"
#import "DLHomeViewTask.h"

@interface DLMyAgencyController ()

@property(nonatomic,strong) UIImageView *imageView;//头像
@property(nonatomic,strong) UILabel  * nameLabel;//名字
@property(nonatomic,strong) UILabel * nickNameLabel;//昵称
@property(nonatomic,strong) UILabel * sexLabel;//性别
@property(nonatomic,strong) UILabel * ageLabel;//年龄
@property(nonatomic,strong) UILabel * workTimeLabel;//从业时间


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


-(void)setUI{
    
    self.title = @"我的顾问";
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    self.imageView = imageView;
    [imageView setImage:[UIImage imageNamed:@"v2_my_avatar"]];
    
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = (60);
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
    
    
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@30);
        make.height.width.equalTo(@120);
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
    
    
}




-(void)fetchData {
    
    NSDictionary *param = @{
                            
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token]
                            
                            };

    
    [DLHomeViewTask getTouristPersonalMyAgenct:param completion:^(id result, NSError *error) {
        
    }];
    
    
    
    
    
    
}
























































































































































































































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
