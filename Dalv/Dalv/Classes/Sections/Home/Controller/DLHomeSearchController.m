//
//  DLHomeSearchController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomeSearchController.h"
#import "DLGlobalSearchViewViewController.h"

@interface DLHomeSearchController ()<UISearchBarDelegate>
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UIView *titleView;
@property(nonatomic,strong)UISearchBar *searchBar;
@end

@implementation DLHomeSearchController


-(void)viewWillAppear:(BOOL)animated
{
    self.textField.text = nil;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self setUpUI];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUpUI
{
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:[UIImage imageNamed:@"v2_goback"] forState:UIControlStateNormal];
    
    [button sizeToFit];
    [button addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UITextField *textField = [[UITextField alloc] init];
    
    self.textField  = textField;
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    
    //设置搜索图标
    self.searchBar  = [[UISearchBar alloc]init];
    _searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _searchBar.placeholder = @"请输入搜索的城市";
    _searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    
    
}


-(void)backButtonClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark ----- UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    

   DLGlobalSearchViewViewController *VC = [[DLGlobalSearchViewViewController alloc
                                         ]init];
    VC.names = searchBar.text;
    [self.navigationController pushViewController:VC  animated:YES];
    
    NSLog(@"搜索了%@",searchBar.text);

}

@end
