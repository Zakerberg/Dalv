//
//  DLRoutePricingTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLRoutePricingTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *dateImageView;//团期图片
@property (nonatomic, strong) UILabel *groupDatelab;//团期
@property (nonatomic, strong) UILabel *datelab;//日期
@property (nonatomic, strong) UILabel *adultPricelab;//成人价
@property (nonatomic, strong) UILabel *childPricelab;//儿童价
@property (nonatomic, strong) UILabel *roomDifferencelab;//单房差

@property (strong,nonatomic) UITextField *adultPriceTextField;//修改成人价
@property (strong,nonatomic) UITextField *childPriceTextField;//修改儿童价
@property (strong,nonatomic) UITextField *roomDifferenceTextField;//修改单房差
@property (nonatomic, strong) UIButton *preservationBtn;//保存


/** Cell 重用ID */
+ (NSString *)cellIdentifier;

@end
