//
//  DLFeedBackController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLFeedBackController.h"
#import "UILabel+Extension.h"

@interface DLFeedBackController ()<UITextViewDelegate>
@property (nonatomic,strong) UITextView *textView;
@end

@implementation DLFeedBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI{
    
    self.title = @"意见反馈";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UITextView *textView = [[UITextView alloc]init];

    textView.scrollEnabled = NO;
    textView.text = @" 请写下您的宝贵意见,我们为您更好的服务";
    textView.font = [UIFont systemFontOfSize:16];
    textView.textColor = [UIColor lightGrayColor];
    textView.delegate = self;
    self.textView = textView;
    
    [self.view addSubview:textView];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交您的意见" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.backgroundColor = [UIColor colorWithHexString:@"#4d67ee"];
    submitBtn.layer.cornerRadius = 8.0;
    
    [self.view addSubview:submitBtn];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(15);
        make.height.offset(200);
        make.left.equalTo(@18);
        make.right.equalTo(self.view.mas_right).offset(-18);
    }];

    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textView.mas_bottom).offset(43);
        make.height.offset(44);
        make.left.equalTo(@18);
        make.right.equalTo(self.view.mas_right).offset(-18);
    }];
}

- (void)btnClick {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"已发送" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma --------------- UITextViewDelegate

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    textView.text = @"";
    
    textView.textColor = [UIColor blackColor];
    
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textView resignFirstResponder];
}


@end
