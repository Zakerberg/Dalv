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
@property(nonatomic,strong)NSArray *viewControllers;
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UISearchBar *searchBar;

@end

@implementation DLHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIView *homeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    
    homeView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:homeView];
    
    
    [self setNavgationBar];
    
}


-(void)setNavgationBar
{
    
    
    //设置右边搜索按钮
    self.viewControllers =  self.tabBarController.childViewControllers;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchButtonClick)];
    
    [self setupUI];
    
    
}
-(void)searchButtonClick
{
    
    

}

-(void)viewWillAppear:(BOOL)animated
{
    
    self.textField.text = nil;
}


-(void)setupUI{
    
    UITextField *textField = [[UITextField alloc] init];
    
    self.textField  = textField;
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    
    //设置搜索图标
    self.searchBar  = [[UISearchBar alloc]init];
    
    _searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    _searchBar.placeholder = @"请输入商品名称";
    
    self.navigationItem.titleView = self.searchBar;
    
    
}



@end
