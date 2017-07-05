//
//  TLCity.h
//  TLCityPickerDemo
//
//  Created by NieYL on 15/11/5.
//  Copyright © 2015年 NieYL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLCityPickerDelegate.h"

@interface TLCityPickerSearchResultController : UITableViewController <UISearchResultsUpdating>

@property (nonatomic, assign) id<TLSearchResultControllerDelegate>searchResultDelegate;

@property (nonatomic, strong) NSArray *cityData;

@end
