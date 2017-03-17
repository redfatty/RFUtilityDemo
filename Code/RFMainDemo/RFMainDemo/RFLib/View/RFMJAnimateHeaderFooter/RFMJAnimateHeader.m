//
//  RFMJAnimateHeader.m
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import "RFMJAnimateHeader.h"
#import <Masonry.h>

@implementation RFMJAnimateHeader

- (void)prepare {
    [super prepare];
    
    self.stateLabel.hidden = YES;
    self.lastUpdatedTimeLabel.hidden = YES;
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
}

- (void)placeSubviews {
    //注意设置顺序
    [self.gifView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.centerX.equalTo(@(0));
        make.width.equalTo(@(120));//90    120
        make.height.equalTo(@(60));//45   60
    }];
    
    [super placeSubviews];
    
    self.mj_h = 60;
}

@end
