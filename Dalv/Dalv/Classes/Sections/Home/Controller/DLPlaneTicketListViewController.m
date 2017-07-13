//
//  DLPlaneTicketListViewController.m
//  Dalv
//
//  Created by Nie on 2017/7/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------- 机票查询列表 -------------------

#import "DLPlaneTicketListViewController.h"
#import "DLPlaneTicketsListCell.h"

@interface DLPlaneTicketListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *planeTicketListTableView;
@property(nonatomic,strong) NSMutableArray * planeListDataArr;
@end

static NSString *nibCellID = @"nibCellID";
@implementation DLPlaneTicketListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self cofigureheadView];
    [self fetchData];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)setupNavbar {
    
#warning 此处不能写死,后期根据返回的数据设定
    
    self.title = @"机票列表";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

#pragma mark ------- fetchData

-(void)fetchData {
    
    
    
}

#pragma mark ------- cofigureheadView

- (void)cofigureheadView{
    
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor ms_separatorColor];
    [self.view addSubview:headView];
    
    UIButton *beforDayBtn = [[UIButton alloc]init];
    [beforDayBtn setTitle:@"前一天" forState:(UIControlStateNormal)];
    [beforDayBtn addTarget:self action:@selector(beforfetchData) forControlEvents:UIControlEventTouchUpInside];
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
    [afterDayBtn addTarget:self action:@selector(afterfetchData) forControlEvents:UIControlEventTouchUpInside];
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



#pragma mark ------- setupSubviews

- (void)setupSubviews {
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.planeTicketListTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.planeTicketListTableView.dataSource = self;
    self.planeTicketListTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.planeTicketListTableView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.planeTicketListTableView.showsVerticalScrollIndicator = NO;
    
    [self.planeTicketListTableView registerNib:[UINib nibWithNibName:@"DLPlaneTicketsListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
    
    [self.view addSubview:self.planeTicketListTableView];
    
    [self.planeTicketListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(@40);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}

#pragma mark ------- UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.planeListDataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    DLPlaneTicketsListCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];

    
    
    
    

    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    return 136;
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
