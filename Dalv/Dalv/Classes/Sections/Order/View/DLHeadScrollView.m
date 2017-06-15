//
//  DLHeadScrollView.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHeadScrollView.h"

#define BTNWIDTH 107.0
#define ImageHEIGHT 18.0
@interface DLHeadScrollView ()
{
    int _currentIndex;
}
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation DLHeadScrollView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headArray = @[@"线路订单",@"签证订单",@"wifi订单",@"门票订单"];
        self.showsHorizontalScrollIndicator = NO;
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    self.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    self.contentSize = CGSizeMake(BTNWIDTH*self.headArray.count, 0);
    self.bounces = NO;
    
    [self createBtn];
}

-(void)createBtn{
    
    
    for (int i = 0; i < [self.headArray count]; i++) {
        
//        NSArray *nameArr = @[
//                         @"line_order",
//                         @"visa_order",
//                         @"wifi_order",
//                         @"ticket_order"
//                         ];
//        
//        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
//        UIImageView *imageV = [[UIImageView alloc] init];
//        
//        
//        for (int i = 0; i <[self.headArray count]; i++) {
//            
//            imageV.frame = CGRectMake(16+ BTNWIDTH*i , ImageHEIGHT, BTNWIDTH, ImageHEIGHT);
//            
//            [imageV setImage:[UIImage imageNamed:nameArr[i]]];
//        }
        
        button.frame = CGRectMake(0 + BTNWIDTH*i, 0, BTNWIDTH, 48);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:[self.headArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"#9b9b9b"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"#4d65f3"] forState:UIControlStateSelected];
        
        if (i == 0) {
            [button setTitleColor:[UIColor colorWithHexString:@"9b9b9b"] forState:UIControlStateNormal];
        }
        button.tag = i + 100;
        [button addTarget:self action:@selector(didClickHeadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}
-(void)didClickHeadButtonAction:(UIButton *)btn{
    
    _currentIndex = (int)btn.tag;
    [self changeBtnTitleColorWith:_currentIndex];
    
    if ([self.seletedDelegate respondsToSelector:@selector(seletedControllerWith:)]) {
        
        [self.seletedDelegate seletedControllerWith:btn];
    }
}
-(void)changeBtnTitleColorWith:(int)tag{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            if (obj.tag == tag) {
                [obj setTitleColor:[UIColor colorWithHexString:@"4d47ee"] forState:UIControlStateNormal];
                if (obj.frame.origin.x>=MAIN_SCREEN_WIDTH/2&&obj.frame.origin.x<=self.contentSize.width-MAIN_SCREEN_WIDTH/2) {
                    [UIView animateWithDuration:.5 animations:^{
                        self.contentOffset = CGPointMake(obj.frame.origin.x-MAIN_SCREEN_WIDTH/2+20, 0);
                        obj.titleLabel.font = [UIFont systemFontOfSize:14];
                    }];
                }
                if (obj.frame.origin.x<MAIN_SCREEN_WIDTH/2) {
                    [UIView animateWithDuration:.5 animations:^{
                        self.contentOffset = CGPointMake(0, 0);
                        obj.titleLabel.font = [UIFont systemFontOfSize:14];
                    }];
                }
            }else{
                [obj setTitleColor:[UIColor colorWithHexString:@"#9b9b9b"] forState:UIControlStateNormal];
                obj.titleLabel.font = [UIFont systemFontOfSize:14];
            }
        }
    }];
}

@end
