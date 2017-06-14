//
//  UITableView+MSExtension.h
//  MIS
//
//  Created by Nie on 2017/3/30.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@interface UITableView (MSExtension)

/**
 *  没有数据视图
 */
@property (nonatomic, strong) UIView *ms_noDataView;

/**
 *  网络异常视图
 */
@property (nonatomic, strong) UIView *ms_errorLabel;

/**
 *  开始刷新
 *
 *  @param headerAction 下拉加载回调
 *  @param footerAction 上拉加载回调
 */
- (void)ms_beginRefreshingWithHeaderAction:(void (^)())headerAction footerAction:(void (^)())footerAction;
- (void)ms_beginRefreshing:(id)target headerAction:(SEL)headerAction footerAction:(SEL)footerAction;

/**
 *  开始顶部控件加载
 */
- (void)ms_beginHeaderRefreshing;

/**
 *  开始底部控件加载
 */
- (void)ms_beginFooterRefreshing;

/**
 *  是否处于刷新状态
 */
- (BOOL)ms_isRefreshing;

/**
 *  结束刷新
 *
 *  @param currentItems 当前接口返回的数据大小
 *  @param pageSize     每页显示的大小
 *  @param error        错误信息，error不为nil“显示错误视图”
 *  结束下拉加载时，currentItems == 0，显示“无数据视图”
 *  结束上啦加载时，currentItems != total，隐藏上拉加载控件
 */
- (void)ms_endRefreshing:(NSInteger)currentItems pageSize:(NSInteger)pageSize error:(NSError *)error;

/**
 *  结束刷新
 *
 *  @param currentItems 当前已加载的数据条数
 *  @param total        总数据条数
 *  @param error        错误信息，error不为nil“显示错误视图”
 *  结束下拉加载时，currentItems == 0，显示“无数据视图”
 *  结束上啦加载时，currentItems == total，隐藏上拉加载控件
 */
- (void)ms_endRefreshing:(NSInteger)currentItems total:(NSInteger)total error:(NSError *)error;

/**
 *  结束刷新
 */
- (void)ms_endRefreshing;

/**
 *  显示无数据视图
 *
 *  @param row 数据条目数 == 0时，显示无数据
 */
- (void)ms_showNoDataPlaceholderIfNeeded:(NSInteger)row;

@end
