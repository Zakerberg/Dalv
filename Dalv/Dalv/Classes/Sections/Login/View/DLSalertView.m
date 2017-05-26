//
//  DLSalertView.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLSalertView.h"
#import "UIView+Frame.h"


@interface DLSalertView()
@property(nonatomic,strong)UIView *bgView;
@end
@implementation DLSalertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

-(void)createView
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 8;
    self.clipsToBounds = YES;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 80, 40)];
    label.text = @"其它城市";
    label.backgroundColor = [UIColor blueColor];//---------后期修改颜色--
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.firstField = [[UITextField alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width - 80, 40)];
    self.firstField.placeholder = @"请输入城市";
    [self addSubview:self.firstField];
    UIButton *buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonOne.frame = CGRectMake(0, 140, ([UIScreen mainScreen].bounds.size.width - 80)/2, 40);
    [buttonOne setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonOne setTitle:@"取消" forState:UIControlStateNormal];
    
    [buttonOne addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonOne];
    UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonTwo.frame = CGRectMake(buttonOne.bounds.size.width, 140, ([UIScreen mainScreen].bounds.size.width - 80)/2, 40);
    [buttonTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [buttonTwo setTitle:@"确定" forState:UIControlStateNormal];
    
    [buttonTwo addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonTwo];
    
    
    
}
#pragma mark ====展示view
- (void)showView
{
    _firstField.text = @"";
    if (self.bgView) {
        return;
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.bgView addGestureRecognizer:tap];
    self.bgView.userInteractionEnabled = YES;
    self.bgView.backgroundColor = [UIColor blackColor];
    self.bgView.alpha = 0.4;
    [window addSubview:self.bgView];
    [window addSubview:self];
    
}
-(void)tap:(UIGestureRecognizer *)tap
{
    [self.bgView removeFromSuperview];
    self.bgView = nil;
    [self removeFromSuperview];
}

- (void)closeView
{
    [self.bgView removeFromSuperview];
    self.bgView = nil;
    [self removeFromSuperview];
}



/***** 取消按钮  ****/
-(void)cancelAction:(UIButton *)sender
{
    [self closeView];
}


/***** 确定按钮  ****/
-(void)sendAction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(requestEventAction:)]) {
        [self.delegate requestEventAction:sender];
    }
    
}
@end
