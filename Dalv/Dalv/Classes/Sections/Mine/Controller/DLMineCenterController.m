//
//  DLMineCenterController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLCustomerChangePersonDataController.h"
#import "DLPersonalChangeDataController.h"
#import "DLMyAgencyUnBindingController.h"
#import "DLMyCustomerXibController.h"
#import "DLSupplierQueryController.h"
#import "DLMyCustomerController.h"
#import "DLMineCenterController.h"
#import "DLLineQueryController.h"
#import "DLMyAgencyController.h"
#import "UIImage+ZipAndLength.h"
#import "DLRemmendController.h"
#import "DLGeneralController.h"
#import "BLM_UploadUserIcon.h"
#import "UIButton+WebCache.h"

@interface DLMineCenterController ()<UITableViewDelegate,UITableViewDataSource,BLM_UploadUserIconDelegate>

@property (nonatomic,strong) NSMutableDictionary *mineCenterDict;
@property (strong,nonatomic) UITableView* tableView;
@property (strong,nonatomic) UILabel* nameLabel;
@property (nonatomic,strong) UIImageView *headerView;
@property (strong,nonatomic) UILabel* numLabel;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) NSString *bindingStr;/// 绑定状态
@end

static NSString *cellID  = @"cellID";
@implementation DLMineCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setupHeaderView];
    [self fetchData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeDataNoti:) name:@"changeData" object:nil];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (BOOL)prefersStatusBarHidden{
    
    return YES;
}

-(void)changeDataNoti:(NSNotification *)notification

{
   
    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setTableView
{
    UITableView*tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.tableFooterView = [UIView new];
    tableView.delegate = self ;
    tableView.dataSource = self ;
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

-(void)setupHeaderView{
    
    UIImageView *headerView = [[UIImageView alloc] init];
    self.tableView.tableHeaderView = headerView;
    [headerView setImage:[UIImage imageNamed:@"backImage"]];
    [self.tableView addSubview:headerView];
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(0);
        make.width.offset(0);
        make.height.offset(145);
    }];
    
    UIImageView *personImageView = [[UIImageView alloc] init];
    self.personImageView = personImageView;
    personImageView.userInteractionEnabled = YES;
    [self.tableView addSubview:personImageView];
    [personImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.top.equalTo(@20);
        make.height.width.offset(66);
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    [nameLabel sizeToFit];
    nameLabel.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(16.0)];
    
    [headerView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(personImageView);
        make.top.equalTo(personImageView.mas_bottom).offset(7);
        make.height.offset(16);
        
    }];
    
    UILabel *numLabel = [[UILabel alloc] init];
    self.numLabel = numLabel;
    [nameLabel sizeToFit];
    
    [headerView addSubview:numLabel];
    
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(8);
        make.centerX.equalTo(personImageView);
        make.height.offset(12);
    }];
}

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    if([[DLUtils getUser_type] isEqualToString:@"4"])
    {
        @weakify(self);
        [DLHomeViewTask getAgencyPersonal:param completion:^(id result, NSError *error) {
            @strongify(self);
            if (result) {
                self.mineCenterDict = [[NSMutableDictionary alloc] init];
                self.mineCenterDict = [result objectForKey:@"agencyInfo"];
                NSString *urlStr = self.mineCenterDict[@"head_pic"];
                NSURL *url = [NSURL URLWithString:urlStr];
                
                [self.personImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
                self.personImageView.layer.cornerRadius = 33;
                self.personImageView.clipsToBounds = YES;
                self.personImageView.layer.borderWidth = 2.0;
                self.personImageView.layer.borderColor = [UIColor colorWithHexString:@"#7286fc"].CGColor;
                
                self.nameLabel.text = self.mineCenterDict[@"name"];
                self.numLabel.text = self.mineCenterDict[@"mobile"];
                
                [self.tableView reloadData];
            }
        }];
        
    }else{// C
        
        [DLHomeViewTask getTouristPersonalIndex:param completion:^(id result, NSError *error) {
            
            self.mineCenterDict = [[NSMutableDictionary alloc] init];
            self.mineCenterDict = result[@"touristInfo"];
            NSString *urlStr = self.mineCenterDict[@"head_img"];
            NSURL *url = [NSURL URLWithString:urlStr];
            
            [self.personImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
            [self.personImageView.layer setMasksToBounds:YES];
            [self.personImageView.layer setCornerRadius:33];
            self.personImageView.layer.borderWidth = 2.0;
            self.personImageView.layer.borderColor = [UIColor colorWithHexString:@"#7286fc"].CGColor;
            [self.mineCenterDict[@"name"] isEqualToString:@"0"]? self.nameLabel.text = @"未设置" : (self.nameLabel.text = self.mineCenterDict[@"name"]);
            self.numLabel.text = self.mineCenterDict[@"mobile"];
            [self.tableView reloadData];
        }];
    }
}

-(void)alterHeadPortrait:(UITapGestureRecognizer *)gesture{
    
    [UPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];
}

#pragma mark ---TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 9;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if([[DLUtils getUser_type] isEqualToString:@"4"]){
        return 6;
    }
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if ([[DLUtils getUser_type] isEqualToString:@"4"]) {
        
        if (indexPath.row == 0) {
            
            cell.imageView.image = [UIImage imageNamed:@"modify_personal_data"];
            cell.textLabel.text = @"修改个人资料";
            
        }else if (indexPath.row == 1){
            
            cell.imageView.image = [UIImage imageNamed:@"my_direct_guest"];
            cell.textLabel.text = @"我的直客";
            
        }else if (indexPath.row == 2){
            
            cell.imageView.image = [UIImage imageNamed:@"MyRecommend"];
            cell.textLabel.text = @"我的推荐";
            
        }else if (indexPath.row == 3){
            
            cell.imageView.image = [UIImage imageNamed:@"supply"];
            cell.textLabel.text = @"供应商查询";
            
        }else if (indexPath.row == 4){
            
            cell.imageView.image = [UIImage imageNamed:@"LineSquerry"];
            cell.textLabel.text = @"线路询价";
           
        }else if (indexPath.row == 5){
            
            cell.imageView.image = [UIImage imageNamed:@"universal_property"];
            cell.textLabel.text = @"通用";
        }

    }else{
        
        if (indexPath.row == 0) {
            
            cell.imageView.image = [UIImage imageNamed:@"modify_personal_data"];
            cell.textLabel.text = @"修改个人资料";
            
        }else if (indexPath.row == 1){
            
            cell.imageView.image = [UIImage imageNamed:@"my_direct_guest"];
            cell.textLabel.text = @"我的顾问";
            
        }else if (indexPath.row == 2){
            
            cell.imageView.image = [UIImage imageNamed:@"universal_property"];
            cell.textLabel.text = @"通用";
        }
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([[DLUtils getUser_type] isEqualToString:@"4"]) {
        
        if (indexPath.row == 0){
            
            DLPersonalChangeDataController *changeDataVC = [[DLPersonalChangeDataController alloc] init];
            [self.navigationController pushViewController:changeDataVC animated:YES];
            
        }else if (indexPath.row == 1){
            
            DLMyCustomerXibController *myCustomerVC = [[DLMyCustomerXibController alloc] init];
            [self.navigationController pushViewController:myCustomerVC animated:YES];
            
        }else if (indexPath.row == 2){
            
            DLRemmendController *remmendVC = [[DLRemmendController alloc] init];
            [self.navigationController pushViewController:remmendVC animated:YES];
        }else if (indexPath.row == 3){
            
            DLSupplierQueryController *supplierVC = [[DLSupplierQueryController alloc] init];
            [self.navigationController pushViewController:supplierVC animated:YES];
        }else if (indexPath.row == 4){
            
            DLLineQueryController *lineQueryVC = [[DLLineQueryController alloc ] init];
            [self.navigationController pushViewController:lineQueryVC animated:YES];
  
        }else if (indexPath.row == 5){
            
            DLGeneralController *genralVC = [[DLGeneralController alloc ] init];
            [self.navigationController pushViewController:genralVC animated:YES];
        }
        
    }else{ /// C
        
        if (indexPath.row == 0){
            DLCustomerChangePersonDataController *changeDataVC = [[DLCustomerChangePersonDataController alloc] init];
            [self.navigationController pushViewController:changeDataVC animated:YES];
            
        }else if (indexPath.row == 1){ /// 我的顾问
            if ([[DLUtils getUser_bingdingState] isEqualToString:@"1"]) {
            
                DLMyAgencyController *VC = [[DLMyAgencyController alloc] init];
                [self.navigationController pushViewController:VC animated:YES];
            
            }else {
                
                DLMyAgencyUnBindingController *vc = [[DLMyAgencyUnBindingController alloc] init];
                  [self.navigationController pushViewController:vc animated:YES];
 
            }
            
        }else if (indexPath.row == 2){ /// 通用
            
            DLGeneralController *genralVC = [[DLGeneralController alloc ] init];
            [self.navigationController pushViewController:genralVC animated:YES];
        }
    }
}

#pragma mark   -  BLM_UploadUserIconDelegate
- (void)uploadImageToServerWithImage:(UIImage *)image {
    
    [DLHomeViewTask uploadImage:image Completion:^(id responseData) {
        
    [self.personImageView setImage:image];
        
    } failure:^(NSError *error) {
        
    }];
}

- (uint32_t)intFromData:(NSData *)data useBig:(BOOL)useBig
{
    uint32_t result = -1;
    if (data == nil) return result;
    Byte *bytes = (Byte *)[data bytes];
    if (useBig) {//大端模式
        result = CFSwapInt32BigToHost(*(int *)bytes);
    } else {//小端模式
        result = CFSwapInt32LittleToHost(*(int *)bytes);
    }
    return result;
}

- (NSString *)contentTypeForImageData:(NSData *)data
{
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c)
    {
        case 0xFF:
            return @"jpeg";
            NSLog(@"jpeg");
            
        case 0x89:
            return @"png";
            NSLog(@"png");
            
        case 0x47:
            return @"gif";
            NSLog(@"gif");
            
        case 0x49:
        case 0x4D:
            return @"tiff";
            NSLog(@"tiff");
            
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"]
                && [testString hasSuffix:@"WEBP"])
            {
                return @"webp";
                NSLog(@"webp");
            }
            
            return nil;
    }
    return nil;
}


- (void)saveImage:(UIImage *)image name:(NSString *)iconName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    NSString *icomImage = iconName;
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", icomImage]];

    [UIImagePNGRepresentation(image)writeToFile: filePath  atomically:YES];
}

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSLog(@"%@",NSStringFromCGSize(scaledImage.size));
    return scaledImage;
}
@end
