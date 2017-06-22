//
////
////  DLLineOrderViewCell.m
////  Dalv
////
////  Created by Michael 柏 on 2017/6/13.
////  Copyright © 2017年 Michael 柏. All rights reserved.
////
//
//#import "DLLineOrderViewCell.h"
//
//
//@interface DLLineOrderViewCell ()
//
///**  应付金额label  黑体字  **/
//@property(nonatomic,strong) UILabel *amountLabel;
//
//@end
//
//@implementation DLLineOrderViewCell
//
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    
//    // Configure the view for the selected state
//}
//
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        [self setupCellSubviews];
//    }
//    return self;
//}
//
//- (void)setupCellSubviews {
//
//    _picture = [[UIImageView alloc] init];
//    
//    [self.contentView addSubview:_picture];
//    
//    
//    _nameLabel = [[UILabel alloc] init];
//    _nameLabel.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
//    _nameLabel.textAlignment = NSTextAlignmentLeft;
//    _nameLabel.font = [UIFont systemFontOfSize:14];
//    _nameLabel.text = @"XXXXXXXXX-XXXXX";
//    
//    [self.contentView addSubview:_nameLabel];
//    
//    
//    _timeLabel = [[UILabel alloc] init];
//    _timeLabel.textColor = [UIColor colorWithHexString:@"#a5a5a5"];
//    _timeLabel.textAlignment = NSTextAlignmentLeft;
//    _timeLabel.font = [UIFont systemFontOfSize:12];
//    _timeLabel.text = @"2017-5-21";
//
//    [self.contentView addSubview:_timeLabel];
//    
//    
//    _amountLabel = [[UILabel alloc] init];
//    
//    _amountLabel.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
//    _amountLabel.textAlignment = NSTextAlignmentLeft;
//    _amountLabel.font = [UIFont systemFontOfSize:12];
//    _amountLabel.text = @"2017-5-21";
//    
//    [self.contentView addSubview:_amountLabel];
//    
//}
//
///** Cell 重用ID */
//+(NSString *)cellIdentifier{
//    
//    return NSStringFromClass([self class]);
//}
//
///**
// *  配置Cell 数据
// */
////- (void)configureCell:(DLlineOrderModel *)invoiceRecordModel{
//
//    
//    /*
//     if ([invoiceRecordModel.state isEqualToString:@"1"]) {
//     self.invoiceTypeLabel.text = @"未审核";
//     _invoiceTypeLabel.textColor = [UIColor redColor];
//     } else if ([invoiceRecordModel.state isEqualToString:@"2"]){
//     self.invoiceTypeLabel.text = @"审核通过";
//     _invoiceTypeLabel.textColor = [UIColor colorWithHexString:@"#5fc82b"];
//     }else if ([invoiceRecordModel.state isEqualToString:@"3"]){
//     self.invoiceTypeLabel.text = @"审核失败";
//     _invoiceTypeLabel.textColor = [UIColor redColor];
//     }
//     */
////}
//
//
///**
// *  配置Cell 数据
// */
//- (void)configureCell:(DLlineOrderModel *)lineOrderModel{
//    
//    if ([lineOrderModel.state isEqualToString:@"1"]) {
//        
//    }
//    
//}
//
//
//
//
//
//@end
