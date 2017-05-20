//
//  DLGenralModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLGenralModel : NSObject
@property(nonatomic,copy)NSString * pic;
@property(nonatomic,copy)NSString * title;

+(instancetype)MineModelWithDict:(NSDictionary *)dict;


@end
