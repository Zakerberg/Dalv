//
//  DLinvoiceApplySection0Cell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLinvoiceApplySection0Cell : UITableViewCell

/***  发票抬头 TF ***/
@property(nonatomic,strong) UITextField *companyTF;

/***  发票项目 Btn ***/
@property(nonatomic,strong) UIButton *projctButton;

/***  发票备注TV ***/
@property(nonatomic,strong) UITextView* noteTextView;

/***  剩余发票额度Label ***/
@property(nonatomic,strong)UILabel *moneyLabel;

@end
