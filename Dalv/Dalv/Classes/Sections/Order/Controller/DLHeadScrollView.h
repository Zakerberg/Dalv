//
//  DLHeadScrollView.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol seletedControllerDelegate <NSObject>

-(void)seletedControllerWith:(UIButton *)btn;


@end

@interface DLHeadScrollView : UIScrollView
@property (nonatomic ,strong)NSArray *headArray;
@property (nonatomic ,weak)id<seletedControllerDelegate> seletedDelegate;
-(void)changeBtnTitleColorWith:(int)tag;
@end
