//
//  DLCityPickerView.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLBasePickerView.h"

@class DLCityPickerView;
@protocol  DLCityPickerViewDelegate<NSObject>
- (void)customPickView:(DLCityPickerView *)customPickView selectedTitle:(NSString *)selectedTitle;
@end

@interface DLCityPickerView : DLBasePickerView

@property (nonatomic, strong)NSMutableArray *dataArray;
@property(nonatomic, copy)NSString *defalutSelectRowStr;
@property(nonatomic, weak)id <DLCityPickerViewDelegate>delegate;

@end
