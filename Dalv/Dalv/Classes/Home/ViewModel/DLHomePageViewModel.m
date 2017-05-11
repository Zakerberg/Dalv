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

    DLHomeMenuItem *memberLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"icon_search"] name:@"周边游" selector:NSSelectorFromString(@"didTapMemberLib")];
    DLHomeMenuItem *privateLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"icon_search"] name:@"出境游" selector:NSSelectorFromString(@"didTapPrivateLib")];
    DLHomeMenuItem *tempLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"icon_search"] name:@"特价" selector:NSSelectorFromString(@"didTapTempLib")];
    DLHomeMenuItem *liberumLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"icon_search"] name:@"自由行" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
    DLHomeMenuItem *remind = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"icon_search"] name:@"机票" selector:NSSelectorFromString(@"didTapRemind")];
    DLHomeMenuItem *search = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"icon_search"] name:@"国内游" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
    return @[memberLib, privateLib, tempLib, liberumLib,remind,search];
 }


@end
