//
//  BLMPickerView.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BLMPickerDelegate <NSObject>

@optional
- (void)PickerSelectorIndixString:(NSString *)str;
@end

typedef NS_ENUM(NSInteger, ARRAYTYPE) {
    GenderArray,
    WorkTimeArray
};

@interface BLMPickerView : UIView
@property (nonatomic, assign) ARRAYTYPE arrayType;
@property (nonatomic, strong) NSArray *customArr;
@property (nonatomic,strong)UILabel *selectLb;
@property (nonatomic,weak)id <BLMPickerDelegate> delegate;
@end
