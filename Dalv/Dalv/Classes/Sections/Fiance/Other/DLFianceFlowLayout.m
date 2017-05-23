//
//  DLFianceFlowLayout.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFianceFlowLayout.h"

@implementation DLFianceFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    // 设置行列间距
    self.minimumLineSpacing = 1 / [UIScreen mainScreen].scale;
    self.minimumInteritemSpacing = 0;
    // 设置每一组的尾部间距
    self.sectionInset = UIEdgeInsetsMake(0, 0, 16, 0);
    
}

@end
