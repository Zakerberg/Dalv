//
//  DLHomeViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomeViewController.h"
#import <MJRefresh/MJRefresh.h>


@interface DLHomeViewController ()
//@property (nonatomic) CGPoint contentOfset;//这个属性用来表示滚动的位置，内容左上角与scroview左上角的间距值(x,y)
//
//@property (nonatomic) CGSize contenSize;//滚动范围，能滚多远
//
//@property(nonatomic) UIEdgeInsets contentInsize;//四周增加额外的滚动区域。
//
//
//@property(nonatomic,strong)UIScrollView *scrollView;
//

@end

@implementation DLHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIView *homeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    
    homeView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:homeView];
    
    
    
    
}






@end
