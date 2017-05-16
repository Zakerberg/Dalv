//
//  BLMCityTableViewCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "BLMCityTableViewCell.h"
#define  ScreenWidth [UIScreen mainScreen].bounds.size.width
@implementation BLMCityTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cityArray:(NSArray*)array
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _cityArray =array;
        self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0  blue:245/255.0  alpha:1];
        for(int i=0;i<array.count;i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.center = CGPointMake(ScreenWidth/6+(ScreenWidth/3-10)*(i%3), 30+(30+15)*(i/3));
            btn.tag = i;
            btn.bounds = CGRectMake(0, 0, ScreenWidth/3-30, 35);
            [btn setTitleColor:[UIColor colorWithRed:54/255.0 green:54/255.0 blue:54/255.0 alpha:1] forState:0];
            [btn setTitle:array[i] forState:0];
            [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [btn setBackgroundColor:[UIColor whiteColor]];
            [self addSubview:btn];
            btn.layer.borderWidth = 0.5;
            btn.layer.borderColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1].CGColor;
        }
    }
    return self;
}
-(void)click:(UIButton *)btn
{
    if(_cityArray.count==1&btn.tag==0)
    {
        self.didSelectedBtn(1111);
    }
    else
    {
        self.didSelectedBtn((int)btn.tag);
    }
}
@end
