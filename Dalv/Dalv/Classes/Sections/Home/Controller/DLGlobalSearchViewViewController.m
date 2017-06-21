//
//  DLGlobalSearchViewViewController.m
//  Dalv
//
//  Created by Nie on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLGlobalSearchViewViewController.h"
#import "DLRecommendRouteViewController.h"

static NSString *kDLGlobalSearchTableViewCell = @"kDLGlobalSearchTableViewCell";
@interface DLGlobalSearchViewViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UISearchBar *searchBar;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) UITableView *globalSearchTableView;
@property (nonatomic, strong) DLRecommendRouteViewController *hotTopicViewController;


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
    
    self.globalSearchTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.globalSearchTableView.delegate = self;
    self.globalSearchTableView.dataSource = self;
    self.globalSearchTableView.backgroundColor = [UIColor clearColor];
    self.globalSearchTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.globalSearchTableView.tableFooterView = [[UIView alloc] init];
    [self.globalSearchTableView registerClass:[UITableViewCell class]
          forCellReuseIdentifier:kDLGlobalSearchTableViewCell];
    self.globalSearchTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.globalSearchTableView];

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
    
    [self.globalSearchTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(backview.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];

}

#pragma mark - Layout

- (void)setupConstraints {
    [self.globalSearchTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        make.top.equalTo(@100);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDLGlobalSearchTableViewCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    [cell.contentView addSubview:self.hotTopicViewController.view];
    [self.hotTopicViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
    }];
     return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.hotTopicViewController contentHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (DLRecommendRouteViewController *)hotTopicViewController {
    if (_hotTopicViewController == nil) {
        _hotTopicViewController = [[DLRecommendRouteViewController alloc] init];
        @weakify(self);
        [_hotTopicViewController setDidCompleteLoad:^{
            @strongify(self);
            [self.globalSearchTableView reloadData];
        }];
        [self addChildViewController:_hotTopicViewController];
    }
    return _hotTopicViewController;
}


#pragma mark - Event Handler

- (void)didTapCancel:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
}


@end
