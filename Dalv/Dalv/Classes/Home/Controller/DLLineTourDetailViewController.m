//
//  DLLineTourDetailViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineTourDetailViewController.h"
#import "DLLineDetialpriceTableViewCell.h"

static NSString *kDLHomeTableViewCell = @"DLHomeTableViewCell";
static NSString *kDLLineDetialpriceTableViewCell = @"DLLineDetialpriceTableViewCell";
static NSString *kDLHomeTableViewHeader = @"DLHomeTableViewHeader";
@interface DLLineTourDetailViewController ()< UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *performanceView;
@property (nonatomic, weak) UITableView *homeTableView;

@end

@implementation DLLineTourDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
    [self fetchData];

    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setup navbar
- (void)setupNavbar {
    self.title = @"线路详情";
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
    [homeTableView registerClass:[UITableViewCell class]
          forCellReuseIdentifier:kDLLineDetialpriceTableViewCell];
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
    if (section == 0) {
        return 1;
    } else {
        return 4;
    }
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
        
    } else if (indexPath.section == 2) {
//        [cell.contentView addSubview:self.hotTopicViewController.view];
//        [self.hotTopicViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(cell.contentView);
//        }];
        
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100.f;
    } else if (indexPath.section == 1) {
//        return [self.appCenterViewController contentHeight];
    } else if (indexPath.section == 2) {
//        NSLog(@"高度%f",[self.hotTopicViewController contentHeight]);
//        return [self.hotTopicViewController contentHeight];
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

#pragma mark - Fetch data

- (void)fetchData {
    
}


- (UIView *)performanceView {
    if (_performanceView == nil) {
        _performanceView = [[UIView alloc] init];
        _performanceView.backgroundColor = [UIColor randomColor];
        
    }
    return _performanceView;
}


@end
