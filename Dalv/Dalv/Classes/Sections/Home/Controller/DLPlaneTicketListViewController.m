//
//  DLPlaneTicketListViewController.m
//  Dalv
//
//  Created by Nie on 2017/7/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLPlaneTicketListViewController.h"
#import "DLPlaneTicketListTableViewCell.h"
@interface DLPlaneTicketListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *planeTicketListTableView;//

@end

@implementation DLPlaneTicketListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self cofigureheadView];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setup navbar
- (BOOL)dl_blueNavbar {
    return YES;
}
- (void)setupNavbar {
    self.title = @"机票列表";
}
#pragma mark - Setup subViews

- (void)cofigureheadView{
    
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor ms_separatorColor];
    [self.view addSubview:headView];
    
    // 前一天后一天按钮
    
    UIButton *beforDayBtn = [[UIButton alloc]init];
    [beforDayBtn setTitle:@"前一天" forState:(UIControlStateNormal)];
    //    [beforDayBtn addTarget:self action:@selector(beforfetchData) forControlEvents:UIControlEventTouchUpInside];
    beforDayBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
    [headView addSubview:beforDayBtn];
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.text = @"2017-07-08";
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.textColor = [UIColor colorWithHexString:@"#b0b0b0"];
    dateLabel.backgroundColor = [UIColor whiteColor];
    dateLabel.font = [UIFont systemFontOfSize:14];
    [headView addSubview:dateLabel];
    
    UIButton *afterDayBtn = [[UIButton alloc]init];
    //    [afterDayBtn addTarget:self action:@selector(afterfetchData) forControlEvents:UIControlEventTouchUpInside];
    afterDayBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
    [afterDayBtn setTitle:@"后一天" forState:(UIControlStateNormal)];
    [headView addSubview:afterDayBtn];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    
    [beforDayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView);
        make.bottom.equalTo(headView);
        make.height.equalTo(@40);
        make.width.equalTo(headView).multipliedBy(0.25);
    }];
    
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(beforDayBtn.mas_right);
        make.bottom.equalTo(headView);
        make.height.equalTo(@40);
        make.width.equalTo(headView).multipliedBy(0.5);
    }];
    
    [afterDayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dateLabel.mas_right);
        make.bottom.equalTo(headView);
        make.height.equalTo(@40);
        make.width.equalTo(headView).multipliedBy(0.25);
    }];
    
    [self setupSubviews];
}



- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.planeTicketListTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.planeTicketListTableView.dataSource = self;
    self.planeTicketListTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.planeTicketListTableView.delegate = self;
    [self.planeTicketListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.planeTicketListTableView.showsVerticalScrollIndicator = NO;
    [self.planeTicketListTableView registerClass:[DLPlaneTicketListTableViewCell class] forCellReuseIdentifier:[DLPlaneTicketListTableViewCell cellIdentifier]];
    [self.view addSubview:self.planeTicketListTableView];
    
    [self.planeTicketListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(@40);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.planeTicketListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DLPlaneTicketListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLPlaneTicketListTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
