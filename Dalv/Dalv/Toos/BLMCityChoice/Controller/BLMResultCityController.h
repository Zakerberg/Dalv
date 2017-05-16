//
//  BLMResultCityController.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ResultCityControllerDelegate <NSObject>

-(void)didScroll;
-(void)didSelectedString:(NSString *)string;

@end
@interface BLMResultCityController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)NSMutableArray *dataArray;
@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,assign) id <ResultCityControllerDelegate>delegate;
@end
