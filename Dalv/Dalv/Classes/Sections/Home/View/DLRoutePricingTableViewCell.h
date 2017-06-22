//
//  DLRoutePricingTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineModificationModel.h"
@protocol  LineModificationDelegate <NSObject>
- (void)preservationBtnClickDelegateWithAdultprice:(NSString*)adultprice Childpriced:(NSString*)childprice Roomdifference:(NSString*)roomdifference;
@end


@interface DLRoutePricingTableViewCell : UITableViewCell

@property (nonatomic, weak) id <LineModificationDelegate>delegate;

@property (nonatomic, strong) UIImageView *dateImageView;//团期图片
@property (nonatomic, strong) UILabel *groupDatelab;//团期
@property (nonatomic, strong) UILabel *datelab;//日期
@property (nonatomic, strong) UILabel *adultPricelab;//成人价
@property (nonatomic, strong) UILabel *childPricelab;//儿童价
@property (nonatomic, strong) UILabel *roomDifferencelab;//单房差

@property (strong,nonatomic) UITextField *adultPriceTextField;//修改成人价
@property (strong,nonatomic) UITextField *childPriceTextField;//修改儿童价
@property (strong,nonatomic) UITextField *roomDifferenceTextField;//修改单房差
@property (strong,nonatomic) UIButton *preservationBtn;//保存
@property (nonatomic, strong) DLLineModificationModel *modificationModel;

/** 配置Cell */
- (void)configureCell:(LineModificationList *)lineModificationModel;


/** Cell 重用ID */
+ (NSString *)cellIdentifier;

@end
