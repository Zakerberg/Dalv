//
//  DLLineOrderContactsTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/24.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLPlaceLineOrderModel.h"

@interface DLLineOrderContactsTableViewCell : UITableViewCell
@property (strong,nonatomic) UITextField *contacsTextField;
@property (strong,nonatomic) UITextField *tellTextField;
@property (strong,nonatomic) UITextField *remarksTextField;

@property (nonatomic, strong) DLPlaceLineOrderModel *lineOrderoModel;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;


@end
