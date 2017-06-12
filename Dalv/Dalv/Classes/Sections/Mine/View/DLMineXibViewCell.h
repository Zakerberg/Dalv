//
//  DLMineXibViewCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLMineXibViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UIButton *changeCityBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UIButton *passCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *passCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *determainPasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *positionTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;

@end
