//
//  UIView+RFAdd.h
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

@interface UIView (RFAdd)

+ (instancetype)instanceWithSuperview:(UIView *)superview bgColor:(UIColor *)bgColor makeConstraints:(void(^)(MASConstraintMaker *make))block;

@end
