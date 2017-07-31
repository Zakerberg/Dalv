//
//  DLMyRemmendModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/4.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLMyRemmendModel : NSObject

/*
 "name": "十里桃花双飞五",             推荐线路名称
 "id": "205",						  推荐存储id
 "min_price": "299000",				  线路价格
 "cover_pic": "http://file1.lydlr.com/c/240/160/tour/2017/0416/00434732682.jpg",  图片
 "tour_id": "4379"                      线路id
 */

@property(nonatomic,copy) NSString *lineId;/// 线路id
@property(nonatomic,copy) NSString *name;/// 推荐线路名称
@property(nonatomic,copy) NSString *min_price; ///线路价格
@property(nonatomic,copy) NSString *cover_pic;///图片
@end
