//
//  DLChangePasswordController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLChangePasswordController.h"
static NSString* cellID = @"cellID";
@interface DLChangePasswordController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView* tableView;
@property (strong,nonatomic) NSArray* cellTiltleArr;
@property (assign,nonatomic) NSIndexPath* selectedIndexPath ;
@property (assign,nonatomic) UITableViewCell* cell;
@end
@implementation DLChangePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = NO;
    self.title = @"修改密码";
    [self setupUI];
}

-(NSArray*)cellTiltleArr
{
    if (!_cellTiltleArr) {
        
        _cellTiltleArr = @[@"旧密码:",@"新密码:",@"确认密码:"];
    }
    return _cellTiltleArr ;
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO ;
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        [self.view  addSubview: _tableView];
    }
    
    return _tableView ;
}


-(void)setupUI {
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(completeClick)];
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}


/***  完成  ***/
-(void)completeClick {
    
    // ---- ----- --- -- - -- - -- - -- -- - -- - - -- - - - -
    
}
















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------- UITable View Delegate ------------------

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTiltleArr.count ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell*  cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    }
    
    cell.textLabel.text = self.cellTiltleArr[indexPath.row];
    
    return cell ;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath ;
    self.cell = [self.tableView cellForRowAtIndexPath:self.selectedIndexPath] ;
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
