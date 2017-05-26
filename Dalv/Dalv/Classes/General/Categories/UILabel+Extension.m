//
//  UILabel+Extension.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+(instancetype)blm_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    
    return label;
}

@end
