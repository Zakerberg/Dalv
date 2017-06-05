//
//  DLMyCustomerListController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMyCustomerListController.h"

@interface DLMyCustomerListController ()
//<UITableViewDelegate,UITableViewDataSource>
//@property(nonatomic,strong) UITableView * tableView;
//@property(nonatomic,strong) UIView *headView;
//@property(nonatomic,strong)UIImageView *iconImageV;
//
////圆角头像
//@property(nonatomic,weak)UIImageView *headImageV;
//@property(nonatomic,weak)UILabel *nameLabel;
//@property(nonatomic,weak)UILabel *numLabel;
//@property(nonatomic,weak)UILabel *timeLabel;
//@property(nonatomic,strong) UITableViewCell *cell;
@end

//static NSString *cellID  = @"cell_ID";

@implementation DLMyCustomerListController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setUI];
//    [self setHeadView];
}

//-(void)setUI {
//    
//    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
//    
//    self.title = @"直客列表";
//}
//



//头部视图
//-(void)setHeadView
//{
//    UIView *headView = [[UIView alloc] init ];
//    
//    self.headView = headView;
//    headView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:headView];
//    
//    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.offset(0);
//        make.height.offset(44);
//    }];
//    
//    
//    
//    
//    UIImageView *imageV = [[UIImageView alloc] init];
//    [imageV setImage:[UIImage imageNamed:@"MyCustomer"]];
//    [headView addSubview:imageV];
//    
//    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.offset(12);
//        make.height.width.offset(20);
//        make.centerY.equalTo(headView);
//    }];
//    
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"我的直客列表";
//    [label sizeToFit];
//    label.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
//    [headView addSubview:label];
//    
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(imageV.mas_right).offset(8);
//        make.height.offset(15);
//        make.centerY.equalTo(headView);
//    }];
//    
//    
//    
//}
//




//-(UITableView*)tableView
//{
//    if (!_tableView) {
//        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT) style:UITableViewStyleGrouped];
//        _tableView.showsVerticalScrollIndicator = NO;
//        _tableView.tableFooterView = [UIView new];
//        _tableView.delegate = self ;
//        _tableView.dataSource = self ;
//        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
//        [self.view addSubview:_tableView];
//    }
//    
//    return _tableView ;
//}



#pragma mark  ----------UITable View Delegate---------------

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 89;
//}
//
////头部视图的间距
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 1;
//}
//

#pragma mark ------------  Table view data source --------------
#pragma mark ------------  代码没封装,后期再处理   -----------------

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    return 3;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
//    self.cell = cell;
//    
//    UIImageView *headImageV = [[UIImageView alloc] init];
//    self.headImageV = headImageV;
//    [headImageV setImage:[UIImage imageNamed:@"v2_my_avatar"]];
//    headImageV.layer.cornerRadius = 54;
//    [cell addSubview:headImageV];
//    
//    [headImageV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(12);
//        make.height.width.offset(54);
//        make.right.offset(612/2);
//        make.top.equalTo(cell.mas_top).offset(12);
//    }];
//    
//    
//    UILabel *namelabel = [[UILabel alloc] init];
//    self.nameLabel = namelabel;
//    namelabel.text = @"XXXX";
//    [namelabel sizeToFit];
//    namelabel.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(14.0)];
//    namelabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
//    [cell addSubview:namelabel];
//    
//    [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(15);
//        make.height.offset(14);
//        make.left.equalTo(self.headImageV.mas_right).offset(250);
//    }];
//    
//    return cell;
//}
//



@end
