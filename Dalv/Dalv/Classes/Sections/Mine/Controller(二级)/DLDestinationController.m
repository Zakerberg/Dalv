//
//  DLDestinationController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLDestinationController.h"

@interface DLDestinationController ()

@property (weak, nonatomic) IBOutlet UITextField *destinationTF;
@end

@implementation DLDestinationController
- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)BtnClick:(id)sender {

    self.cityBlock(self.destinationTF.text);
    
    [self dismissViewControllerAnimated:YES completion:nil];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
