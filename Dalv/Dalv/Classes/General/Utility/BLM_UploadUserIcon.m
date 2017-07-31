//
//  BLM_UploadUserIcon.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "BLM_UploadUserIcon.h"
#import "DLMineCenterController.h"
static BLM_UploadUserIcon *uploadUserIcon = nil;

@implementation BLM_UploadUserIcon

/*  ============================================================  */
#pragma mark - 单例方法
+ (BLM_UploadUserIcon *)shareUploadImage {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        uploadUserIcon = [[BLM_UploadUserIcon alloc] init];
    });
    return uploadUserIcon;
}

/*  ============================================================  */
#pragma mark - 显示ActionSheet方法
- (void)showActionSheetInFatherViewController:(UIViewController *)fatherVC delegate:(id<BLM_UploadUserIconDelegate>)aDelegate {
    
    uploadUserIcon.uploadImageDelegate = aDelegate;
    self.fatherViewController = fatherVC;
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"相册", @"拍照", nil];
    [sheet showInView:fatherVC.view];

}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self fromPhotos];
    }else if (buttonIndex == 1) {
        [self createPhotoView];
    }
}

/*  ============================================================  */
#pragma mark - 头像图片(从相机中选择得到)
- (void)createPhotoView {
    // ** 设置相机模式
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
        imagePC.sourceType  = UIImagePickerControllerSourceTypeCamera;
        imagePC.delegate = self;
        imagePC.allowsEditing = YES;
        [_fatherViewController presentViewController:imagePC animated:YES completion:nil];
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                         message:@"该设备没有照相机"
                                                        delegate:nil
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alert show];
    }
}

/*  ============================================================  */
#pragma mark - 图片库方法(从手机的图片库中查找图片)
- (void)fromPhotos {
    UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
    imagePC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePC.delegate = self;
    imagePC.allowsEditing = YES;
    [_fatherViewController presentViewController:imagePC animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    // ** 上传用户头像
    if (self.uploadImageDelegate && [self.uploadImageDelegate respondsToSelector:@selector(uploadImageToServerWithImage:)]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        [self.uploadImageDelegate uploadImageToServerWithImage:image];
    }
}

@end
