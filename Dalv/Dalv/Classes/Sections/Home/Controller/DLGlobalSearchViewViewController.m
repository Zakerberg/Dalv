//
//  DLGlobalSearchViewViewController.m
//  Dalv
//
//  Created by Nie on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLGlobalSearchViewViewController.h"
#import "DLRecommendRouteViewController.h"

static NSString *kDLGlobalSearchTableViewCell = @"kDLGlobalSearchTableViewCell";
@interface DLGlobalSearchViewViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *globalSearchTableView;
@property (nonatomic, strong) DLRecommendRouteViewController *hotTopicViewController;
@end

@implementation DLGlobalSearchViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
    [self fetchData];
}

#pragma mark - Setup navbar

- (void)setupNavbar {
    
    self.title = @"目的地";
}
- (BOOL)dl_blueNavbar {
    
    return YES;
}

- (void)fetchData {
    
    [self.hotTopicViewController beginLoading];
    
    NSDictionary *param = @{
                            @"names" :self.names,
                            @"page" : @"1"
                            };
    
    
    

    
    [DLHomeViewTask getLineSearch:param completion:^(id result, NSError *error) {
        
        
        
            }];
    
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
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
    
    [self.globalSearchTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.globalSearchTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
