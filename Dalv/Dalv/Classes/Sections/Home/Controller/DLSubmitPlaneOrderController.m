//
//  DLSubmitPlaneOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ---------------- 提交机票订单界面 ------------------

#import "DLSubmitPlaneSection2Row1Cell.h"
#import "DLSubmitPlaneOrderController.h"
#import "DLAddPlanePeopleController.h"
#import "DLSubmitPlaneSection0Cell.h"
#import "DLSubmitSection1Cell.h"

@interface DLSubmitPlaneOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *submitPlaneTableView;
@property(nonatomic,strong) UIButton *addBtn;
@property(nonatomic,assign) NSInteger Section2Number;
@property(nonatomic,strong) UILabel * nameLabel;
@end

static NSString * submitPlaneSection0Cell = @"submitPlaneSection0Cell";
static NSString * submitPlaneSection1Cell = @"submitPlaneSection1Cell";
static NSString * submitPlaneSection2Row1Cell = @"submitPlaneSection2Row1Cell";
static NSString * cellID = @"cellID";

static NSInteger addBtnCount ;

@implementation DLSubmitPlaneOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setUI];
    
    self.Section2Number = 0;
    addBtnCount = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI {
    self.title = @"提交机票订单";
}


#pragma mark -------- setTableView

-(void)setTableView{
    
    self.submitPlaneTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.submitPlaneTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.submitPlaneTableView.dataSource = self;
    self.submitPlaneTableView.delegate = self;
    [self.submitPlaneTableView registerNib:[UINib nibWithNibName:@"DLSubmitPlaneSection0Cell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:submitPlaneSection0Cell];
    
    [self.submitPlaneTableView registerNib:[UINib nibWithNibName:@"DLSubmitSection1Cell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:submitPlaneSection1Cell];
    
    [self.submitPlaneTableView registerClass:[DLSubmitPlaneSection2Row1Cell class] forCellReuseIdentifier:submitPlaneSection2Row1Cell];
    

    [self.submitPlaneTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:self.submitPlaneTableView];
    
    [self.submitPlaneTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-48);
    }];
}


#pragma mark ------ addBtnClick

-(void)addBtnClick {
    
    NSLog(@"addBtnClick");
    
    addBtnCount++;
    
    self.Section2Number = 3 *addBtnCount;
    
    [self.submitPlaneTableView reloadData];
    
    DLAddPlanePeopleController *addVC = [[DLAddPlanePeopleController alloc] init];
    
    [self.navigationController pushViewController:addVC animated:YES];
    
}


#pragma mark ------ UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        
        return 1;
        
    }else if (section == 1){

        return 1;
        
        
    }else if (section == 2){

        return self.Section2Number;
        
    }else if (section == 3) {
        
        
        return 4;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) { // 机票信息
        DLSubmitPlaneSection0Cell *cell = [tableView dequeueReusableCellWithIdentifier:submitPlaneSection0Cell];
        
        cell.airlinesLabel.text = self.orderModel.flightName; // 出发时间
        
        cell.flightNo.text = self.orderModel.flightNo;
        cell.planeType.text = self.orderModel.planeType;
        cell.arrDate.text = self.orderModel.arrDate;
        cell.depname.text = self.orderModel.depname;
        cell.arrname.text = self.orderModel.arrname;
        cell.startTimeLabel.text = self.orderModel.depTime;
        cell.startPlaceLabel.text = self.orderModel.orgCityName;
        cell.fuelTax.text = self.orderModel.fuelTax;
        cell.airportTax.text = self.orderModel.airportTax;
        cell.arriveTimeLabel.text = self.orderModel.arriTime;
        cell.arrivePlaceLabel.text = self.orderModel.dstCityName;
        cell.startOrgjetquery.text = self.orderModel.orgJetquay;
        cell.dstJetqury.text = self.orderModel.dstJetquay;
        return cell;
        
    }else if (indexPath.section == 1) { /// 添加乘机人
   
        DLSubmitSection1Cell *cell = [tableView dequeueReusableCellWithIdentifier:submitPlaneSection1Cell];
        
        self.addBtn = cell.addBtn;
        [self.addBtn setTitle:@"添加乘机人" forState:UIControlStateNormal];

        [self.addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
 
        return cell;
        
    }else if (indexPath.section == 2) { /// 添加乘机人
        
      
        
        DLSubmitPlaneSection2Row1Cell *cell = [tableView dequeueReusableCellWithIdentifier:submitPlaneSection2Row1Cell];
        
        
        self.nameLabel = cell.nameLabel;
        
        
        
        
        return cell;
        
        
  
    }else{ /// 联系信息
        
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                          reuseIdentifier: cellID];
        }
        
        cell.textLabel.text = @"乘机人信息";
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        
        return cell;
    }
    
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
    
        return 176;
    
    }else if (indexPath.section == 1) {
        
        return 45;
        
    }else {
        
        if (indexPath.row == 0 || indexPath.row == 3) {
            return 34;
            
        }else{
            
            return 44;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 0.1;
        
    }else if (section == 2){
        
        return 1;
        
    }
        
    return 10.0;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    
    
    
    
    
    
}





@end
