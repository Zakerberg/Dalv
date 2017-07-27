//
//  DLAddPlanePeopleController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/21.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLAddPlanePeopleController.h"
#import "DLAddPeopleCell.h"

@interface DLAddPlanePeopleController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak,nonatomic) UITableViewCell* personCell;
@property (nonatomic,strong) UITableView * planePeopleTableView;
@property (strong, nonatomic) UIButton *searchBtn;
@end
static NSString *cell1ID = @"cell1ID";
static NSString *cellID = @"cellID";

@implementation DLAddPlanePeopleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setTab];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ----- setUI

- (void)setUI {
    
    self.title = @"添加乘机人";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
}

#pragma mark ----- setTab

-(void)setTab{
    
    self.planePeopleTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.planePeopleTableView.dataSource = self;
    self.planePeopleTableView.delegate = self;
    self.planePeopleTableView.tableFooterView = [UIView new];
    self.planePeopleTableView.backgroundColor = [UIColor ms_backgroundColor];
    [self.planePeopleTableView registerClass:[DLAddPeopleCell class] forCellReuseIdentifier:cell1ID];
    
    [self.view addSubview:self.planePeopleTableView];
    
    UIButton *btn = [[UIButton alloc] init];
    self.searchBtn = btn;
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor colorWithHexString:@"#4d67ee"];
    btn.layer.cornerRadius = 8.0;
    
    [self.planePeopleTableView addSubview:btn];
    
    [self.planePeopleTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.planePeopleTableView.tableFooterView.mas_top).offset(43);
        make.height.offset(44);
        make.left.equalTo(@15);
        make.right.equalTo(self.view.mas_right).offset(-15);
    }];
}

-(void)btnClick {
    
  
}

#pragma mark ----- UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        DLAddPeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1ID];
        self.nameTF = cell.TF;
        cell.textLabel.text = @"乘机人姓名";
        self.nameTF.placeholder = @"请输入乘机人姓名";
        
        return cell;
        
    } else if (indexPath.row == 1){
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                          reuseIdentifier: cellID];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.textLabel.text = @"乘客类型";
        cell.accessoryType = 1;
        //cell.textLabel.font = [UIFont systemFontOfSize:15];
        //cell.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
        
        UILabel *peopleTypeLabel = [[UILabel alloc] init];
        self.peopleTypeLabel = peopleTypeLabel;
        peopleTypeLabel.font = [UIFont systemFontOfSize:15];
        peopleTypeLabel.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
        
        //cell.detailTextLabel.text = self.destinationLabel.text;
        
        [cell.contentView addSubview:peopleTypeLabel];
        
        [peopleTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15);
            make.height.offset(44);
            make.top.offset(0);
        }];
        
        return cell;
        
    }else if (indexPath.row == 2){
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                          reuseIdentifier: cellID];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.textLabel.text = @"证件类型";
        cell.accessoryType = 1;
        
        UILabel *certificateType = [[UILabel alloc] init];
        self.certificateType = certificateType;
        certificateType.font = [UIFont systemFontOfSize:15];
        certificateType.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
        
        //cell.detailTextLabel.text = self.startDate.text;
        
        [cell.contentView addSubview:certificateType];
        
        [certificateType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15);
            make.height.offset(44);
            make.top.offset(0);
        }];
        
        return cell;
        
    }else{
        
        DLAddPeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1ID];
        self.certificatenNumTF = cell.TF;
        cell.textLabel.text = @"证件号码";
        self.certificatenNumTF.keyboardType = 4;
        self.certificatenNumTF.placeholder = @"请输入证件号码";
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 1){
        
    }else if (indexPath.row == 2){
    
    }

}

@end
