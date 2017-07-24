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

/// #define KHEIGHT 60
#define KHEIGHT 10

@interface DLPlaneTicketListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *planeTicketListTableView;

/// 出发时间
@property (weak, nonatomic)  UILabel *startTimeLabel;
/// 出发机场
@property (weak, nonatomic)  UILabel *startPlaceLabel;
/// 到达时间
@property (weak, nonatomic)  UILabel *arriveTimeLabel;
/// 到达机场
@property (weak, nonatomic)  UILabel *arrivePlaceLabel;
/// 出发航站楼
@property (weak, nonatomic)  UILabel *startOrgjetquery;
/// 到达航站楼
@property (weak, nonatomic)  UILabel *dstJetqury;
/// 航空公司
@property (weak, nonatomic)  UILabel *airlinesLabel;
/// 航班号
@property (weak, nonatomic)  UILabel *flightNo;
/// 机型
@property (weak, nonatomic)  UILabel *planeType;
/// 详情Btn
@property (weak, nonatomic)  UIButton *detailBtn;
/// 数据
@property(nonatomic,strong) NSArray * dataArr;
@end

static NSString *nibCellID = @"nibCellID";
@implementation DLPlaneTicketListViewController

- (void)viewDidLoad {
    self.planeListDataArr = [NSMutableArray array];
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    [super viewDidLoad];
    [self setupNavbar];
    //[self setUpheadView];
    [self fetchData];
    [self setupTableView];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)setupNavbar {
    self.title = [NSString stringWithFormat:@"%@ - %@",self.departure,self.destination];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

#pragma mark ------- fetchData

-(void)fetchData {
    
    NSDictionary *param = @{
                            @"departure": self.departure,
                            @"destination": self.destination,
                            @"timestart" : self.timestart,
                            };
    @weakify(self);
    [DLHomeViewTask geAgencyFlightQueryList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            
            //NSLog(@"%@",result);
            
            NSArray *planeListArray = [DLPlaneListDetailModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"flightinfo"]];
            
            [self.planeListDataArr addObjectsFromArray:planeListArray];
            
            
#warning 此处可能有问题!
       
    
            NSArray *dic = result[@"flightinfo"];
            NSLog(@"%@",dic);
            self.dataArr = dic;
            
//            
//            NSArray *arr = dic[@"price"];
//            NSLog(@"%@",arr);
            
          
#warning 此处可能有问题!

            //[self setupSubviews];
            [self.planeTicketListTableView reloadData];
        }
    }];
}

#pragma mark ------- setUpheadView

- (void)setUpheadView{
    
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headView];
    
    UIButton *beforeBtn = [[UIButton alloc]init];
    [beforeBtn setTitle:@"前一天" forState:UIControlStateNormal];
    beforeBtn.contentHorizontalAlignment = 0;
    beforeBtn.titleLabel.font = [UIFont systemFontOfSize: 16];
    beforeBtn.layer.borderWidth = 1.0;
    beforeBtn.layer.cornerRadius = 5.0;
    beforeBtn.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithHexString:@"#6878da"]);
    [beforeBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [beforeBtn addTarget:self action:@selector(beforeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    beforeBtn.backgroundColor = [UIColor whiteColor];
    
    [headView addSubview:beforeBtn];
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.text = self.timestart;
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.textColor = [UIColor blackColor];
    dateLabel.backgroundColor = [UIColor whiteColor];
    dateLabel.font = [UIFont systemFontOfSize:16];
    [headView addSubview:dateLabel];
    
    UIButton *afterBtn = [[UIButton alloc]init];
    [afterBtn addTarget:self action:@selector(afterBtnClick) forControlEvents:UIControlEventTouchUpInside];
    afterBtn.backgroundColor = [UIColor whiteColor];
    afterBtn.contentHorizontalAlignment = 0;
    afterBtn.titleLabel.font = [UIFont systemFontOfSize: 16];
    [afterBtn setTitle:@"后一天" forState:UIControlStateNormal];
    [afterBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [headView addSubview:afterBtn];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.offset(KHEIGHT);
    }];
    
    [beforeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(0);
        make.height.offset(KHEIGHT);
        make.width.offset(100);
    }];
    
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(0);
        make.centerX.offset(0);
        make.height.offset(KHEIGHT);
    }];
    
    [afterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.offset(0);
        make.height.offset(KHEIGHT);
        make.width.offset(100);
    }];
}

- (void)setupTableView {
    
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
        make.top.equalTo(@KHEIGHT);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark -------- BtnClick

-(void)beforeBtnClick {
    
    ///字符串你转Date
    NSString * dateStr = self.timestart;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate *Date = [dateFormatter dateFromString:dateStr];
    NSDate *beforeDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:Date];//前一天
    // Date转字符串
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *beforeDateStr = [dateFormatter stringFromDate:beforeDay];
    //NSString *beforeStr = [beforeDateStr substringFromIndex:10];
    
    
    self.timestart = beforeDateStr;
    
    NSDictionary *param = @{
                            @"departure": self.departure,
                            @"destination": self.destination,
                            @"timestart" : beforeDateStr,
                            };
    @weakify(self);
    [DLHomeViewTask geAgencyFlightQueryList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            
            [self.planeTicketListTableView reloadData];
        }
    }];
}

-(void)afterBtnClick {
    
    NSString * dateStr = self.timestart;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate *Date = [dateFormatter dateFromString:dateStr];
    NSDate *nextDay = [NSDate dateWithTimeInterval:24*60*60 sinceDate:Date];//后一天
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *lastDateStr = [dateFormatter stringFromDate:nextDay];
    
    self.timestart = lastDateStr;

    NSDictionary *param = @{
                            @"departure": self.departure,
                            @"destination": self.destination,
                            @"timestart" : lastDateStr,
                            };
    @weakify(self);
    [DLHomeViewTask geAgencyFlightQueryList:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            
            NSLog(@"%@",result);
            
            NSArray *planeListArray = [DLPlaneListDetailModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"flightinfo"]];
            
            [self.planeListDataArr addObjectsFromArray:planeListArray];
            [self.planeTicketListTableView reloadData];
        }
    }];
}


-(void)detailBtnClick {
    
    DLplaneDetaliViewController *deVC = [[DLplaneDetaliViewController alloc] init];
    
    deVC.departure = self.departure;
    deVC.destination = self.destination;
    deVC.planeListDataArr = self.planeListDataArr;
    deVC.startTime = self.startTimeLabel.text;
    deVC.startPlace = self.startPlaceLabel.text;
    deVC.arriveTime = self.arriveTimeLabel.text;
    deVC.arrivePlace = self.arrivePlaceLabel.text;
    deVC.startOrgjetquery = self.startOrgjetquery.text;
    deVC.dstJetqury = self.dstJetqury.text;
    deVC.airlines = self.airlinesLabel.text;
    deVC.planeType = self.planeType.text;
    deVC.flightNo = self.flightNo.text;
    deVC.nextArr = self.nextArr;

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
    self.startOrgjetquery = cell.startOrgjetquery;
    self.dstJetqury = cell.dstJetqury;
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
    
    DLplaneDetaliViewController *deVC = [[DLplaneDetaliViewController alloc] init];
    
    self.nextArr = self.dataArr[indexPath.section
                                ][@"price"];
    deVC.nextArr = self.nextArr;

    deVC.departure = self.departure;
    deVC.destination = self.destination;
    deVC.planeListDataArr = self.planeListDataArr;
    deVC.startTime = self.startTimeLabel.text;
    deVC.startPlace = self.startPlaceLabel.text;
    deVC.arriveTime = self.arriveTimeLabel.text;
    deVC.arrivePlace = self.arrivePlaceLabel.text;
    deVC.startOrgjetquery = self.startOrgjetquery.text;
    deVC.dstJetqury = self.dstJetqury.text;
    deVC.airlines = self.airlinesLabel.text;
    deVC.planeType = self.planeType.text;
    deVC.flightNo = self.flightNo.text;
    
    
    NSLog(@"%ld",deVC.nextArr.count);

    [self.navigationController pushViewController:deVC animated:YES];


}


@end
