//
//  DLShopViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/15.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLShopViewController.h"

@interface DLShopViewController ()

@end

@implementation DLShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupNav];
}



-(void)setupUI{
    
   self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:0.9];
    
}


-(void)setupNav
{

    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:252/255.0 green:74/255.0 blue:132/255.0 alpha:0.9];//里面的item颜色
    self.navigationController.navigationBar.translucent = NO;//是否为半透明
    
    //右边按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"home-10-02"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 20, 20);
    [rightButton addTarget:self action:@selector(rightBtnClick1:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    UIButton *leftBUtton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBUtton setBackgroundImage:[UIImage imageNamed:@"home-10-04"] forState:UIControlStateNormal];
    leftBUtton.frame = CGRectMake(0, 0, 24, 24);
    [leftBUtton addTarget:self action:@selector(rightBtnClick2:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:leftBUtton];
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
    self.navigationItem.title = @"商城";
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;





}

-(void)rightBtnClick1:(UIButton *)button{
    
}



-(void)rightBtnClick2:(UIButton *)button{
    
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
