//
//  DLOrderViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLOrderViewController.h"


@interface DLOrderViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
//分类试图
@property(nonatomic,strong) UIScrollView * headScrollView;
@property(nonatomic,weak) UIButton * lineBtn;


@end

@implementation DLOrderViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
    [self createCategroyView];

}






//分类视图
-(void)createCategroyView {
    
//    UIScrollView *headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 96/2)];
//    headScrollView.contentSize = CGSizeMake(2 * self.view.frame.size.width, 96/2);
//        headScrollView.backgroundColor = [UIColor grayColor];
//    headScrollView.showsVerticalScrollIndicator = NO;
//    self.headScrollView = headScrollView;
//    [self.view addSubview:headScrollView];
//
//    
//    UIScrollView *headScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 48)];
//    headScrollView.backgroundColor = [UIColor grayColor];
//    self.headScrollView = headScrollView;
//    headScrollView.showsVerticalScrollIndicator = NO;
//    headScrollView.showsHorizontalScrollIndicator = NO;
//    headScrollView.contentSize = CGSizeMake(2 *MAIN_SCREEN_WIDTH, 48);
//    [self.view addSubview:headScrollView];
//    
//    UIButton * lineBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 214/2, 96/2)];
//    self.lineBtn = lineBtn;
//    lineBtn.backgroundColor = [UIColor redColor];
//    [lineBtn setTitle:@"线路订单" forState:UIControlStateNormal];
//    [lineBtn setTitle:@"线路订单" forState:UIControlStateSelected];
//    
//    [lineBtn setTitleColor:[UIColor colorWithHexString:@"#9b9b9b"] forState:UIControlStateNormal];
//    
//    [lineBtn setTitleColor:[UIColor colorWithHexString:@"#4d67ee"] forState:UIControlStateSelected];
//    
//    [headScrollView addSubview:lineBtn];
//    
    
    
    
    
    
    
    
    
    
}










- (BOOL)dl_blueNavbar {
    return YES;
    
}


@end
