//
//  DLBankTransferTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLBankTransferModel.h"
@interface DLBankTransferTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *accountNamelab;
@property (nonatomic, strong) UILabel *accountNumberlab;
@property (nonatomic, strong) UILabel *openingBanklab;
@property (nonatomic, strong) DLBankTransferModel *bankTransferModel;
@property (nonatomic,strong) UIView *bankbackview;
+ (NSString *)cellIdentifier;
- (void)configureCell:(DLBankTransferModel *)bankModel;

@end
