//
//  DLAlertView.h
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidSelectAlertViewCompledBlock)(NSInteger buttonIndex);

@protocol DLAlertViewDelegate;

@interface DLAlertView : UIView

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *message;

@property(nonatomic,weak) id <DLAlertViewDelegate> delegate;

@property (nonatomic, copy) DidSelectAlertViewCompledBlock didSelectAlertViewCompled;

// 适用于代理初始化
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id <DLAlertViewDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;

// 类方法初始化
+ (instancetype)alertViewWithMessage:(NSString *)message;
+ (instancetype)alertViewWithMessage:(NSString *)message customButtonTitle:(NSString *)title;

- (void)show;

// 适用于块代码初始化
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;
@end

// 代理回调
@protocol DLAlertViewDelegate <NSObject>

- (void)DLAlertView:(DLAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
