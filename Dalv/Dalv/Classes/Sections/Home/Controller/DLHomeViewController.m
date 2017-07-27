//
//  DLHomeViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLGlobalSearchViewViewController.h"
#import "DLRecommendRouteViewController.h"
#import "DLNavigationController.h"
#import "DLHomeSearchController.h"
#import "DLLoginViewController.h"
#import "DLRecommendRouteModel.h"
#import "DLHomeViewController.h"
#import "DLMenuViewController.h"
#import "DLHomePageMenuModel.h"
#import "DLCityPopMenuView.h"
#import "PYSearch.h"

static NSString *kDLHomeTableViewCell = @"DLHomeTableViewCell";
static NSString *kDLHomeTableViewHeader = @"DLHomeTableViewHeader";
@interface DLHomeViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource,PYSearchViewControllerDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIImageView *performanceView;
@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) DLCityPopMenuView *popMenuView;
@property (nonatomic, strong) DLMenuViewController *appCenterViewController;
@property (nonatomic, strong) DLRecommendRouteViewController *hotTopicViewController;
@property (nonatomic, strong) DLHomePageMenuModel *homePageModel; //首页模块模型
@property (nonatomic, strong) UIImageView *headImageView;//头像
@property (nonatomic, strong) UILabel *namelab;//名字
@property (nonatomic, strong) UILabel *mobilelab;//手机
@property (nonatomic, strong) NSString * CityStr;
@end

@implementation DLHomeViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
    [self setRecommendController];
    
  
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchData];
}

-(void)setRecommendController {
    
    _hotTopicViewController = [[DLRecommendRouteViewController alloc] init];
    
    _hotTopicViewController.topicList = nil;
    
    @weakify(self);
    [_hotTopicViewController setDidCompleteLoad:^{
        @strongify(self);
        
        [self.homeTableView reloadData];
        
    }];
    
    [self addChildViewController:_hotTopicViewController];
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
    [homeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kDLHomeTableViewCell];
    homeTableView.showsVerticalScrollIndicator = NO;
    [homeTableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:kDLHomeTableViewHeader];
    
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
        return 176.f;
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
    
    DLHomeSearchController *search = [[DLHomeSearchController alloc]init];
    [self.navigationController pushViewController:search animated:YES];
    
    return NO;
    
}


#pragma mark - Fetch data

- (void)fetchData {
    
    
    [self.hotTopicViewController beginLoading];
    
    
    
    
}

- (void)didTapOperateAction:(UIBarButtonItem *)sender {
    
    @weakify(self);
    
    NSArray *cityArray = @[@"北京市",@"天津市",@"石家庄",@"唐山市"];
    self.popMenuView = [[DLCityPopMenuView alloc] initWithPositionOfDirection:CGPointMake(24, 56)  titleArray:cityArray];
    
    self.popMenuView.clickedBlock = ^(NSInteger index){
        
        NSLog(@"选中%@",cityArray[index]);
        @strongify(self);
        
        // self.CityStr = [[NSString alloc] init];
        
        if ([cityArray[index] isEqualToString:@"北京市"]) {
            self.CityStr = @"110000";
            
        }else if ([cityArray[index] isEqualToString:@"天津市"]){
            self.CityStr = @"120000";
        }else if ([cityArray[index] isEqualToString:@"石家庄"]){
            self.CityStr = @"130000";
        }else if ([cityArray[index] isEqualToString:@"唐山市"]){
            self.CityStr = @"140000";
        }
        
        NSDictionary *param = @{
                                @"names": self.CityStr,
                                @"page": @"1"
                                };
        [DLHomeViewTask getDepartureSearc:param completion:^(id result, NSError *error) {
            NSLog(@"%@",result);
            
           // [self.homeTableView reloadData];
            
            
       
            
            
            
            
            
            
            
            
            
            
            
        }];
        
    };
    
    [self.view addSubview:self.popMenuView];
    
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

//- (DLRecommendRouteViewController *)hotTopicViewController {
//
//    if (_hotTopicViewController == nil) {
//        _hotTopicViewController = [[DLRecommendRouteViewController alloc] init];
//
//
//#warning 此处有问题 !!!!! ------------------------------
//         _hotTopicViewController.topicList = nil;
//
//        @weakify(self);
//        [_hotTopicViewController setDidCompleteLoad:^{
//            @strongify(self);
//
//            [self.homeTableView reloadData];
//        }];
//        [self addChildViewController:_hotTopicViewController];
//    }
//    return _hotTopicViewController;
//}

- (UIView *)performanceView {
    
    if (_performanceView == nil) {
        _performanceView = [[UIImageView  alloc] init];
        _performanceView.image = [UIImage imageNamed:@"backImage"];
        
        UIImageView *headImageView = [[UIImageView alloc] init];
        [self.performanceView addSubview:headImageView];
        self.headImageView = headImageView;
        self.headImageView.layer.cornerRadius = 30;
        self.headImageView.clipsToBounds = YES;
        self.headImageView.layer.borderWidth = 0.5;
        self.headImageView.layer.borderColor = [UIColor colorWithHexString:@"#536bf8"].CGColor;
        
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
        
        //头像
        [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.equalTo(@15);
            make.height.equalTo(@60);
            make.width.equalTo(@64);
        }];
        
        [namelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImageView.mas_top).offset(0);
            make.left.equalTo(headImageView.mas_right).offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@150);
        }];
        
        [mobilelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_namelab.mas_bottom);
            make.left.equalTo(headImageView.mas_right).offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@150);
        }];
    }
    
    return _performanceView;
}

- (void)refreshPerformanceView {
    
    if([[DLUtils getUser_type]  isEqualToString: @"4"]){
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.homePageModel.agencyInfo.head_pic] placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
        self.namelab.text = self.homePageModel.agencyInfo.name;
        self.mobilelab.text  = self.homePageModel.agencyInfo.mobile;
        
    } else {
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.homePageModel.touristInfo.head_img] placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
        self.namelab.text = self.homePageModel.touristInfo.name;
        self.mobilelab.text  = self.homePageModel.touristInfo.mobile;
    }
}

@end
