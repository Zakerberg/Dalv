//
//  DLInvioiceApplyController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ---------------   发票申请   ------------

#import "DLInvioiceApplyController.h"
#import "DLHomeViewTask.h"

@interface DLInvioiceApplyController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>
@property (nonatomic, strong) UITableView *invoiceTableView;

/*** 发票抬头TF  ***/
@property(nonatomic,strong) UITextField * companyTF;
/*** 发票项目TF  ***/
@property(nonatomic,strong) UITextField *projectTF;
/*** 发票备注TF  ***/
@property(nonatomic,strong) UITextView *noteTextView;

@end

static NSString *cellID = @"cellID";
static NSString *cell2ID = @"cell2ID";
@implementation DLInvioiceApplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"发票申请";
}

#pragma mark ----------------- Set TableView -----------------

-(void)setTableView {
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    self.invoiceTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.invoiceTableView.dataSource = self;
    self.invoiceTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.invoiceTableView.delegate = self;
//    [self.invoiceTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.invoiceTableView.showsVerticalScrollIndicator = NO;
    
    [self.invoiceTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.invoiceTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cell2ID];
    
    [self.view addSubview:self.invoiceTableView];
    
    [self.invoiceTableView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    
    else if (section == 1){
        return 14;
    }
    else if (section == 4){
        return 10;
    }
    
    return 32;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        return 75;
    }
    else if (indexPath.section == 0 && indexPath.row == 3){
        return 32;
    }
    
    else if (indexPath.section == 4 && indexPath.row == 0){
        return 70;
    }
    
    return 45;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 6;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        //来个选择器 ----  ---- --- -- - - -- - -- - - -- -  - - - - -
    }
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    else if (section == 1 || section == 2 || section == 3 || section == 5){
        return 1;
    }
    
    else if (section == 4){
        return 3;
    }

    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

        if (indexPath.row == 0) {
            UILabel *companyLabel = [[UILabel alloc]init];
            companyLabel.text = @"发票抬头";
            companyLabel.font = [UIFont systemFontOfSize:16];
            companyLabel.textColor = [UIColor colorWithHexString:@"#494949"];
            [companyLabel sizeToFit];
            [self.invoiceTableView addSubview:companyLabel];
            
            
            UITextField *companyTF = [[UITextField alloc] init];
            self.companyTF = companyTF;
            companyTF.placeholder = @"请输入公司名称";
            companyTF.borderStyle = UITextBorderStyleNone;
            
            [self.invoiceTableView addSubview:companyTF];
            
            [companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.height.equalTo(@15);
            }];
            
            [companyTF mas_makeConstraints:^(MASConstraintMaker *make) {
               make.centerY.equalTo(companyLabel.mas_centerY).offset(0);
                make.height.offset(44);
                make.right.offset(0);
                make.left.equalTo(companyLabel.mas_right).offset(15);
            }];

        }else if (indexPath.row == 1){
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            UILabel *projectLabel = [[UILabel alloc]init];
            projectLabel.text = @"发票项目";
            projectLabel.font = [UIFont systemFontOfSize:16];
            projectLabel.textColor = [UIColor colorWithHexString:@"#494949"];
            [projectLabel sizeToFit];
            [self.invoiceTableView addSubview:projectLabel];

            UITextField *projectTF = [[UITextField alloc] init];
            self.projectTF = projectTF;
            projectTF.placeholder = @"请选择发票项目,团款";
            projectTF.borderStyle = UITextBorderStyleNone;
            
            [self.invoiceTableView addSubview:projectTF];

            
            [projectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.height.equalTo(@15);
                make.top.equalTo(@60);
            }];
            
            [projectTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(projectLabel.mas_centerY).offset(0);
                make.height.offset(44);
                make.right.offset(0);
                make.left.equalTo(projectLabel.mas_right).offset(15);
            }];
        }
        /** 发票备注 **/
        else if (indexPath.row == 2){
            
            UILabel *noteLabel = [[UILabel alloc]init];
            
            noteLabel.text = @"发票备注";
            noteLabel.font = [UIFont systemFontOfSize:16];
            noteLabel.textColor = [UIColor colorWithHexString:@"#494949"];
            [noteLabel sizeToFit];
            
            [self.invoiceTableView addSubview:noteLabel];
            
            UITextView *noteTextView = [[UITextView alloc] init];
            self.noteTextView = noteTextView;
            
            noteTextView.font = [UIFont systemFontOfSize:15];
            noteTextView.delegate = self;
            noteTextView.textColor = [UIColor colorWithHexString:@"#c1c1c1"];
            noteTextView.text = @"请填写备注 如代订机票,代订房费等";

            [self.invoiceTableView addSubview:noteTextView];
            
            [noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.height.equalTo(@15);
                make.top.equalTo(@105);
            }];
            
            [noteTextView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.offset(75);
                make.left.equalTo(noteLabel.mas_right).offset(15);
//                make.width.offset(0);
                make.top.offset(90);
            }];
        }
        
        else if (indexPath.row == 3){
            UILabel *amountLabel = [[UILabel alloc]init];
            amountLabel.text = @"剩余发票额度:";
            amountLabel.font = [UIFont systemFontOfSize:16];
            amountLabel.textColor = [UIColor colorWithHexString:@"#494949"];
            [amountLabel sizeToFit];
            
            [self.invoiceTableView addSubview:amountLabel];

            UILabel *moneyLabel = [[UILabel alloc] init];
            moneyLabel.text = @"XXXXX元";
            moneyLabel.font = [UIFont systemFontOfSize:16];
            moneyLabel.textColor = [UIColor colorWithHexString:@"#ff623d"];
            [moneyLabel sizeToFit];
            
            [self.invoiceTableView addSubview:moneyLabel];

            
            [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//               make
            }];
            
            
            
            
            
            
            
            
        }
            
            
            
            
            
        
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell2ID];
    
    return cell;
}

#pragma mark ---------  UITextViewDelegate  -------------

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"请填写备注 如代订机票,代订房费等"]) {
        textView.text = @"";
        textView.textColor = [UIColor colorWithHexString:@"c1c1c1"];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    if (textView.text == nil) {
        textView.textColor = [UIColor blackColor];
    }
}














































































































































































































































@end
