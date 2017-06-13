//
//  DLinvoiceApplySection0Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLinvoiceApplySection0Cell.h"

@interface DLinvoiceApplySection0Cell ()

@end

@implementation DLinvoiceApplySection0Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
    }
    return self;
}


-(void)setupCellSubviews {
    
    UILabel *companyLabel = [[UILabel alloc]init];
    companyLabel.text = @"发票抬头";
    companyLabel.font = [UIFont systemFontOfSize:16];
    companyLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    [companyLabel sizeToFit];
    [self.contentView addSubview:companyLabel];
    
    
    UITextField *companyTF = [[UITextField alloc] init];
    self.companyTF = companyTF;
    companyTF.placeholder = @"请输入公司名称";
    companyTF.borderStyle = UITextBorderStyleNone;
    
    [self.contentView addSubview:companyTF];
    
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
    
    [self.contentView addSubview:line];
    
    UILabel *projectLabel = [[UILabel alloc]init];
    projectLabel.text = @"发票项目";
    projectLabel.font = [UIFont systemFontOfSize:16];
    projectLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    [projectLabel sizeToFit];
    [self.contentView addSubview:projectLabel];

    UIButton *projctButton = [[UIButton alloc] init];
    self.projctButton = projctButton;
    projctButton.titleLabel.font = [UIFont systemFontOfSize: 15];
//    [projctButton setTitle:@"" forState:UIControlStateNormal];
    [projctButton setTitleColor:[UIColor colorWithHexString:@"#c1c1c1"]forState:UIControlStateNormal];

    projctButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    [self.contentView addSubview:projctButton];
    
    
    UIImageView *imageV = [[UIImageView alloc] init];
    [imageV setImage:[UIImage imageNamed:@"arrowhead_left"]];
    
    [self.contentView addSubview:imageV];
    
    
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
    
    [self.contentView addSubview:line1];

    UILabel *noteLabel = [[UILabel alloc]init];
    
    noteLabel.text = @"发票备注";
    noteLabel.font = [UIFont systemFontOfSize:16];
    noteLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    [noteLabel sizeToFit];
    
    [self.contentView addSubview:noteLabel];
    
    UITextView *noteTextView = [[UITextView alloc] init];
    self.noteTextView = noteTextView;
    
    noteTextView.font = [UIFont systemFontOfSize:15];
    noteTextView.textColor = [UIColor colorWithHexString:@"#c1c1c1"];
//    noteTextView.text = @"请填写备注 如代订机票等";
    
    [self.contentView addSubview:noteTextView];
    
    
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
    
    [self.contentView addSubview:line2];
    
    UILabel *amountLabel = [[UILabel alloc]init];
    amountLabel.text = @"剩余发票额度:";
    amountLabel.font = [UIFont systemFontOfSize:16];
    amountLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    [amountLabel sizeToFit];
    
    [self.contentView addSubview:amountLabel];
    
    UILabel *moneyLabel = [[UILabel alloc] init];
    self.moneyLabel = moneyLabel;
    moneyLabel.text = @"XXXXX元";
    moneyLabel.font = [UIFont systemFontOfSize:15];
    moneyLabel.textColor = [UIColor colorWithHexString:@"#ff623d"];
    [moneyLabel sizeToFit];
    
    [self.contentView addSubview:moneyLabel];

    [companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.height.equalTo(@15);
    }];

    [companyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(companyLabel.mas_centerY).offset(0);
        make.height.offset(44);
        make.width.offset(MAIN_SCREEN_WIDTH-10);
        make.left.equalTo(companyLabel.mas_right).offset(15);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(1);
        make.left.right.offset(0);
        make.top.equalTo(companyLabel.mas_bottom).offset(15);
    }];
    

    [projectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(@15);
        make.top.equalTo(line.mas_bottom).offset(15);
    }];
    

    [projctButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(projectLabel.mas_centerY);
        make.height.offset(44);
        make.right.offset(0);
        make.left.equalTo(projectLabel.mas_right).offset(15);
    }];
    
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(projctButton.mas_centerY).offset(0);
        make.height.with.offset(20);
        make.right.equalTo(self.mas_right).offset(-12);
    }];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(1);
        make.left.right.offset(0);
        make.top.equalTo(projectLabel.mas_bottom).offset(15);
    }];
    
    [noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(@15);
        make.top.equalTo(line1.mas_bottom).offset(15);
    }];
    
    [noteTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@70);
        make.left.equalTo(noteLabel.mas_right).offset(15);
        make.top.equalTo(line1.mas_bottom).offset(5);
        make.right.offset(0);
    }];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(1);
        make.left.right.offset(0);
        make.top.equalTo(noteTextView.mas_bottom).offset(15);
    }];
    
    [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(@15);
        make.top.equalTo(line2.mas_bottom).offset(15);
    }];
    
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(amountLabel.mas_centerY).offset(0);
        make.height.offset(32);
        make.left.equalTo(amountLabel.mas_right).offset(15);
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
