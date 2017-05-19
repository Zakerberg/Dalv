//
//  DLSupplierqueryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLSupplierqueryController.h"

@interface DLSupplierqueryController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *NavView;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSMutableArray *history;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation DLSupplierqueryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
    
    [self initTableView];
    [self setupnav];
    
    //键盘改变时调用 键盘监听事件
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyboardChangNotAppear:)
                                                name:UIKeyboardDidChangeFrameNotification
                                              object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyboardChangAppear:)
                                                name:UIKeyboardWillChangeFrameNotification
                                              object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyboardWillAppear:)
                                                name:UIKeyboardWillShowNotification
                                              object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyboardWillDisappear:)
                                                name:UIKeyboardWillHideNotification
                                              object:nil];

}



#pragma mark - 
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;

    UIImage *backImage = [self OriginImage:[UIImage imageNamed:@"searchbar_textfield_background_os7"] scaleToSize:CGSizeMake(SCREEN_WIDTH-60, 40)];
    _searchBar.backgroundImage = backImage;
    _searchBar.tintColor = [UIColor colorWithRed:252/255.0 green:74/255.0 blue:132/255.0 alpha:0.9];
    _searchBar.delegate = self;
    
    [_searchBar becomeFirstResponder];
    [self.NavView addSubview:_searchBar];
    
    //退出
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(SCREEN_WIDTH-50, 35, 50, 25);
    [closeBtn setTitle: @"取消" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor colorWithRed:252/255.0 green:74/255.0 blue:132/255.0 alpha:0.9]forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(OnCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.NavView addSubview:closeBtn];

    
    
    
}

-(void)OnCloseBtn:(UIButton *)sender//推出设置
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(-8, 0, size.width+16, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}
#pragma mark - 搜索事件   UISearchBarDelegate
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{



}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{



}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.history count]+2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"cell110";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"最近搜过";
        cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell;
    }else if (indexPath.row == [self.history count]+1)
    {
        cell.textLabel.text = @"清除历史纪录";
        cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        return cell;
    }else
    {
        cell.textLabel.text = self.history[indexPath.row-1];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == [self.history count]+1)
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.selected = NO;  //这种是点击的时候有效果，返回后效果消失
        _history = [[NSMutableArray alloc] init];

       [self.tableView reloadData];
    
    }else if(indexPath.row > 0)
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.selected = NO;  //这种是点击的时候有效果，返回后效果消失
    }
    

}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)moveTable:(UIPanGestureRecognizer *)gr
{
    
    if (![_searchBar isExclusiveTouch])
    {
        [_searchBar resignFirstResponder];
        
    }
}

-(void)initTableView{
    
}

-(void)setupnav{
    
    
    self.NavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80)];
    self.NavView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.NavView];
    
    //搜索
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 30, [UIScreen mainScreen].bounds.size.width-60, 40)];
    _searchBar.placeholder = @"搜索供应商";
    _searchBar.keyboardType = UIKeyboardTypeDefault;

    
    
}

#pragma  mark - 键盘变化
-(void)keyboardChangAppear:(NSNotification *)notification//开变
{
    
}



-(void)keyboardChangNotAppear:(NSNotification *)notification//变好
{
    
}



-(void)keyboardWillAppear:(NSNotification *)notification//出现
{
    
}


-(void)keyboardWillDisappear:(NSNotification *)notification//消失
{
    
}


-(CGFloat)keyboardEndingFrameHeight:(NSDictionary *)userInfo//计算键盘的高度
{
    CGRect keyboardEndingUncorrectedFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGRect keyboardEndingFrame = [self.view convertRect:keyboardEndingUncorrectedFrame fromView:nil];
    return keyboardEndingFrame.size.height;
    
}

@end
