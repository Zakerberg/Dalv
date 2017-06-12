//
//  DLLoginView.h
//  Dalv
//
//  Created by Nie on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  DLLoginViewDelegate <NSObject>

- (void)loginBtnClickDelegateWithUsename:(NSString*)usename Password:(NSString*)password;

@end

@interface DLLoginView : UIView
@property (strong, nonatomic) UITextField *loginIdTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (nonatomic, weak) id <DLLoginViewDelegate>delegate;
@end
