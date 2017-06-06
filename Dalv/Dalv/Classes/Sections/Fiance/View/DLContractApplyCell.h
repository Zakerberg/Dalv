//
//  DLContractApplyCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLContractApplyCell : UITableViewCell

/*  一  */
@property(nonatomic, strong)UIButton *addBtn;
@property(nonatomic, strong)UIButton *reduceBtn;
@property(nonatomic, strong)UITextField *countTextField;

/*  二  */
@property(nonatomic, strong)UIButton *addBtn1;
@property(nonatomic, strong)UIButton *reduceBtn1;
@property(nonatomic, strong)UITextField *countTextField1;

/*  三  */
@property(nonatomic, strong)UIButton *addBtn2;
@property(nonatomic, strong)UIButton *reduceBtn2;
@property(nonatomic, strong)UITextField *countTextField2;

/** 重用ID */
+ (NSString *)cellIdentifier;

@end
