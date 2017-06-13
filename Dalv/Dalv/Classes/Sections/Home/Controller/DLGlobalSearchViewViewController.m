//
//  DLGlobalSearchViewViewController.m
//  Dalv
//
//  Created by Nie on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLGlobalSearchViewViewController.h"

@interface DLGlobalSearchViewViewController ()<UISearchBarDelegate>
@property (nonatomic, weak) UISearchBar *searchBar;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation DLGlobalSearchViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];

}

#pragma mark - Setup navbar

- (void)setupNavbar {
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    NSMutableString *placeholder = [NSMutableString stringWithString:@"搜索出发城市和目的地"];
    
    searchBar.placeholder = placeholder.copy;
    searchBar.backgroundImage = [[UIImage alloc] init];
    searchBar.delegate = self;
    searchBar.barTintColor = [UIColor ms_blackColor];
    searchBar.tintColor = [UIColor ms_orangeColor];
    searchBar.showsCancelButton = NO;
    self.searchBar = searchBar;
    
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    searchField.layer.cornerRadius = 14.0f;
    searchField.layer.masksToBounds = YES;
    searchField.layer.borderColor = [UIColor colorWithHexString:@"#e8e8e8"].CGColor;
    searchField.layer.borderWidth = 0.5f;
    searchField.textColor = [UIColor ms_blackColor];
    self.navigationItem.titleView = searchBar;
    self.navigationItem.leftBarButtonItem = nil;
    
    
    UIBarButtonItem *registerbutton= [UIBarButtonItem itemWithTitle:@"取消" target:self action:@selector(didTapCancel:)];
    self.navigationItem.rightBarButtonItem = registerbutton;

}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    UIView *backview = [[UIView alloc]init];
    backview.backgroundColor = [UIColor whiteColor];
    [self.view  addSubview:backview];

    
    UILabel *hotCityLabel = [[UILabel alloc] init];
    hotCityLabel.text = @"热门城市";
    hotCityLabel.textAlignment = NSTextAlignmentLeft;
    hotCityLabel.textColor = [UIColor blackColor];
    hotCityLabel.font = [UIFont systemFontOfSize:14];
    [backview addSubview:hotCityLabel];
    
    UIButton *cityBtn = [[UIButton alloc]init];
//    [cityBtn addTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
    cityBtn.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
    [cityBtn  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cityBtn setTitle:@"北京" forState:(UIControlStateNormal)];
    [backview addSubview:cityBtn];

    UIButton *cityBtn1 = [[UIButton alloc]init];
    //    [cityBtn addTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
    cityBtn1.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
    [cityBtn1  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cityBtn1 setTitle:@"天津" forState:(UIControlStateNormal)];
    [backview addSubview:cityBtn1];

    UIButton *cityBtn2 = [[UIButton alloc]init];
    //    [cityBtn addTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
    cityBtn2.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
    [cityBtn2  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cityBtn2 setTitle:@"唐山" forState:(UIControlStateNormal)];
    [backview addSubview:cityBtn2];

    UIButton *cityBtn3 = [[UIButton alloc]init];
    //    [cityBtn addTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
    cityBtn3.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
    [cityBtn3  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cityBtn3 setTitle:@"石家庄" forState:(UIControlStateNormal)];
    [backview addSubview:cityBtn3];


    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(self.view);
        make.height.equalTo(@100);
    }];

    [hotCityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@15);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
    }];

    [cityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hotCityLabel.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    
    [cityBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hotCityLabel.mas_bottom);
        make.left.equalTo(cityBtn.mas_right).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];

    [cityBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hotCityLabel.mas_bottom);
        make.left.equalTo(cityBtn1.mas_right).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [cityBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hotCityLabel.mas_bottom);
        make.left.equalTo(cityBtn2.mas_right).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];


}

#pragma mark - Layout

- (void)setupConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Event Handler

- (void)didTapCancel:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
}


@end
