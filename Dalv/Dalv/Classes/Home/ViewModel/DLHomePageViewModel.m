//
//  DLHomePageViewModel.m
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomePageViewModel.h"
#import "DLHomeMenuItem.h"

@implementation DLHomePageViewModel

+ (NSArray *)creatMenuItems {
    return [self createItemsForManger:YES showContract:NO];
}

+ (NSArray *)createItemsForManger:(BOOL)isManager showContract:(BOOL)showContract {

    DLHomeMenuItem *memberLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"nav_2"] name:@"周边游" selector:NSSelectorFromString(@"didTapMemberLib")];
    DLHomeMenuItem *privateLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"domestic-travel"] name:@"出境游" selector:NSSelectorFromString(@"free-exercise")];
    DLHomeMenuItem *tempLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"nav_3"] name:@"特价" selector:NSSelectorFromString(@"didTapTempLib")];
    DLHomeMenuItem *liberumLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"nav_4"] name:@"自由行" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
    DLHomeMenuItem *remind = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"nav_5"] name:@"机票" selector:NSSelectorFromString(@"didTapRemind")];
    DLHomeMenuItem *search = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"domestic-travel"] name:@"国内游" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
    return @[memberLib, privateLib, tempLib, liberumLib,remind,search];
 }


@end
