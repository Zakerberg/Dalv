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
@property (nonatomic, strong) UILabel *accountNamelab;//开户名
@property (nonatomic, strong) UILabel *accountNumberlab;//账号
@property (nonatomic, strong) UILabel *openingBanklab;//开户行
@property (nonatomic, strong) DLBankTransferModel *bankTransferModel;
@property (nonatomic,strong) UIView *bankbackview;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

/**
 *  配置Cell 数据
 */
- (void)configureCell:(DLBankTransferModel *)bankModel;

@end
