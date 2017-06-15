//
//  DLChangeTitleViewController.m
//  Dalv
//
//  Created by Nie on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLChangeTitleViewController.h"
#import "DLHomeViewTask.h"
@interface DLChangeTitleViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *changeTitleTextField;

@end

@implementation DLChangeTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];

    self.view.backgroundColor = [UIColor colorWithHexString:@"efefef"];
}

#pragma mark - Setup navbar
- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"修改标题";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)setupSubviews {
    UIBarButtonItem *registerbutton= [UIBarButtonItem itemWithTitle:@"保存" target:self action:@selector(changeTitleButton)];
    registerbutton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = registerbutton;
    
    UIView *backview = [[UIView alloc]init];
    backview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backview];
    
    self.changeTitleTextField = [[UITextField alloc] init];
    self.changeTitleTextField.font = [UIFont systemFontOfSize:16];
    self.changeTitleTextField.keyboardType = UIKeyboardTypeTwitter;
    self.changeTitleTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.changeTitleTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.changeTitleTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.changeTitleTextField.leftViewMode = UITextFieldViewModeAlways;
    self.changeTitleTextField.delegate = self;
    [backview addSubview:self.changeTitleTextField];
    
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@0);
        make.width.equalTo(self.view);
        make.height.equalTo(@50);
    }];
    
    [self.changeTitleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backview);
        make.left.equalTo(@15);
        make.width.equalTo(backview).with.offset(-15);
        make.height.equalTo(@50);
    }];

}
#pragma mark - ButtonAction

- (void)changeTitleButton
{    
    if (self.changeTitleTextField.text.length == 0) {
        [[DLHUDManager sharedInstance]showTextOnly:@"你还没有输入标题"];
        return;
    }if (self.changeTitleTextField.text.length > 32) {
        [[DLHUDManager sharedInstance]showTextOnly:@"字数不能大于32位"];
        return;
    }else {
        NSDictionary *param = @{@"uid" : [DLUtils getUid],
                                @"shareTitle" : self.changeTitleTextField.text,
                                @"tour_id" : self.routeModel.routeId,
                                @"sign_token" : [DLUtils getSign_token],};
        [DLHomeViewTask getAgencyPersonalChangeTitle:param completion:^(id result, NSError *error) {
            if ([[result objectForKey:@"status"] isEqualToString:@"00000"]) {
                [[DLHUDManager sharedInstance] showTextOnly:[result objectForKey:@"msg"]];
                [self.navigationController popViewControllerAnimated:YES];
            }else {
                [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
            }
        }];
        
    }

}
@end
