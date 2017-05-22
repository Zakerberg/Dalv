//
//  DLActionSheet.h
//  Dalv
//
//  Created by Nie on 2017/5/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidSelectActionSheetCompledBlock)(NSInteger buttonIndex);

@protocol DLActionSheetDelegate;

@interface DLActionSheet : UIView

@property (nonatomic, strong ,readonly) NSArray *titlesArray;
@property (nonatomic, strong ,readonly) NSArray *keysArray;

@property (nonatomic, copy ,readonly) NSString *actionSheetTitle;
@property (nonatomic, copy ,readonly) NSString *cancelButtonTitle;

@property (nonatomic, weak) id <DLActionSheetDelegate> delegate;

@property (nonatomic, copy) DidSelectActionSheetCompledBlock didSelectActionSheetCompled;

// 适用于代理初始化
- (instancetype)initWithTitle:(NSString *)title delegate:(id<DLActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles otherButtonKeys:(NSArray *)otherButtonKeys;

- (void)show;

// 适用于块代码初始化
- (instancetype)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles otherButtonKeys:(NSArray *)otherButtonKeys;

@end

// 代理回调
@protocol DLActionSheetDelegate <NSObject>

- (void)DLActionSheet:(DLActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex clickedButtonTitle:(NSString *)title clickedButtonKey:(NSString *)key;


@end
