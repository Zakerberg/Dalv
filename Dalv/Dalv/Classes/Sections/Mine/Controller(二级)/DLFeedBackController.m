//
//  DLFeedBackController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFeedBackController.h"
#import "UILabel+Extension.h"

@interface DLFeedBackController ()<UITextViewDelegate>
@property (nonatomic,strong) UITextView *textView;
@end

@implementation DLFeedBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
}

-(void)setUI{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"意见反馈";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navbar_back_gray"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    
    UILabel *textLabel = [UILabel blm_labelWithText:@"您的批评和帮助能帮助我们更好的完善产品,请留下您宝贵的意见!" fontSize:14.0 color:[UIColor blackColor]];
    textLabel.numberOfLines = 0;
    textLabel.frame = CGRectMake(18, 18, self.view.bounds.size.width - 36, 55);
    [self.view addSubview:textLabel];
    //    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.top.right.offset(18);
    //    }];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(18, 65, self.view.bounds.size.width - 36, 200)];
    //设置是否可以滚动
    textView.scrollEnabled = NO;
    textView.text = @"请输入宝贵意见(300字以内)";
    textView.delegate = self;
    self.textView = textView;
    [self.view addSubview:textView];

}


/****发送按钮 ****/
- (void)btnClick {
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"已发送" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self back];
    }];
    
    
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)back {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    textView.text=@"";
    
    textView.textColor = [UIColor blackColor];
    
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
