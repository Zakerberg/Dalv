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
    self.minimumInteritemSpacing = 1;
    self.minimumLineSpacing = 1;
    self.sectionInset = UIEdgeInsetsMake(0, 0, 16, 0);
}

@end
