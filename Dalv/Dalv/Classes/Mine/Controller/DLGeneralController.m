//
//  DLGeneralController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLGeneralController.h"
#import "BLM_UploadUserIcon.h"

@interface DLGeneralController () <BLM_UploadUserIconDelegate>

@end

@implementation DLGeneralController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];
}

#pragma mark - 代理方法
- (void)uploadImageToServerWithImage:(UIImage *)image {
    
}



@end
