//
//  DLShareView.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/12.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UMSocial.h"

@interface DLShareView : UIView

+(instancetype)shareViewWithPresentedViewController:(UIViewController *)controller items:(NSArray *)items title:(NSString *)title image:(UIImage *)image urlResource:(NSString *)url;

@end
