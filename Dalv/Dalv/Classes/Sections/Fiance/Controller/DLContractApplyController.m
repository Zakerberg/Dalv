//
//  DLContractApplyController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplyController.h"
#import "DLContractApplyViewCell.h"
#import "DLCourierController.h"
#import "DLinviteController.h"
#import "DLContractApplySection1Cell.h"
#import "DLContractApplySection2Cell.h"

@interface DLContractApplyController ()<UITableViewDelegate,UITableViewDataSource>
//自取invite
@property(nonatomic,strong)UIButton *inviteBtn;
//快递Courier
@property(nonatomic,strong)UIButton *courierBtn;


//@property(nonatomic,strong) UIScrollView *mainScrollerView;
//@property (nonatomic, strong) UIImageView *courierImageView;
//@property (nonatomic, strong) UIImageView *inviteImageView;
@property (nonatomic, strong) UITableView *contractTableView;

@property (nonatomic, strong) DLCourierController *courierVC;
@property (nonatomic, strong) DLinviteController *inviteVC;

@property(nonatomic,assign) NSInteger Section1Number;
@property(nonatomic,assign) NSInteger Section2Number;
@property(nonatomic,assign) NSInteger Section3Number;



@end
static NSString *nibCellID = @"nibCellID";
static NSString *section1CellID = @"section1CellID";
static NSString *section2CellID = @"section2CellID";
static NSString *section3CellID = @"section3CellID";

@implementation DLContractApplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"合同申请";
    [self setTableView];
//    [self setUI];
    self.Section1Number = 2;
    self.Section2Number = 0;
    self.Section3Number = 0;
    
    
    
    
}

#pragma mark ----------------- Set UI -----------------
//-(void)setUI {

//    UIButton *courierBtn = [[UIButton alloc] init];
//    self.courierBtn = courierBtn;
//    [courierBtn setTitle:@"   快递" forState:UIControlStateNormal];
//    courierBtn.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
//    courierBtn.contentHorizontalAlignment =
//    UIControlContentHorizontalAlignmentLeft;
//    courierBtn.tag = 100;
//    courierBtn.tintColor = [UIColor colorWithHexString:@"#494949"];
//    courierBtn.backgroundColor = [UIColor redColor];
//    [courierBtn addTarget:self action:@selector(courierBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.contractTableView addSubview: courierBtn];
//    
//    
//    UIButton *inviteBtn = [[UIButton alloc] init];
//    self.inviteBtn = inviteBtn;
//    [inviteBtn setTitle:@"   自取" forState:UIControlStateNormal];
//    inviteBtn.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
//    inviteBtn.contentHorizontalAlignment =
//    UIControlContentHorizontalAlignmentLeft;
//    inviteBtn.tag = 101;
//    [inviteBtn addTarget:self action:@selector(inviteBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    inviteBtn.tintColor = [UIColor colorWithHexString:@"#494949"];
//    inviteBtn.backgroundColor = [UIColor greenColor];
//    [self.contractTableView addSubview: inviteBtn];
    
//    UIImageView *courierImageView = [[UIImageView alloc] init];
//    self.courierImageView = courierImageView;
//    [courierImageView setImage:[UIImage imageNamed:@"UnCheck"]];
//    [courierBtn addSubview:courierImageView];
//    
//    UIImageView *inviteImageView = [[UIImageView alloc] init];
//    self.inviteImageView = inviteImageView;
//    [inviteImageView setImage:[UIImage imageNamed:@"UnCheck"]];
//    [inviteBtn addSubview:inviteImageView];
//    
//    [courierBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@45);
//        make.left.equalTo(@0);
//        make.top.equalTo(label.mas_bottom).offset(0);
//        make.width.equalTo(@(self.view.width/2));
//    }];
//    
//    
//    [inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//       make.height.equalTo(@45);
//        make.right.equalTo(@0);
//        make.left.equalTo(courierBtn.mas_right).offset(1);
//        make.width.equalTo(@(self.view.width/2));
//        make.top.equalTo(label.mas_bottom).offset(0);
//    }];
//    
//    [courierImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(courierBtn);
//        make.right.equalTo(courierBtn.mas_right).offset(-20);
//        make.height.width.equalTo(@20);
//    }];
//    
//    [inviteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(inviteBtn);
//        make.right.offset(-20);
//        make.height.width.equalTo(@20);
//    }];
//}

     
#pragma mark ----------------- Set TableView -----------------

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
    
    [self.contractTableView registerClass:[DLContractApplySection1Cell class] forCellReuseIdentifier:section1CellID];
    
    [self.contractTableView registerClass:[DLContractApplySection2Cell class] forCellReuseIdentifier:section2CellID];
//    [self.contractTableView registerClass:[DLContractApplySection1Cell class] forCellReuseIdentifier:section3CellID];
//
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

#pragma mark -----------  BtnClick ----------------

/*** 自取按钮 ***/
-(void)inviteBtnClick {
    
    [self.inviteBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
    [self.courierBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    
    self.Section1Number = 2;
    self.Section2Number = 0;
    self.Section3Number = 0;
    [self.contractTableView reloadData];
}

/***  快递按钮 ***/
-(void)courierBtnClick {
    
    [self.courierBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
    [self.inviteBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    
    self.Section1Number = 1;
    self.Section2Number = 1;
    self.Section3Number = 3;
    [self.contractTableView reloadData];
    
    
    
    
}

#pragma mark  ----------UITable View Delegate------------

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    return 36;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1 && indexPath.row == 1) {
        return 80;
    }
    
    return 45;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
    return 4;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 3;
    }
    
    if (section == 1) {
        
        return self.Section1Number;
    }
    
    if (section == 2) {
        return self.Section2Number;
    }
    
    return self.Section3Number;
    
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
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        self.Section1Number = 2;
        
        DLContractApplySection1Cell *cell = [tableView dequeueReusableCellWithIdentifier:section1CellID];
        self.inviteBtn = cell.inviteBtn;
        self.courierBtn = cell.courierBtn;
        [cell.inviteBtn addTarget:self action:@selector(inviteBtnClick) forControlEvents:UIControlEventTouchUpInside];
       
        [cell.courierBtn addTarget:self action:@selector(courierBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        
        DLContractApplySection2Cell *cell = [tableView dequeueReusableCellWithIdentifier:section2CellID];
        
        return cell;
    }
    
    DLContractApplySection1Cell *cell = [tableView dequeueReusableCellWithIdentifier:section1CellID];
    self.inviteBtn = cell.inviteBtn;
    self.courierBtn = cell.courierBtn;
    [cell.inviteBtn addTarget:self action:@selector(inviteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.courierBtn addTarget:self action:@selector(courierBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

@end
