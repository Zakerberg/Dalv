//
//  TLCity.h
//  TLCityPickerDemo
//
//  Created by NieYL on 15/11/5.
//  Copyright © 2015年 NieYL. All rights reserved.
//

#import "TLCity.h"

@implementation TLCity

@end

#pragma mark - TLCityGroup
@implementation TLCityGroup

- (NSMutableArray *) arrayCitys
{
    if (_arrayCitys == nil) {
        _arrayCitys = [[NSMutableArray alloc] init];
    }
    return _arrayCitys;
}

@end
