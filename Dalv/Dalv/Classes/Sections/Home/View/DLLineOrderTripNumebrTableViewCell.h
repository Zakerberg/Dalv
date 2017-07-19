//
//  DLLineOrderTripNumebrTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLAddReduceButton.h"
@interface DLLineOrderTripNumebrTableViewCell : UITableViewCell

@property(nonatomic, strong)UIButton *reduceBtn;
@property(nonatomic, strong)UITextField *countTextField;
@property(nonatomic, strong)UIButton *addBtn;
@property(nonatomic, strong)UIButton *reduceBtn1;
@property(nonatomic, strong)UITextField *countTextField1;
@property(nonatomic, strong)UIButton *addBtn1;
@property(nonatomic,strong) DLAddReduceButton * adultButton;
@property(nonatomic,strong) DLAddReduceButton * childButton;

+ (NSString *)cellIdentifier;

@end
