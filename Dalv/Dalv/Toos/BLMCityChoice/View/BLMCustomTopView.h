//
//  BLMCustomTopView.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomTopViewDelegate <NSObject>

-(void)didSelectBackButton;

@end

@interface BLMCustomTopView : UIView
@property (nonatomic,assign) id <CustomTopViewDelegate>delegate;
@end
