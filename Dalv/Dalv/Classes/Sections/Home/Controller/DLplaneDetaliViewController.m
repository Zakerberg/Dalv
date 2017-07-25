//
//  DLplaneDetaliViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------ 机票订单舱位列表详情界面 ----------------

#import "DLplaneDetaliViewController.h"
#import "DLSubmitPlaneOrderController.h"
#import "DLPlaneTicketsListCell.h"
#import "DLplaneTankCell.h"

@interface DLplaneDetaliViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *planeTicketDetailTableView;
@property(nonatomic,strong) UIButton * orderBtn;
@end

static NSString *nibCellID = @"nibCellID";
static NSString *tankCellID = @"tankCell";
static NSString *tableViewCell = @"tableViewCell";
@implementation DLplaneDetaliViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI{
    
    self.title = [NSString stringWithFormat:@"%@ - %@",self.departure,self.destination];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

-(void)setTableView{
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.planeTicketDetailTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.planeTicketDetailTableView.dataSource = self;
    self.planeTicketDetailTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.planeTicketDetailTableView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.planeTicketDetailTableView.showsVerticalScrollIndicator = NO;
    
    [self.planeTicketDetailTableView registerNib:[UINib nibWithNibName:@"DLPlaneTicketsListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
    [self.planeTicketDetailTableView registerNib:[UINib nibWithNibName:@"DLplaneTankCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:tankCellID];
    [self.view addSubview:self.planeTicketDetailTableView];
    [self.planeTicketDetailTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

#pragma mark ------- orderBtnClick

-(void)orderBtnClick {
    
    DLSubmitPlaneOrderController *vc = [[DLSubmitPlaneOrderController alloc] init];
    vc.orderModel = self.model;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ------- UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 1;
        
    }else if(section == 1){
        
        return 1;
    }
    
    return self.nextArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        DLPlaneTicketsListCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];
        
        [cell configureCell:self.model];
        cell.startTimeLabel.text = self.model.depTime;// 出发时间
        cell.arriveTimeLabel.text = self.model.arriTime;// 达到时间
        cell.startPlaceLabel.text = self.model.orgCityName;// 出发机场
        cell.arrivePlaceLabel.text = self.model.dstCityName;// 到达机场
        cell.startPlaceLabel.text = self.model.orgJetquay;// 出发航站楼
        cell.dstJetqury.text = self.model.dstJetquay; // 到达航站楼
        cell.airlinesLabel.text = self.model.flightName;// 航空公司
        cell.flightNo.text = self.model.flightNo;// 航班号
        cell.planeType.text = self.model.planeType;// 飞机型号
        cell.detailBtn.hidden = YES;
        
        return cell;
    }
    
    else if(indexPath.section == 1) {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                          reuseIdentifier: tableViewCell];
        }
        cell.textLabel.text = @"预订舱位";
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        return cell;
        
    }else if (indexPath.section == 2){
        
        DLplaneTankCell *Tankell = [tableView dequeueReusableCellWithIdentifier:tankCellID];
        DLPlaneListDetailModel *tankModel = [self.planeListDataArr objectAtIndex:indexPath.section];
        [Tankell configureCell:tankModel];
        
        self.orderBtn = Tankell.orderBtn;
        [Tankell.orderBtn addTarget:self action:@selector(orderBtnClick) forControlEvents:UIControlEventTouchUpInside];
        Tankell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return Tankell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 136;
        
    }else if (indexPath.section == 1){
        return 20;
    }
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0 || section == 2) {
        return 0.1;
    }
    return 10.0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
