//
//  DLHomeViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomeViewController.h"
#import "DLMenuViewController.h"
#import "DLRecommendRouteViewController.h"
#import "DLRecommendRouteModel.h"
#import "DLCityMenultem.h"

static NSString *kMSHomeTableViewCell = @"MSHomeTableViewCell";
static NSString *kMSHomeTableViewHeader = @"MSHomeTableViewHeader";
@interface DLHomeViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, weak) UIScrollView *backgroundScrollView;
@property (nonatomic, strong) UIView *performanceView;
@property (nonatomic, weak) UITableView *homeTableView;
/** 热门路线 */
@property (nonatomic, strong) NSMutableArray *activityList;

@property (nonatomic, strong) DLMenuViewController *appCenterViewController;
@property (nonatomic, strong) DLRecommendRouteViewController *hotTopicViewController;


@end

@implementation DLHomeViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
    [self fetchData];
}

#pragma mark - Setup navbar

- (void)setupNavbar {
    self.searchBar  = [[UISearchBar alloc]init];
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.searchBar.placeholder = @"请输入商品名称";
    self.navigationItem.titleView = self.searchBar;
    
    UIBarButtonItem *operateItem = [UIBarButtonItem itemWithImageName:@"icon_search" highImageName:nil target:self action:@selector(didTapOperateAction:)];
    self.navigationItem.leftBarButtonItem = operateItem;
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    UITableView *homeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    homeTableView.backgroundColor = [UIColor clearColor];
    homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    homeTableView.tableFooterView = [[UIView alloc] init];
    [homeTableView registerClass:[UITableViewCell class]
          forCellReuseIdentifier:kMSHomeTableViewCell];
    [homeTableView registerClass:[UITableViewHeaderFooterView class]
forHeaderFooterViewReuseIdentifier:kMSHomeTableViewHeader];
    
    self.homeTableView = homeTableView;
    [self.view addSubview:homeTableView];
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMSHomeTableViewCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    if (indexPath.section == 1) {
        [cell.contentView addSubview:self.appCenterViewController.view];
        [self.appCenterViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
    } else if (indexPath.section == 0) {
        [cell.contentView addSubview:self.performanceView];
        [self.performanceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
    } else if (indexPath.section == 2) {
        [cell.contentView addSubview:self.hotTopicViewController.view];
        [self.hotTopicViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
        
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2 && [self.hotTopicViewController contentHeight] > 0) {
        UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:kMSHomeTableViewHeader];
        
        UIView *flagView = [[UIView alloc] init];
        flagView.backgroundColor = [UIColor colorWithHexString:@"#f74c31"];
        
        UILabel *headerLabel = [[UILabel alloc] init];
        headerLabel.text = @"推荐线路";
        headerLabel.textColor = [UIColor ms_blackColor];
        headerLabel.font = [UIFont systemFontOfSize:14];
        
        [headerView.contentView addSubview:flagView];
        [headerView.contentView addSubview:headerLabel];
        [flagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerView.contentView);
            make.size.mas_equalTo(CGSizeMake(5, 15));
            make.centerY.equalTo(headerView.contentView);
        }];
        [headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(flagView.mas_right).with.offset(5);
            make.height.equalTo(@15);
            make.centerY.equalTo(headerView.contentView);
        }];
        return headerView;
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return [self.appCenterViewController contentHeight];
    } else if (indexPath.section == 0) {
        return self.activityList.count > 0 ? 100.0f : 0.0f;
    } else if (indexPath.section == 2) {
        return [self.hotTopicViewController contentHeight];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 2 ? 40.0f : 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = [searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (searchBar.text.length) {
        [self.searchBar resignFirstResponder];
        NSLog(@"点击搜索");
    } else {//toast
        NSLog(@"请输入搜索内容");
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Fetch data

- (void)fetchData {
    [self.hotTopicViewController beginLoading];

}

#pragma mark - Event Handler

- (void)didTapOperateAction:(UIBarButtonItem *)sender {
    NSLog(@"点击搜索");
    DLCityMenultem *menuView = [[DLCityMenultem alloc] initWithPositionOfDirection:CGPointMake(24, 56)  titleArray:@[@"北京市",@"天津市",@"石家庄",@"唐山市"]];
    menuView.clickedBlock = ^(NSInteger index){
        NSLog(@"++++++第%ld城市",index + 1);
    };
    [self.view addSubview:menuView];
}
- (void)navigationMenuView:(DLCityMenultem *)menuView clickedAtIndex:(NSInteger)index;
{
    NSLog(@"------第%ld城市",index + 1);
}


#pragma mark - Getter

- (NSMutableArray *)activityList {
    if (_activityList == nil) {
        _activityList = [[NSMutableArray alloc] init];
    }
    return _activityList;
}

- (DLMenuViewController *)appCenterViewController {
    if (_appCenterViewController == nil) {
        _appCenterViewController = [[DLMenuViewController alloc] init];
        @weakify(self);
        [_appCenterViewController setDidCompleteLoad:^{
            @strongify(self);
            [self.homeTableView reloadData];
        }];
        [self addChildViewController:_appCenterViewController];
    }
    return _appCenterViewController;
}

- (DLRecommendRouteViewController *)hotTopicViewController {
    if (_hotTopicViewController == nil) {
        _hotTopicViewController = [[DLRecommendRouteViewController alloc] init];
        @weakify(self);
        [_hotTopicViewController setDidCompleteLoad:^{
            @strongify(self);
            [self.homeTableView reloadData];
        }];
        [self addChildViewController:_hotTopicViewController];
    }
    return _hotTopicViewController;
}

- (UIView *)performanceView {
    if (_performanceView == nil) {
        _performanceView = [[UIView alloc] init];
        _performanceView.backgroundColor = [UIColor randomColor];
        
      }
    return _performanceView;
}


@end
