//
//  RFBaseViewController.h
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RFBaseViewController : UIViewController

@property (nonatomic, copy) void(^toBackBlock)(UIViewController *targetVC);

@end
