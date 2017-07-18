//
//  DLPlaneTicketListViewController.m
//  Dalv
//
//  Created by Nie on 2017/7/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------- 机票查询列表 -------------------

#import "DLPlaneTicketListViewController.h"
#import "DLplaneDetaliViewController.h"
#import "DLPlaneTicketsListCell.h"
#import "DLPlaneListDetailModel.h"

@interface DLPlaneTicketListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *planeTicketListTableView;
@property (nonatomic,strong) NSMutableArray * planeListDataArr;
/// 出发时间
@property (weak, nonatomic)  UILabel *startTimeLabel;
/// 出发机场
@property (weak, nonatomic)  UILabel *startPlaceLabel;
/// 到达时间
@property (weak, nonatomic)  UILabel *arriveTimeLabel;
/// 到达机场
@property (weak, nonatomic)  UILabel *arrivePlaceLabel;
/// 航空公司
@property (weak, nonatomic)  UILabel *airlinesLabel;
/// 航班号
@property (weak, nonatomic)  UILabel *flightNo;
/// 机型
@property (weak, nonatomic)  UILabel *planeType;
/// 详情Btn
@property (weak, nonatomic)  UIButton *detailBtn;

@end

static NSString *nibCellID = @"nibCellID";
@implementation DLPlaneTicketListViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.planeListDataArr = [NSMutableArray array];
    [self fetchData];
    
}

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    [super viewDidLoad];
    [self setupNavbar];
    [self cofigureheadView];
    //[self fetchData];
   // [self setupSubviews];
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
    
    NSDictionary *param = @{
                            @"departure": @"哈尔滨",
                            @"destination": @"合肥",
                            @"timestart" : @"2017-08-20",
                            };
    @weakify(self);
    [DLHomeViewTask geAgencyFlightQueryList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            
            
            
            NSLog(@"%@",result);
            
            NSArray *planeListArray = [DLPlaneListDetailModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"flightinfo"]];
            
            [self.planeListDataArr addObjectsFromArray:planeListArray];
            [self setupSubviews];
            //[self.planeTicketListTableView reloadData];
        }
    }];
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
    
}



- (void)setupSubviews {
    
    self.planeTicketListTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.planeTicketListTableView.dataSource = self;
    self.planeTicketListTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
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

#pragma mark -------- BtnClick

-(void)beforfetchData {
    
    
    
    
}

-(void)afterfetchData {
    
    
    
    
}


/// 详情
-(void)detailBtnClick {
    
    NSLog(@"点击了机票的详情");
    DLplaneDetaliViewController *deVC = [[DLplaneDetaliViewController alloc] init];
    [self.navigationController pushViewController:deVC animated:YES];
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
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.startPlaceLabel = cell.startPlaceLabel;
    self.arriveTimeLabel = cell.arriveTimeLabel;
    
    /*
    NSMutableString *str = [[NSMutableString alloc] init];
    [str setString:cell.startTimeLabel.text];
    [str insertString:@":" atIndex:2];
    
    self.startTimeLabel.text = str;
    
    NSMutableString *str1 = [[NSMutableString alloc] init];
    [str1 setString:cell.arriveTimeLabel.text];
    [str1 insertString:@":" atIndex:2];
    
    self.arriveTimeLabel.text = str1;
     
    */

    
    self.startTimeLabel = cell.startTimeLabel;
    self.arrivePlaceLabel = cell.arrivePlaceLabel;
    self.airlinesLabel = cell.airlinesLabel;
    self.flightNo = cell.flightNo;
    self.planeType = cell.planeType;
    self.detailBtn = cell.detailBtn;
    
    [cell.detailBtn addTarget:self action:@selector(detailBtnClick) forControlEvents:UIControlEventTouchUpInside];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLPlaneListDetailModel *pdModel = [self.planeListDataArr objectAtIndex:indexPath.section];
    [cell configureCell:pdModel];
    
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
