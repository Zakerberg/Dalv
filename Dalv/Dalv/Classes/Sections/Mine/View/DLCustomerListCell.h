//
//  DLCustomerListCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLCustomerListCell : UITableViewCell
/* 直客头像 */
@property (weak, nonatomic) IBOutlet UIImageView *customerAvatarImageV;
/* 直客名称 */
@property (weak, nonatomic) IBOutlet UILabel *customerNameLabel;
/* 直客电话 */
@property (weak, nonatomic) IBOutlet UILabel *customerNumLabel;
/* 直客时间 */
@property (weak, nonatomic) IBOutlet UILabel *customerTimeLabel;
@end
