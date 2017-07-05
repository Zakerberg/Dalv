//
//  DLAdvertisingController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLAdvertisingController.h"
#import "DLIdentitySelectionLoginViewController.h"
#import "DLTabBarController.h"

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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    
    [self.view addSubview:scrollView];
    NSArray *imageNames = @[@"引导图1", @"引导图2",@"引导图3",@"引导图4",];
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
    
    btn.layer.cornerRadius = 20.0;
    [btn.layer setBorderWidth:1.0];
    btn.layer.borderColor=[UIColor colorWithHexString:@"#536bf8"].CGColor;

    //因为是滚动视图最后一页，所以要添加到滚动视图中
    [scrollView addSubview:btn];
    
    btn.frame = CGRectMake(0, 0, 150, 44);
    btn.center = CGPointMake((imageNames.count - 0.5) * scrollView.frame.size.width , scrollView.frame.size.height - 100);
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click{

//    DLIdentitySelectionLoginViewController *idenVC = [[DLIdentitySelectionLoginViewController alloc]init];
//    [self presentViewController:idenVC animated:YES completion:nil];
//    [self.navigationController pushViewController:idenVC animated:YES];
    
    if ([NSString isNotBlank:[DLUtils getUid]]) {
        [self setupTabbarVC];
    } else {
        [self setupLoginVC];

    }
    
    /*
     - (void)setupMainVC {
     if ([NSString isNotBlank:[DLUtils getUid]]) {
     [self setupTabbarVC];
     } else {
     [self setupLoginVC];
     }
     }
     // 已登录 跳到主界面
     - (void)setupTabbarVC {
     DLTabBarController *tabBarController = [[DLTabBarController alloc] init];
     self.window.rootViewController = tabBarController;
     }
     // 未登录跳到登录界面
     - (void)setupLoginVC {
     DLIdentitySelectionLoginViewController *loginVC = [[DLIdentitySelectionLoginViewController alloc] init];
     DLNavigationController *nav = [[DLNavigationController alloc] initWithRootViewController:loginVC];
     self.window.rootViewController = nav;
     }
     */
    
}

    // 已登录 跳到主界面
- (void)setupTabbarVC {
        DLTabBarController *tabBarController = [[DLTabBarController alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = tabBarController;
    }
    // 未登录跳到登录界面
- (void)setupLoginVC {
    
        DLIdentitySelectionLoginViewController *loginVC = [[DLIdentitySelectionLoginViewController alloc] init];
        DLNavigationController *nav = [[DLNavigationController alloc] initWithRootViewController:loginVC];
        [UIApplication sharedApplication].keyWindow.rootViewController = nav;
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
