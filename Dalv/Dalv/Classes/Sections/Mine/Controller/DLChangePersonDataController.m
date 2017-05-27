//
//  DLChangePersonDataController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLChangePersonDataController.h"

@interface DLChangePersonDataController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView* tableView ;
@property (strong,nonatomic) NSArray* cellTiltleArr ;
@property (assign,nonatomic) NSIndexPath* selectedIndexPath ;
@end

@implementation DLChangePersonDataController

-(NSArray*)cellTiltleArr
{
    if (!_cellTiltleArr) {
        
        _cellTiltleArr = @[@"姓名",@"年龄",@"性别",@"从业时间",@"手机号",@"邮箱",@"修改密码"];
    }
    
    return _cellTiltleArr ;
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO ;
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        [self.view  addSubview: _tableView];
    }
    
    return _tableView ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath =  indexPath ;
    
    if (indexPath.row == 0) {
        
        
    }
    
    if (indexPath.row == 1) {
        
        
    }
    
    if (indexPath.row == 3) {

    }
    if (indexPath.row == 4) {
    }
    
    if (indexPath.row == 5) {
    }
    
    if (indexPath.row == 6) {
    }




}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTiltleArr.count ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"cellID" ;
    UITableViewCell*  cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    
    for (UIView* View in cell.contentView.subviews)
    {
        if ([View isKindOfClass:[UIImageView class]]||[View isKindOfClass:[UITextField class]]) {
            [View removeFromSuperview];
        }
        
    }
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone ;
        
    }
    
    cell.textLabel.text = self.cellTiltleArr[indexPath.row];
    
    return cell ;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
