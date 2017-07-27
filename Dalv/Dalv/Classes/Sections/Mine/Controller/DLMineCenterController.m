//
//  DLMineCenterController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  -------------------  个人中心   -------------------

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

//移除通知
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
    
    //头像
    UIImageView *personImageView = [[UIImageView alloc] init];
    self.personImageView = personImageView;
//    [personImageView setImage:[UIImage imageNamed:@"v2_my_avatar"]];
    
    personImageView.userInteractionEnabled = YES;
  
    /*
    //手势
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(alterHeadPortrait:)];
    
    //添加手势
    [personImageView addGestureRecognizer:singleTap];
     
     */
     
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
    if([[DLUtils getUser_type] isEqualToString:@"4"])/// 顾问
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

//头像的点击事件
-(void)alterHeadPortrait:(UITapGestureRecognizer *)gesture{
    
    [UPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];
}

#pragma mark ---TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

//头部视图的间距
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
    
    if ([[DLUtils getUser_type] isEqualToString:@"4"]) { /// 顾问
        
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

    }else{ /// C
        
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
    
    if ([[DLUtils getUser_type] isEqualToString:@"4"]) { /// 顾问
        
        if (indexPath.row == 0){ /// 修改个人资料
            
            DLPersonalChangeDataController *changeDataVC = [[DLPersonalChangeDataController alloc] init];
            [self.navigationController pushViewController:changeDataVC animated:YES];
            
        }else if (indexPath.row == 1){ /// 我的直客
            
            DLMyCustomerXibController *myCustomerVC = [[DLMyCustomerXibController alloc] init];
            [self.navigationController pushViewController:myCustomerVC animated:YES];
            
        }else if (indexPath.row == 2){ /// 我的推荐
            
            DLRemmendController *remmendVC = [[DLRemmendController alloc] init];
            [self.navigationController pushViewController:remmendVC animated:YES];
            //[[DLHUDManager sharedInstance] showTextOnly:@"正在拼命开发中...."];
            
        }else if (indexPath.row == 3){ /// 供应商查询
            
            DLSupplierQueryController *supplierVC = [[DLSupplierQueryController alloc] init];
            [self.navigationController pushViewController:supplierVC animated:YES];
            
           // [[DLHUDManager sharedInstance] showTextOnly:@"正在拼命开发中...."];
            
        }else if (indexPath.row == 4){ /// 线路询价
            
            DLLineQueryController *lineQueryVC = [[DLLineQueryController alloc ] init];
            [self.navigationController pushViewController:lineQueryVC animated:YES];
            
            //[[DLHUDManager sharedInstance] showTextOnly:@"正在拼命开发中...."];
            
        }else if (indexPath.row == 5){ /// 通用
            
            DLGeneralController *genralVC = [[DLGeneralController alloc ] init];
            [self.navigationController pushViewController:genralVC animated:YES];
        }
        
    }else{ /// C
        
        if (indexPath.row == 0){ /// 修改个人资料
            
            DLCustomerChangePersonDataController *changeDataVC = [[DLCustomerChangePersonDataController alloc] init];
            [self.navigationController pushViewController:changeDataVC animated:YES];
            
        }else if (indexPath.row == 1){ /// 我的顾问
            
            
            
            
            /*
            DLMyCustomerXibController *myCustomerVC = [[DLMyCustomerXibController alloc] init];
            [self.navigationController pushViewController:myCustomerVC animated:YES];
            */
            
            
            
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

//保存照片到沙盒路径
- (void)saveImage:(UIImage *)image name:(NSString *)iconName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //写入文件
    NSString *icomImage = iconName;
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", icomImage]];
    // 保存文件的名称
    // [[self getDataByImage:image] writeToFile:filePath atomically:YES];
    [UIImagePNGRepresentation(image)writeToFile: filePath  atomically:YES];
}

//缩放图片
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

/*
 #pragma mark - tableview dataSource & delegate
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 return 1;
 }
 
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
 return 66;
 }
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 static NSString * ID = @"StevenCell";
 
 UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
 
 if(!cell) {
 cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
 }
 cell.textLabel.text = [NSString stringWithFormat:@"cell---%ld",indexPath.row + 1];
 
 return cell;
 }
 
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView{
 
 CGFloat offset_Y = scrollView.contentOffset.y + headRect.size.height-navHeight-navHeight;
 
 if  (offset_Y < 0) {
 
 _myView.backgroundView.contentMode = UIViewContentModeScaleToFill;
 
 _myView.backgroundView.frame = CGRectMake(offset_Y*0.5 , -navHeight, VCWidth - offset_Y, headRect.size.height - offset_Y);
 }else if (offset_Y > 0 && offset_Y <= (headRect.size.height-navHeight-navHeight)) {
 
 _myView.backgroundView.contentMode = UIViewContentModeTop;
 
 CGFloat y = navHeight* offset_Y/(headRect.size.height-navHeight-navHeight)-navHeight;
 
 _myView.backgroundView.frame = CGRectMake(0 ,y , VCWidth , headRect.size.height -(navHeight + y) - offset_Y);
 
 
 CGFloat width = offset_Y*(40-(VCWidth / 4))/(headRect.size.height-navHeight-navHeight)+(VCWidth / 4);
 _myView.headView.frame =CGRectMake(0, 0, width,width);
 _myView.headView.layer.cornerRadius =width*0.5;
 _myView.headView.center = _myView.backgroundView.center;
 
 _myView.signLabel.frame =CGRectMake(0, CGRectGetMaxY(_myView.headView.frame), VCWidth, 40);
 
 _myView.signLabel.alpha = 1 - (offset_Y*3 / (headRect.size.height-navHeight-navHeight) /2);
 }else if(offset_Y > (headRect.size.height-navHeight-navHeight)) {
 _myView.backgroundView.contentMode = UIViewContentModeTop;
 
 CGFloat y = navHeight* (headRect.size.height-navHeight-navHeight)/(headRect.size.height-navHeight-navHeight)-navHeight;
 
 _myView.backgroundView.frame = CGRectMake(0 ,y , VCWidth , headRect.size.height -(navHeight + y) - (headRect.size.height-navHeight-navHeight));
 
 
 CGFloat width = (headRect.size.height-navHeight-navHeight)*(40-(VCWidth / 4))/(headRect.size.height-navHeight-navHeight)+(VCWidth / 4);
 _myView.headView.frame =CGRectMake(0, 0, width,width);
 _myView.headView.layer.cornerRadius =width*0.5;
 _myView.headView.center = _myView.backgroundView.center;
 
 _myView.signLabel.frame =CGRectMake(0, CGRectGetMaxY(_myView.headView.frame), VCWidth, 40);
 
 _myView.signLabel.alpha = 1 - ((headRect.size.height-navHeight-navHeight)*3 / (headRect.size.height-navHeight-navHeight) /2);
 }
 }
 */

//    /**
//     *  弹出提示框
//     */
//    //初始化提示框
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    //按钮：从相册选择，类型：UIAlertActionStyleDefault
//    [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //初始化UIImagePickerController
//        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
//        //获取方式1：通过相册（呈现全部相册），UIImagePickerControllerSourceTypePhotoLibrary
//        //获取方式2，通过相机，UIImagePickerControllerSourceTypeCamera
//        //获取方法3，通过相册（呈现全部图片），UIImagePickerControllerSourceTypeSavedPhotosAlbum
//        PickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        //允许编辑，即放大裁剪
//        PickerImage.allowsEditing = YES;
//        //自代理
//        PickerImage.delegate = self;
//        //页面跳转
//        [self presentViewController:PickerImage animated:YES completion:nil];
//    }]];
//    //按钮：拍照，类型：UIAlertActionStyleDefault
//    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
//        /**
//         其实和从相册选择一样，只是获取方式不同，前面是通过相册，而现在，我们要通过相机的方式
//         */
//        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
//        //获取方式:通过相机
//        PickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
//        PickerImage.allowsEditing = YES;
//        PickerImage.delegate = self;
//        [self presentViewController:PickerImage animated:YES completion:nil];
//    }]];
//    //按钮：取消，类型：UIAlertActionStyleCancel
//    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
//    [self presentViewController:alert animated:YES completion:nil];
//
/*
 UIButton* personBtn = [[UIButton alloc]init];
 self.personBtn = personBtn;
 [personBtn setImage:[UIImage imageNamed:@"v2_my_avatar"] forState:UIControlStateNormal];
 
 [personBtn addTarget:self action:@selector(PersonbuttonClick) forControlEvents:UIControlEventTouchUpInside];
 
 [headerView addSubview:personBtn];
 
 [personBtn mas_makeConstraints:^(MASConstraintMaker *make) {
 
 make.centerX.equalTo(self.view);
 make.top.equalTo(@20);
 make.height.width.offset(66);
 }];
 */


/*
 UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, navHeight, VCWidth, VCHeight - navHeight)];
 self.tableView = tableView;
 tableView.contentInset = UIEdgeInsetsMake(headRect.size.height-navHeight-navHeight, 0, 0, 0);
 
 [self.view addSubview:tableView];
 
 HeadView * vc = [[HeadView alloc]initWithFrame:headRect backgroundView:@"backImage" headView:@"v2_my_avatar" headViewWidth:(CGFloat)(VCWidth / 4) signLabel:@"Michael 柏 原创"];
 
 _myView = vc;
 _myView.backgroundColor = [UIColor clearColor];
 _myView.userInteractionEnabled = NO;
 
 [self.view addSubview:vc];
 
 */
/*
 @interface HeadView:UIView
 @property (weak, nonatomic) UIImageView * backgroundView;
 @property (weak, nonatomic) UIImageView * headView;
 @property (weak, nonatomic) UILabel * signLabel;
 
 @end
 
 @implementation HeadView
 - (instancetype)initWithFrame:(CGRect)frame backgroundView:(NSString *)name headView:(NSString *)headImgName headViewWidth:(CGFloat)width signLabel:(NSString *)signature
 {
 if (self = [super initWithFrame:frame]) {
 
 UIImageView * backgroundView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -navHeight, frame.size.width, frame.size.height)];
 UIImage * image = [UIImage imageNamed:name];
 UIImage * newImg = [self image:image byScalingToSize:self.bounds.size];
 backgroundView.image = newImg;
 backgroundView.clipsToBounds = YES;
 [self addSubview:backgroundView];
 _backgroundView = backgroundView;
 
 UIImageView * headView = [[UIImageView alloc]initWithFrame:(CGRect){(frame.size.width - width) * 0.5,0.5 * (frame.size.height - width) - navHeight,width,width}];
 headView.layer.cornerRadius = width*0.5;
 headView.layer.masksToBounds = YES;
 headView.image = [UIImage imageNamed:headImgName];
 [self addSubview:headView];
 _headView = headView;
 
 UILabel * signLabel = [[UILabel alloc]initWithFrame:(CGRect){0,CGRectGetMaxY(headView.frame) ,self.bounds.size.width,40}];
 signLabel.text = signature;
 signLabel.textAlignment = NSTextAlignmentCenter;
 signLabel.textColor = [UIColor whiteColor];
 [self addSubview:signLabel];
 _signLabel = signLabel;
 
 }
 return self;
 }
 
 - (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
 UIImage *sourceImage = image;
 UIImage *newImage = nil;
 
 UIGraphicsBeginImageContext(targetSize);
 
 CGRect thumbnailRect = CGRectZero;
 thumbnailRect.origin = CGPointZero;
 thumbnailRect.size.width  = targetSize.width;
 thumbnailRect.size.height = targetSize.height;
 
 [sourceImage drawInRect:thumbnailRect];
 
 newImage = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 
 return newImage ;
 }
 @end
 
 */

/*
 #define headRect CGRectMake(0,0,self.view.bounds.size.width,280)
 #define VCWidth self.view.bounds.size.width
 #define VCHeight self.view.bounds.size.height
 #define navHeight 44 //上推留下的高度
 */
