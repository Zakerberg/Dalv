//
//  DLSalertView.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DLSalertViewDelegate <NSObject>

-(void)requestEventAction:(UIButton *)button;

@end

@interface DLSalertView : UIView

@property(nonatomic,strong)UITextField *firstField;
@property(nonatomic,weak)id <DLSalertViewDelegate> delegate;

-(void)showView;
-(void)closeView;

@end
