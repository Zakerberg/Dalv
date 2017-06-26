//
//  DLAdvertisingController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLAdvertisingController.h"
#import "DLIdentitySelectionLoginViewController.h"

@interface DLAdvertisingController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *adImageView;

@end

@implementation DLAdvertisingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)setUI{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    NSArray *imageNames = @[@"WechatIMG149", @"WechatIMG150",@"WechatIMG151",@"WechatIMG152",];
    for (int i = 0; i < imageNames.count; i ++) {
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNames[i]]];
        iv.frame = CGRectMake(i * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        [scrollView addSubview:iv];
    }
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * imageNames.count, 0);
    
    scrollView.pagingEnabled = YES;
    
/*
   添加页数控制视图 new = alloc + init
     UIPageControl *pageControl = [UIPageControl new
                                   ];
 不要加到滚动视图中， 会随着滚动消失掉
     [self.view addSubview:pageControl];
     设置常用属性,距离屏幕下方60像素。
     pageControl.frame = CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 30);
     设置圆点的个数
     pageControl.numberOfPages = imageNames.count;
     设置没有被选中时圆点的颜色
     pageControl.pageIndicatorTintColor = [UIColor blackColor];
         设置选中时圆点的颜色
     pageControl.currentPageIndicatorTintColor = [UIColor redColor];
     关闭分页控件的用户交互功能
     pageControl.userInteractionEnabled = NO;
 */

    scrollView.delegate = self;
    
//    pageControl.tag = 1000;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"点击进入" forState:UIControlStateNormal];
    //因为是滚动视图最后一页，所以要添加到滚动视图中
    [scrollView addSubview:btn];
    
    btn.frame = CGRectMake(0, 0, 100, 44);
    btn.center = CGPointMake((imageNames.count - 0.5) * scrollView.frame.size.width - 100, scrollView.frame.size.height - 100);
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click{

    DLIdentitySelectionLoginViewController *idenVC = [[DLIdentitySelectionLoginViewController alloc]init];
    [self presentViewController:idenVC animated:YES completion:nil];
    
}

#pragma mark - - UIScrollViewDelegate --


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:1000];
    //取得偏移量
    CGPoint point = scrollView.contentOffset;
    //根据滚动的位置来决定当前是第几页
    //可以用 round()  C语言方法进行 四舍五入操作
    NSInteger index = round(point.x/scrollView.frame.size.width);

    pageControl.currentPage = index;
}

@end
