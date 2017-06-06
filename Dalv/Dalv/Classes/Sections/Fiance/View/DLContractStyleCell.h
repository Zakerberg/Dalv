//
//  DLContractStyleCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol contractStyleCellDelegate <NSObject>

-(void)seletedControllerWith:(UIButton *)btn;
@end

@interface DLContractStyleCell : UITableViewCell
@property (nonatomic ,weak)id <contractStyleCellDelegate> seletedDelegate;
@end
