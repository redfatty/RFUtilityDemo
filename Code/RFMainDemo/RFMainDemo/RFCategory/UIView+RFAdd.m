//
//  UIView+RFAdd.m
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import "UIView+RFAdd.h"

@implementation UIView (RFAdd)

+ (instancetype)instanceWithSuperview:(UIView *)superview bgColor:(UIColor *)bgColor makeConstraints:(void (^)(MASConstraintMaker *))block {
    UIView *view = [[self alloc] init];
    if (bgColor) {
        view.backgroundColor = bgColor;
    }
    
    if (superview) {
        [superview addSubview:view];
        if (block) {
            [view mas_makeConstraints:block];
        }
    }
    
    return view;
}

@end
