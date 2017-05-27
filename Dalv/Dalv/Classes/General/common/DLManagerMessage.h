//
//  DLManagerMessage.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLManagerMessage : NSObject
+ (instancetype)sharedMessage;

@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *sign_token;
@property(nonatomic,copy)NSString *ids;
@end
