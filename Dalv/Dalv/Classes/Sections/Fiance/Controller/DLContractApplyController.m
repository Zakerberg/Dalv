//
//  DLContractApplyController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplyController.h"
#import "DLContractApplyViewCell.h"

@interface DLContractApplyController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UILabel * moneyLabel;

@property (nonatomic, strong) UITableView *contractTableView;
//自取invite
@property(nonatomic,weak)UIButton *inviteBtn;

//快递Courier
@property(nonatomic,weak)UIButton *courierBtn;

@end
static NSString *nibCellID = @"nibCellID";
static NSString *cellID = @"cellID";
@implementation DLContractApplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"合同申请";
    [self setTableView];
    
    /*
     self.view.backgroundColor = [UIColor ms_backgroundColor];
     self.homeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
     self.homeTableView.dataSource = self;
     self.homeTableView.backgroundColor = [UIColor ms_backgroundColor];
     self.homeTableView.delegate = self;
     [self.homeTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
     self.homeTableView.showsVerticalScrollIndicator = NO;
     
     [self.homeTableView registerClass:[DLLineOrderPriceTableViewCell class] forCellReuseIdentifier:[DLLineOrderPriceTableViewCell cellIdentifier]];
     [self.homeTableView registerClass:[DLLineOrderChoiceDateTableViewCell class] forCellReuseIdentifier:[DLLineOrderChoiceDateTableViewCell cellIdentifier]];
     [self.homeTableView registerClass:[DLLineOrderTripNumebrTableViewCell class] forCellReuseIdentifier:[DLLineOrderTripNumebrTableViewCell cellIdentifier]];
     [self.homeTableView registerClass:[DLLineOrderSingleRoomTableViewCell class] forCellReuseIdentifier:[DLLineOrderSingleRoomTableViewCell cellIdentifier]];
     [self.homeTableView registerClass:[DLLineOrderContactsTableViewCell class] forCellReuseIdentifier:[DLLineOrderContactsTableViewCell cellIdentifier]];
     [self.view addSubview:self.homeTableView];
     
     [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.width.equalTo(self.view.mas_width);
     make.top.equalTo(self.view.mas_top);
     make.left.equalTo(self.view.mas_left);
     make.bottom.equalTo(self.view.mas_bottom).offset(-50);
     }];
     */
}

#pragma mark ----------------- Set TanbleView -----------------
-(void)setTableView {
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    self.contractTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.contractTableView.dataSource = self;
    self.contractTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.contractTableView.delegate = self;
    [self.contractTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contractTableView.showsVerticalScrollIndicator = NO;
    
    //注册
    [self.contractTableView registerNib:[UINib nibWithNibName:@"DLContractApplyViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
    
    [self.contractTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:self.contractTableView];
    
    [self.contractTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        
    }];
    
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark  ----------UITable View Delegate------------

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    return 36;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 3;
    }
    return 2;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    if (indexPath.section == 0) {
        DLContractApplyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"国内合同";
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"境外合同";
        }
        if (indexPath.row == 2) {
            cell.textLabel.text = @"单项委托";
        }
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return cell;

}


















@end
