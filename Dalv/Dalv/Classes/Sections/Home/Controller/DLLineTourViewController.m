//
//  DLLineTourViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/12.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineTourViewController.h"
#import "DLMenuViewController.h"
#import "DLRecommendRouteViewController.h"
#import "DLRecommendRouteModel.h"

static NSString *kDLHomeTableViewCell = @"DLHomeTableViewCell";
static NSString *kDLHomeTableViewHeader = @"DLHomeTableViewHeader";

@interface DLLineTourViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView *homeTableView;
@property (nonatomic, strong) UIView *performanceView;
@property (nonatomic, weak) UIScrollView *backgroundScrollView;

@property (nonatomic, strong) DLRecommendRouteViewController *hotTopicViewController;

@end

@implementation DLLineTourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
    [self fetchData];
}

#pragma mark - Setup navbar
- (void)setupNavbar {
    self.title = @"大旅游";
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDLHomeTableViewCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor redColor];
    
    if (indexPath.section == 0) {
        [cell.contentView addSubview:self.performanceView];
        [self.performanceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
    } else if (indexPath.section == 1) {
        [cell.contentView addSubview:self.hotTopicViewController.view];
        [self.hotTopicViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
        
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1 && [self.hotTopicViewController contentHeight] > 0) {
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
        NSLog(@"高度%f",[self.hotTopicViewController contentHeight]);
        return [self.hotTopicViewController contentHeight];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGFLOAT_MIN;
    }
    return section == 1 ? 40.0f : 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - UISearchBarDelegate

//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
//    searchBar.text = [searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@""];
//    if (searchBar.text.length) {
//        [self.searchBar resignFirstResponder];
//        NSLog(@"点击搜索");
//    } else {//toast
//        NSLog(@"请输入搜索内容");
//    }
//}

//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
//    [self.searchBar resignFirstResponder];
//    [self.navigationController popViewControllerAnimated:YES];
//}


#pragma mark - Fetch data

- (void)fetchData {
    [self.hotTopicViewController beginLoading];

}


#pragma mark - Getter

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
