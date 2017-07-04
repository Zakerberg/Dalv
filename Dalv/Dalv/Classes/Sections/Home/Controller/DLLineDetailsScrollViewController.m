//
//  DLLineDetailsScrollViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/22.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineDetailsScrollViewController.h"
#import "DLLineDetailsScrollViewTableViewCell.h"
#import "DLHomeViewTask.h"
@interface DLLineDetailsScrollViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) NSMutableArray *lineDetArray;

@end

@implementation DLLineDetailsScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self fetchData];}

#pragma mark - Setup navbar
- (BOOL)dl_blueNavbar {
    return YES;
    
}
- (void)setupNavbar {
    self.title = @"目的地图册";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    
    
    self.homeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.homeTableView.dataSource = self;
    self.homeTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.homeTableView.delegate = self;
    [self.homeTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.homeTableView.showsVerticalScrollIndicator = NO;
    [self.homeTableView registerClass:[DLLineDetailsScrollViewTableViewCell class] forCellReuseIdentifier:[DLLineDetailsScrollViewTableViewCell cellIdentifier]];
    [self.view addSubview:self.homeTableView];
    
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}

# pragma mark - Layout
- (void)setupConstraints {
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lineDetArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DLLineDetailsScrollViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineDetailsScrollViewTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLDestinationAtlasModel *destModel = [self.lineDetArray objectAtIndex:indexPath.row];
    [cell configureCell:destModel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DLDestinationAtlasModel *destModel = [self.lineDetArray objectAtIndex:indexPath.row];
    
    CGFloat titleHeight = [destModel.name autolableHeightWithFont:[UIFont systemFontOfSize:16] Width:(self.view.width - 30)];
    return titleHeight + 210;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Fetch data

- (void)fetchData {
    NSDictionary *param = @{@"id" : self.routeModel.routeId,};
    @weakify(self);
    [DLHomeViewTask getAgencyMorePics:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            NSArray *destArray = [DLDestinationAtlasModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"picArr"]];
            [self.lineDetArray addObjectsFromArray:destArray];
            [self.homeTableView reloadData];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
        
    }];
    
}

#pragma mark - Event Handler

#pragma mark - Getter

- (NSMutableArray *)lineDetArray {
    if (_lineDetArray == nil) {
        _lineDetArray = [[NSMutableArray alloc] init];
    }
    return _lineDetArray;
}


@end
