
//
//  DLLineQueryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  --------------------   线路查询  ------------------

#import "DLLineQueryController.h"
#import "DLLineQueryCell.h"

@interface DLLineQueryController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *lineQuerytableview;
@end

static NSString *lineQueryCellID = @"lineQuery_Cell_ID";
@implementation DLLineQueryController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupUI];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setupUI{
    
    self.title = @"线路查询";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.lineQuerytableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineQuerytableview.dataSource = self;
    self.lineQuerytableview.backgroundColor = [UIColor ms_backgroundColor];
    self.lineQuerytableview.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.lineQuerytableview.showsVerticalScrollIndicator = NO;
    [self.lineQuerytableview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.lineQuerytableview registerClass:[DLLineQueryCell class] forCellReuseIdentifier:lineQueryCellID];
    
    [self.view addSubview:self.lineQuerytableview];
    
    [self.lineQuerytableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-48);
    }];
}

#pragma mark  --------- UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 45;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DLLineQueryCell *cell = [tableView dequeueReusableCellWithIdentifier:lineQueryCellID];
    
    return cell;
    
}


@end






 
 
 
 
 
 
 
 






























































