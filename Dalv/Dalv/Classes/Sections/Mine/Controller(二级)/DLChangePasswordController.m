//
//  DLChangePasswordController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLChangePasswordController.h"
#import "ZYInputAlertView.h"
#import "DLHomeViewTask.h"

static NSString* cellID = @"cellID";
@interface DLChangePasswordController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView* tableView;
@property (strong,nonatomic) NSArray* cellTiltleArr;
@property (assign,nonatomic) NSIndexPath* selectedIndexPath ;
@property (weak,nonatomic) UITableViewCell* cell;
@property (nonatomic,weak) UITextField *oldPasswordTF;
@property (nonatomic,strong) UITextField *changePasswordTF;
@property (nonatomic,strong) UITextField *changeTwoPasswordTF;
@end
@implementation DLChangePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = NO;
    self.title = @"修改密码";
    [self setupUI];
    [self fetchData];
}

-(void)fetchData {
    
    
    NSDictionary *param = @{
                            
                            @"uid":@"1132",
                            @"sign_token":@"054f9b77205f634d348ef05d98210783"
    
                            };
    
    [DLHomeViewTask  getAgencyEditPass:param completion:^(id result, NSError *error) {
        
    }];
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
        _tableView.tableFooterView = [UIView new];
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
    
    
    if (self.changeTwoPasswordTF.text == nil) {
        
        UIAlertView *failureV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入新密码" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [failureV show];

    }
    if (self.oldPasswordTF.text != self.changeTwoPasswordTF.text) {
        
        UIAlertView *failureV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"两次输入的密码不一致" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [failureV show];

    }
    
    if (self.oldPasswordTF.text == self.changePasswordTF.text && self.changeTwoPasswordTF.text != self.oldPasswordTF.text) {
        
        NSDictionary *param = @{
                                
                                @"uid":@"1132",
                                @"sign_token":@"054f9b77205f634d348ef05d98210783",
                                @"oldPassword":self.oldPasswordTF.text,
                                @"newPassword":self.changePasswordTF.text

                                };
        
        [DLHomeViewTask getAgencyEditPassHandle:param completion:^(id result, NSError *error) {
            
        }];
    }
}

#pragma mark -------------- UITable View Delegate ------------------

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


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
    
    
    if (indexPath.row == 0) {
        UITextField *oldPasswordTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH-15, 50)];
        self.oldPasswordTF = oldPasswordTF;
        oldPasswordTF.placeholder = @"请输入旧密码";
        oldPasswordTF.secureTextEntry = YES;
        oldPasswordTF.clearsOnBeginEditing = YES;
        oldPasswordTF.textAlignment = NSTextAlignmentRight;
        [tableView addSubview:oldPasswordTF];
    }
    if (indexPath.row == 1) {
        UITextField *changePasswordTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 50, MAIN_SCREEN_WIDTH-15, 50)];
        self.changePasswordTF = changePasswordTF;
        changePasswordTF.placeholder = @"请输入新密码";
        changePasswordTF.secureTextEntry = YES;
        changePasswordTF.clearsOnBeginEditing = YES;
        changePasswordTF.textAlignment = NSTextAlignmentRight;
        [tableView addSubview:changePasswordTF];
    }
    if (indexPath.row == 2) {
        UITextField *changeTwoPasswordTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, MAIN_SCREEN_WIDTH-15, 50)];
        self.changeTwoPasswordTF = changeTwoPasswordTF;
        changeTwoPasswordTF.placeholder = @"请再次输入新密码";
        changeTwoPasswordTF.secureTextEntry = YES;
        changeTwoPasswordTF.clearsOnBeginEditing = YES;
        changeTwoPasswordTF.textAlignment = NSTextAlignmentRight;
        [tableView addSubview:changeTwoPasswordTF];
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
