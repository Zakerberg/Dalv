//
//  DLLineOrderDetailXibController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderDetailXibController.h"
#import "DLLineOrderDetailModel.h"
#import "DLHomeViewTask.h"

@interface DLLineOrderDetailXibController ()

/*** 订单名称 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderNameLabel;
/*** 订单状态 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderStateLabel;
/*** 订单创建时间 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderCreatTimeLabel;
/*** 订单图片 ***/
@property (weak, nonatomic) IBOutlet UIImageView *lineOrderPicImageView;
/*** 订单成人数量 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderAdultCountLabel;
/*** 订单儿童数量 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderChildCountLabel;
/*** 订单团期时间 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderStartTimeLabel;
/*** 订单金额 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPriceTotaLabel;
/*** 订单调整金额 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPriceAdjustLabel;
/*** 订单应付金额 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPayableLabel;
/*** 订单特别说明 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderMemoLabel;


@property (nonatomic, strong) NSMutableArray *lineOrderDetailList;

//@property (nonatomic, strong) UITableView *lineOrderDetailTableView;





//边框成人和儿童的label

@property (weak, nonatomic) IBOutlet UILabel *adultBorderLabel;


@property (weak, nonatomic) IBOutlet UILabel *childBorderLabel;







@property(nonatomic,strong) DLLineOrderDetailModel * lineOrderDetailModel;








@end

@implementation DLLineOrderDetailXibController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
    [self setButton];
}

#pragma mark - ------------- setUI ----------------
-(void)setUI{
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"线路订单详情";
    
    self.adultBorderLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    self.adultBorderLabel.layer.borderWidth = 0.5f;
    self.adultBorderLabel.layer.masksToBounds = YES;
    
    self.childBorderLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    self.childBorderLabel.layer.borderWidth = 0.5f;
    self.childBorderLabel.layer.masksToBounds = YES;
    
    
}


#pragma mark - ------------- setButton ----------------
-(void)setButton{
    
    
}




#pragma mark - ------------- fetchData ----------------

-(void)fetchData{
    
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"tour_id":@"802",
                            @"sign_token" : [DLUtils getSign_token],
                            };
    @weakify(self);
    
    [DLHomeViewTask getAgencyLineOrderListDetails:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            
            
            NSDictionary *dict = result[@"list"];
            
            NSString *nameStr = dict[@"name"];
            
            NSString *stateStr = dict[@"state"];
            NSString *create_timeStr = dict[@"create_time"];
            NSString *memoStr = dict[@"memo"];
            NSString *price_payableStr = dict[@"price_payable"];
            
            NSString *client_adult_countStr = dict[@"client_adult_count"];
            NSString *client_child_countStr = dict[@"client_child_count"];
            NSString *start_timeStr = dict[@"start_time"];
            NSString *price_totalStr = dict[@"price_total"];
            NSString *price_adjustStr = dict[@"price_adjust"];
            
            NSString *pictureStr = dict[@"cover_pic"];
            
            
            if ([stateStr isEqualToString:@"1"]) {
                self.lineOrderStateLabel.text = @"未提交";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
            } else if ([stateStr isEqualToString:@"2"]){
                self.lineOrderStateLabel.text = @"已提交";
                self.lineOrderStateLabel.textColor = [UIColor colorWithHexString:@"#5fc82b"];
            }else if ([stateStr isEqualToString:@"3"]){
                self.lineOrderStateLabel.text = @"已确认待付款";

            }else if ([stateStr isEqualToString:@"4"]){
                self.lineOrderStateLabel.text = @"已取消";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
            }else if ([stateStr isEqualToString:@"5"]){
                self.lineOrderStateLabel.text = @"已关闭";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
            }else if ([stateStr isEqualToString:@"6"]){
                self.lineOrderStateLabel.text = @"已付预付款";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
            }else if ([stateStr isEqualToString:@"7"]){
                self.lineOrderStateLabel.text = @"已付全款";
                self.lineOrderStateLabel.textColor =  [UIColor colorWithHexString:@"#5fc82b"];
            }else if ([stateStr isEqualToString:@"8"]){
                self.lineOrderStateLabel.text = @"已退款";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
            }else if ([stateStr isEqualToString:@"9"]){
                self.lineOrderStateLabel.text = @"取消中";
                _lineOrderStateLabel.textColor = [UIColor redColor];
            }else if ([stateStr isEqualToString:@"10"]){
                self.lineOrderStateLabel.text = @"取消中,待退款(供应商确认";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
            }else if ([stateStr isEqualToString:@"11"]){
                self.lineOrderStateLabel.text = @"拒绝取消订单";
                self.lineOrderStateLabel.textColor= [UIColor redColor];
            }else if ([stateStr isEqualToString:@"12"]){
                self.lineOrderStateLabel.text = @"取消中,待退款(代理商管理确认)";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
            }else if ([stateStr isEqualToString:@"13"]){
                self.lineOrderStateLabel.text = @"已取消,已退款";
                self.lineOrderStateLabel.textColor = [UIColor redColor];
            }
            
            
            if ([memoStr isEqualToString:@""]){
                self.lineOrderMemoLabel.text = @"无";
                
            }
            
            NSURL *url = [NSURL URLWithString:pictureStr];
            
            [self.lineOrderPicImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
            
            self.lineOrderNameLabel.text = nameStr;
            
            self.lineOrderCreatTimeLabel.text = create_timeStr;
            

            self.lineOrderAdultCountLabel.text = client_adult_countStr;
        
            self.lineOrderChildCountLabel.text =client_child_countStr;
            
            
            self.lineOrderPriceTotaLabel.text = price_totalStr;
            self.lineOrderStartTimeLabel.text = start_timeStr;
            
            self.lineOrderPriceAdjustLabel.text = price_adjustStr;
            
            self.lineOrderPayableLabel.text = price_payableStr;
            
            NSArray *lineOrderDetailArray = [DLLineOrderDetailModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineOrderDetailList removeAllObjects];
            [self.lineOrderDetailList addObjectsFromArray:lineOrderDetailArray];
            
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
