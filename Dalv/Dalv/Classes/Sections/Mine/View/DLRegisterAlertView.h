//
//  DLRegisterAlertView.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/19.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ToRegisterVCStr)(NSString *toRegisterVCStr);
@interface DLRegisterAlertView : UIView
@property(nonatomic,strong) ToRegisterVCStr toRegisterVCStr;
@end
