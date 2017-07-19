//
//  DLplaneDetaliViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLplaneDetaliViewController.h"
#import "DLPlaneTicketsListCell.h"
#import "DLplaneTankCell.h"

@interface DLplaneDetaliViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *planeTicketDetailTableView;
@property(nonatomic,strong) NSMutableArray * planeDetailDataArr;
@end

static NSString *nibCellID = @"nibCellID";
static NSString *tankCellID = @"tankCell";
@implementation DLplaneDetaliViewController

-(void)viewWillAppear:(BOOL)animated{
    
    self.planeDetailDataArr = [NSMutableArray array];
}

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



#pragma mark ------- UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 1;
    }
    
    return self.planeDetailDataArr.count;
    
}


/*
 
 @property (weak, nonatomic)  UILabel *startTimeLabel;
 @property (weak, nonatomic)  UILabel *startPlaceLabel;
 @property (weak, nonatomic)  UILabel *arriveTimeLabel;
 @property (weak, nonatomic)  UILabel *arrivePlaceLabel;
 @property (weak, nonatomic)  UILabel *startOrgjetquery;
 @property (weak, nonatomic)  UILabel *dstJetqury;
 @property (weak, nonatomic)  UILabel *airlinesLabel;
 @property (weak, nonatomic)  UILabel *flightNo;
 @property (weak, nonatomic)  UILabel *planeType;
 
 */


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        DLPlaneTicketsListCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];
      
        cell.startTimeLabel.text = self.startTime;
        cell.startPlaceLabel.text = self.startPlace;
        cell.arrivePlaceLabel.text = self.arrivePlace;
        cell.arriveTimeLabel.text = self.arriveTime;
        cell.startOrgjetquery.text = self.startOrgjetquery;
        cell.dstJetqury.text = self.dstJetqury;
        cell.airlinesLabel.text = self.airlines;
        cell.flightNo.text = self.flightNo;
        cell.planeType.text = self.planeType;
        cell.detailBtn.hidden = YES;

        
        return cell;
    }

        DLplaneTankCell *Tankell = [tableView dequeueReusableCellWithIdentifier:tankCellID];
        return Tankell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    return 136;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
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
