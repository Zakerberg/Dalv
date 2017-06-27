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
#import "DLCityPopMenuView.h"
#import "DLLoginViewController.h"
#import "DLHomeViewTask.h"
#import "DLNavigationController.h"
#import "DLGlobalSearchViewViewController.h"
#import "DLHomePageMenuModel.h"
#import "PYSearch.h"

static NSString *kDLHomeTableViewCell = @"DLHomeTableViewCell";
static NSString *kDLHomeTableViewHeader = @"DLHomeTableViewHeader";
@interface DLHomeViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource,PYSearchViewControllerDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIImageView *performanceView;
@property (nonatomic, weak) UITableView *homeTableView;
@property (nonatomic, strong) DLCityPopMenuView *popMenuView;

@property (nonatomic, strong) DLMenuViewController *appCenterViewController;
@property (nonatomic, strong) DLRecommendRouteViewController *hotTopicViewController;
@property (nonatomic, strong) DLHomePageMenuModel *homePageModel; //首页模块模型
@property (nonatomic, strong) UIImageView *headImageView;//头像
@property (nonatomic, strong) UILabel *namelab;//名字
@property (nonatomic, strong) UILabel *mobilelab;//手机
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent = NO;
//    [self.navigationController setNavigationBarHidden:YES animated:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark - Setup navbar


- (void)setupNavbar {
 
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.ms_width, 44)];
    self.searchBar.placeholder = @"请输入商品名称";
    self.searchBar.delegate = self;
    self.searchBar.tintColor = [UIColor ms_orangeColor];
    
    self.searchBar.backgroundColor = [UIColor whiteColor];
    [self.searchBar setBackgroundImage: [UIImage imageWithColor:[UIColor whiteColor] ] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    for (UIView *view in self.searchBar.subviews.firstObject.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            view.backgroundColor = [UIColor ms_backgroundColor];
        }
    }
    self.navigationItem.titleView = self.searchBar;
    
    UIBarButtonItem *operateItem = [UIBarButtonItem itemWithImageName:@"line_order" highImageName:nil target:self action:@selector(didTapOperateAction:)];
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
          forCellReuseIdentifier:kDLHomeTableViewCell];
    homeTableView.showsVerticalScrollIndicator = NO;
    [homeTableView registerClass:[UITableViewHeaderFooterView class]
forHeaderFooterViewReuseIdentifier:kDLHomeTableViewHeader];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDLHomeTableViewCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    if (indexPath.section == 0) {
        [cell.contentView addSubview:self.performanceView];
        [self.performanceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
    } else if (indexPath.section == 1) {
        [cell.contentView addSubview:self.appCenterViewController.view];
        [self.appCenterViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
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
        UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:kDLHomeTableViewHeader];
        
        UIView *flagView = [[UIView alloc] init];
        [headerView.contentView addSubview:flagView];

        UIView *leftline = [[UIView alloc]init];
        leftline.backgroundColor = [UIColor colorWithHexString:@"#4a525d"];
        [flagView  addSubview:leftline];
        
        UILabel *headerLabel = [[UILabel alloc] init];
        headerLabel.text = @"精选路线";
        headerLabel.textColor = [UIColor colorWithHexString:@"#4b4b4b"];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.font = [UIFont systemFontOfSize:14];
        [flagView addSubview:headerLabel];
        
        UIView *rightline = [[UIView alloc]init];
        rightline.backgroundColor = [UIColor colorWithHexString:@"#4a525d"];
        [flagView  addSubview:rightline];
        
        [flagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@100);
            make.right.equalTo(@-100);
            make.height.equalTo(@25);
            make.centerY.equalTo(headerView.contentView);
        }];
        
        [leftline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(headerLabel.mas_left).with.offset(5);
            make.height.equalTo(@1);
            make.width.equalTo(@35);
            make.centerY.equalTo(headerView.contentView);
        }];
        
        [headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.right.equalTo(@-20);
            make.height.equalTo(@15);
            make.centerY.equalTo(headerView.contentView);
        }];
        
        [rightline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerLabel.mas_right).with.offset(-5);
            make.height.equalTo(@1);
            make.width.equalTo(@35);
            make.centerY.equalTo(headerView.contentView);
        }];
        return headerView;
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100.f;
    } else if (indexPath.section == 1) {
        return [self.appCenterViewController contentHeight];
    } else if (indexPath.section == 2) {
        NSLog(@"高度%f",[self.hotTopicViewController contentHeight]);
        return [self.hotTopicViewController contentHeight];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGFLOAT_MIN;
    }
    return section == 2 ? 40.0f : 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - UISearchBarDelegate


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
//    DLGlobalSearchViewViewController *globalSearchViewController = [[DLGlobalSearchViewViewController alloc] init];
//    DLNavigationController *navbar = [[DLNavigationController alloc] initWithRootViewController:globalSearchViewController];
//    [self presentViewController:navbar animated:NO completion:nil];
//    return NO;
    
    // 1. 创建热门搜索数组
    NSArray *hotSeaches = @[@"北京", @"天津", @"石家庄", @"唐山"];
    // 2. 创建搜索控制器
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"搜索出发城市和目的地" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
    
        // 开始(点击)搜索时执行以下代码
        // 如：跳转到指定控制器
        [searchViewController.navigationController pushViewController:[[DLGlobalSearchViewViewController alloc] init] animated:YES];
    }];
    // 3. 跳转到搜索控制器
    
    DLNavigationController *nav = [[DLNavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav  animated:NO completion:nil];
    
    // 设置搜索历史为带边框标签风格
    searchViewController.searchHistoryStyle = PYSearchHistoryStyleColorfulTag;
    
    // 设置热门搜索为彩色标签风格
    searchViewController.hotSearchStyle = PYHotSearchStyleColorfulTag;
    
    // 隐藏搜索建议
    searchViewController.searchSuggestionHidden = YES;

        return NO;

}

//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
//    searchBar.text = [searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@""];
//    if (searchBar.text.length) {
//        [self.searchBar resignFirstResponder];
//        NSLog(@"点击搜索");
//    } else {//toast
//        NSLog(@"请输入搜索内容");
//    }
//}
//
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
//    [self.searchBar resignFirstResponder];
//    [self.navigationController popViewControllerAnimated:YES];
//}
//

#pragma mark - Fetch data

- (void)fetchData {
    [self.hotTopicViewController beginLoading];
//        NSDictionary *param = @{@"login_name" : @"13126997215",
//                                @"login_pwd" : @"654321",};
//        [DLHomeViewTask getHomeIndexMod:nil completion:^(id result, NSError *error) {
//            }];

}

#pragma mark - Event Handler

- (void)didTapOperateAction:(UIBarButtonItem *)sender {
    if (!self.popMenuView) {
        NSArray *cityArray = @[@"北京市",@"天津市",@"石家庄",@"唐山市"];
        self.popMenuView = [[DLCityPopMenuView alloc] initWithPositionOfDirection:CGPointMake(24, 56)  titleArray:cityArray];
        self.popMenuView.clickedBlock = ^(NSInteger index){
            NSLog(@"选中了++++++ %@",cityArray[index]);
        };
        [self.view addSubview:self.popMenuView];
     } else {
        self.popMenuView.isShow ? [self.popMenuView hiddenPopMenu] : [self.popMenuView showPopMenu];
     }
    
}

#pragma mark - Getter

- (DLMenuViewController *)appCenterViewController {
    if (_appCenterViewController == nil) {
        _appCenterViewController = [[DLMenuViewController alloc] init];
        @weakify(self);
        [_appCenterViewController setDidCompleteLoad:^(DLHomePageMenuModel *homePageMenuModel){
            @strongify(self);
            self.homePageModel = homePageMenuModel;
            [self refreshPerformanceView];
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
        _performanceView = [[UIImageView  alloc] init];
        _performanceView.image = [UIImage imageNamed:@"backImage"];
        
        UIImageView *headImageView = [[UIImageView alloc] init];
        [self.performanceView addSubview:headImageView];
        self.headImageView = headImageView;
        
        UILabel  *namelab = [[UILabel alloc]init];
        namelab.textColor = [UIColor whiteColor];
        namelab.textAlignment = NSTextAlignmentLeft;
        namelab.font = [UIFont systemFontOfSize:16];
        [self.performanceView addSubview:namelab];
        self.namelab = namelab;
        
        UILabel  *mobilelab = [[UILabel alloc]init];
        mobilelab.textColor = [UIColor whiteColor];
        mobilelab.textAlignment = NSTextAlignmentLeft;
        mobilelab.font = [UIFont systemFontOfSize:16];
        [self.performanceView addSubview:mobilelab];
        self.mobilelab = mobilelab;
      
        [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@20);
            make.left.equalTo(@15);
            make.height.equalTo(@60);
            make.width.equalTo(@60);

        }];
        
        [namelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@20);
            make.left.equalTo(headImageView.mas_right).offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@100);
            
        }];
        
        [mobilelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_namelab.mas_bottom);
            make.left.equalTo(headImageView.mas_right).offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@100);
            
        }];

      }
    return _performanceView;
}

- (void)refreshPerformanceView {
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.homePageModel.agencyInfo.head_pic] placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
    self.namelab.text = self.homePageModel.agencyInfo.name;
    self.mobilelab.text  = self.homePageModel.agencyInfo.mobile;
    
}
@end
