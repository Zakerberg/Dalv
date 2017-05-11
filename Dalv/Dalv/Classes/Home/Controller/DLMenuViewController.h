//
//  DLMenuViewController.h
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLMenuViewController : UIViewController

/**
 *  应用中心内容高度
 */
- (CGFloat)contentHeight;

/**
 *  加载完成
 */
@property (nonatomic, copy) void (^didCompleteLoad)();


@end
