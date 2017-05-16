//
//  BLMCustomSearchView.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomSearchViewDelegate <NSObject>

-(void)searchBeginEditing;
-(void)didSelectCancelBtn;
-(void)searchString:(NSString *)string;
@end

@interface BLMCustomSearchView : UIView<UISearchBarDelegate>
@property (nonatomic,retain)UISearchBar *searchBar;
@property (nonatomic,retain)UIButton *cancelBtn;
@property (nonatomic,assign) id <CustomSearchViewDelegate>delegate;
@end
