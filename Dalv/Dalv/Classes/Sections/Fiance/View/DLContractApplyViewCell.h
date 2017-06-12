//
//  DLContractApplyViewCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DLAddReduceButton.h"

@interface DLContractApplyViewCell : UITableViewCell
@property(nonatomic,strong) DLAddReduceButton * button;
@property(nonatomic,strong) DLAddReduceButton * button1;

@property(nonatomic, strong)UITextField *countTextField;
@property(nonatomic, strong)UITextField *countTextField1;
@property(nonatomic, strong)UITextField *countTextField2;

@end
