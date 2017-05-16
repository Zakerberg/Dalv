//
//  DLHUDManager.h
//  Dalv
//
//  Created by Nie on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLHUDManager : NSObject

+ (DLHUDManager *)sharedInstance;

- (void)showTipAlertViewWithText:(NSString *)message;

- (void)showTextOnly:(NSString *)text;

- (void)showTextOnly:(NSString *)text
              onView:(UIView *)view;

- (void)showTextOnly:(NSString *)text
              onView:(UIView *)view
       withDelayTime:(NSTimeInterval)delay;

- (void)showTextOnlyWithNoEnabled:(NSString *)text
                           onView:(UIView *)view;

- (void)showTextTips:(NSString *)text
              onView:(UIView *)view
          withOffset:(CGFloat)offSet
       withDelayTime:(CGFloat)time;

- (void)showTipsWithMutText:(NSString *)text
                     onView:(UIView *)view
                 withOffset:(CGFloat)offSet;

- (void)showWithCustomView:(NSString *)text
                    onView:(UIView *)view;

- (void)showProgressWithText:(NSString *)text;

- (void)showProgressWithText:(NSString *)text
                      OnView:(UIView *)view;

- (void)showProgressOnView:(UIView *)superView
                      text:(NSString *)text
                     close:(BOOL)isCanClose;

- (void)hiddenHUD;

@end
