//
//  RFMJAnimateFooter.m
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import "RFMJAnimateFooter.h"
#import <Masonry.h>

@implementation RFMJAnimateFooter

- (void)prepare {
    [super prepare];
    
    self.stateLabel.hidden = YES;//先默认隐藏,等到变为全部加载状态时, 再显示
    NSString *imgPrefix = @"refreshing0";
    
    NSMutableArray *idleImages = [NSMutableArray array];
    for (int i = 1; i <= 2; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%zd",imgPrefix, i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (int i = 1; i <= 6; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%zd",imgPrefix, i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    //没有给全部加载完毕的图片, 所以当没有数据的时候用文字来提示
    [self setTitle:@"全部加载完毕" forState:MJRefreshStateNoMoreData];
}

- (void)setState:(MJRefreshState)state {
    [super setState:state];
    
    if (state == MJRefreshStateNoMoreData) {
        self.stateLabel.hidden = NO;
    } else {
        self.stateLabel.hidden = YES;
    }
}

- (void)placeSubviews {
    //注意设置顺序
    [self.gifView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.centerX.equalTo(@(0));
        make.width.equalTo(@(120));
        make.height.equalTo(@(60));
    }];
    
    [super placeSubviews];
    
    self.mj_h = 60;
}

@end
