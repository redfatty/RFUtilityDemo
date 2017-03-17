//
//  UIScrollView+MJAdd.m
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import "UIScrollView+MJAdd.h"
#import <MJRefresh.h>

@implementation UIScrollView (MJAdd)

- (void)stopMJRefreshIsHeader:(BOOL)isHeader noMoreDatas:(BOOL)noMoreDatas {
    if (isHeader) {
        [self.mj_header endRefreshing];
        [self.mj_footer resetNoMoreData];
    } else {
        [self.mj_footer endRefreshing];
    }
    
    if (noMoreDatas) {
        [self.mj_footer endRefreshingWithNoMoreData];
    }
}

@end
