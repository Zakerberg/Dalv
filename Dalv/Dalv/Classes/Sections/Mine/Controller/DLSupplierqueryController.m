////
////  DLSupplierqueryController.m
////  Dalv
////
////  Created by Michael 柏 on 2017/6/1.
////  Copyright © 2017年 Michael 柏. All rights reserved.
////
//
//#import "DLSupplierqueryController.h"
//#import "DLsupplierQueryModel.h"
//@interface DLSupplierqueryController ()
//@property (weak, nonatomic) UITextField *inputTF;
//@property (weak, nonatomic)  UIButton *searchBtn;
//@property (strong, nonatomic)  UIView *searchView;
//@property (weak, nonatomic)  UILabel *nameLabel;
//@end
//
//@implementation DLSupplierqueryController
//
//-(UIView *)searchView {
//    
//    if (!_searchView) {
//        _searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 132)];
//        _searchView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
//        [self.view addSubview:_searchView];
//    }
//    
//    return _searchView;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self setupUI];
//    [self setSearchView];
//}
//
//-(void)setupUI {
//    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    self.title = @"供应商查询";
//}
//
//-(void)setSearchView {
//    
//    UILabel *nameLabel = [[UILabel alloc] init];
//    self.nameLabel = nameLabel;
//    nameLabel.text = @"输入目的地或供应商名称";
//    nameLabel.font = [UIFont systemFontOfSize:13];
//    [nameLabel sizeToFit];
//    nameLabel.tintColor = [UIColor colorWithHexString:@"#3b3b3b"];
//    [_searchView addSubview:nameLabel];
//    
//    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(37);
//        make.leftMargin.offset(243/2);
//        make.height.offset(13);
//    }];
//}
// 
//
//
//- (BOOL)dl_blueNavbar {
//    return YES;
//}
//
//
//
//
///***  搜索按钮   ***/
//- (IBAction)SearchBtnClick:(id)sender {
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    
//    [DLRequestSerVice POST:DL_providerQuery param:nil success:^(id responseData) {
//        
//    } failure:^(NSError *error) {
//        //在此写提示框
//        
//    }];
//
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//@end
