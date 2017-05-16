//
//  DLAlertView.h
//  Dalv
//
//  Created by Nie on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLAlertView : UIView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /**<>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;

+ (instancetype)alertViewWithMessage:(NSString *)message;
+ (instancetype)alertViewWithMessage:(NSString *)message customButtonTitle:(NSString *)title;

@property(nonatomic,assign) id /**<>*/ delegate;    // weak reference
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *message;   // secondary explanation text


- (void)show;

@end

@protocol MISAlertViewDelegate <NSObject>

- (void)dlAlertView:(DLAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;


@end
