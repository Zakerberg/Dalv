//
//  BLM_UploadUserIcon.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

// ** 宏定义单例模式方便外界调用 ** //
#define UPLOAD_IMAGE [BLM_UploadUserIcon shareUploadImage]

// ** 代理方法
@protocol BLM_UploadUserIconDelegate <NSObject>

@optional
// ** 处理图片的方法
- (void)uploadImageToServerWithImage:(UIImage *)image;

@end

/*  ==============================================================  */

@interface BLM_UploadUserIcon : NSObject <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) id <BLM_UploadUserIconDelegate> uploadImageDelegate;
@property(nonatomic,strong) UIViewController * fatherViewController;

// ** 单例方法
+ (BLM_UploadUserIcon *)shareUploadImage;

// ** 弹出选项窗口的方法
- (void)showActionSheetInFatherViewController:(UIViewController *)fatherVC delegate:(id <BLM_UploadUserIconDelegate> )aDelegate;


@end



