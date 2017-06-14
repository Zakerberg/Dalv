//
//  UITableView+MSExtension.m
//  MIS
//
//  Created by Nie on 2017/3/30.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import "UITableView+MSExtension.h"
#import "MSRefreshHeader.h"
#import "MSRefreshFooter.h"

@implementation UITableView (MSExtension)

- (void)ms_beginRefreshing:(id)target headerAction:(SEL)headerAction footerAction:(SEL)footerAction {
    if (headerAction == nil && footerAction == nil) {
        return;
    }
    
    if (footerAction) {
        MJRefreshFooter *footer = self.mj_footer;
        if (footer == nil) {
            self.mj_footer = [MSRefreshFooter footerWithRefreshingTarget:target
                                                        refreshingAction:footerAction];
        }
    }
    
    if (headerAction) {
        MJRefreshHeader *header = self.mj_header;
        if (header == nil) {
            self.mj_header = [MSRefreshHeader headerWithRefreshingTarget:target refreshingAction:headerAction];
        }
        self.mj_footer.hidden = YES;
        [self.mj_header beginRefreshing];
    }
}

- (void)ms_beginRefreshingWithHeaderAction:(void (^)())headerAction footerAction:(void (^)())footerAction {
    if (headerAction == nil && footerAction == nil) {
        return;
    }
    
    if (footerAction) {
        MJRefreshFooter *footer = self.mj_footer;
        if (footer == nil) {
            self.mj_footer = [MSRefreshFooter footerWithRefreshingBlock:footerAction];
        }
    }
    
    if (headerAction) {
        MJRefreshHeader *header = self.mj_header;
        if (header == nil) {
            self.mj_header = [MSRefreshHeader headerWithRefreshingBlock:headerAction];
        }
        self.mj_footer.hidden = YES;
        [self.mj_header beginRefreshing];
    }
}

- (void)ms_beginHeaderRefreshing {
    [self.mj_header beginRefreshing];
}

- (void)ms_beginFooterRefreshing {
    [self.mj_footer beginRefreshing];
}

- (BOOL)ms_isRefreshing {
    return [self.mj_header isRefreshing] || [self.mj_footer isRefreshing];
}

- (void)ms_endRefreshing:(NSInteger)currentItems pageSize:(NSInteger)pageSize error:(NSError *)error {
    if ([self.mj_header isRefreshing]) {
        [self.mj_header endRefreshing];
        [self ms_showNoDataPlaceholderIfNeeded:currentItems];
        self.mj_footer.hidden = (currentItems != pageSize);
    }
    
    if ([self.mj_footer isRefreshing]) {
        [self.mj_footer endRefreshing];
        self.mj_footer.hidden = (currentItems != pageSize);
    }
}

- (void)ms_endRefreshing:(NSInteger)currentItems total:(NSInteger)total error:(NSError *)error {
    if ([self.mj_header isRefreshing]) {
        [self.mj_header endRefreshing];
        [self ms_showNoDataPlaceholderIfNeeded:currentItems];
        if (self.mj_header.endRefreshingCompletionBlock) {
            self.mj_header.endRefreshingCompletionBlock();
        }
        if (currentItems <= 0 || currentItems >= total) {
            self.mj_footer.hidden = YES;
        } else {
            self.mj_footer.hidden = NO;
        }
    }
    
    if ([self.mj_footer isRefreshing]) {
        [self.mj_footer endRefreshing];
        if (currentItems >= total) {
            self.mj_footer.hidden = YES;
        } else {
            self.mj_footer.hidden = NO;
        }
    }
}

- (void)ms_endRefreshing {
    if ([self.mj_header isRefreshing]) {
        [self.mj_header endRefreshing];
    }
    
    if ([self.mj_footer isRefreshing]) {
        [self.mj_footer endRefreshing];
    }
}

- (void)ms_showNoDataPlaceholderIfNeeded:(NSInteger)row {
    self.ms_noDataView.hidden = (row > 0);
}

- (UIView *)ms_noDataView {
    UIView *noDataView = objc_getAssociatedObject(self, _cmd);
    if (noDataView == nil) {
        UIImageView *noDataImageView = [[UIImageView alloc] init];
        noDataImageView.image = [UIImage imageNamed:@"Common_NoData_Background"];
        noDataView = noDataImageView;
        self.ms_noDataView = noDataView;
    }
    return noDataView;
}

- (void)setMs_noDataView:(UIView *)ms_noDataView {
    objc_setAssociatedObject(self, @selector(ms_noDataView), ms_noDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.backgroundView = ms_noDataView;
}

- (UILabel *)ms_errorLabel {
    UILabel *ms_errorLabel = objc_getAssociatedObject(self, _cmd);
    if (ms_errorLabel == nil) {
        ms_errorLabel = [[UILabel alloc] init];
        ms_errorLabel.textColor = [UIColor ms_blackColor];
        ms_errorLabel.font = [UIFont systemFontOfSize:14];
        ms_errorLabel.text = @"网络异常，请稍后重试！";
        self.ms_errorLabel = ms_errorLabel;
    }
    return ms_errorLabel;
}

- (void)setMs_errorLabel:(UIView *)ms_errorLabel {
    objc_setAssociatedObject(self, @selector(ms_errorLabel), ms_errorLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.backgroundView = ms_errorLabel;
}

@end
