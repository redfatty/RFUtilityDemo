//
//  RFUsualAnimationViewController.m
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import "RFUsualAnimationViewController.h"
#import "UIView+RFAdd.h"

@interface RFUsualAnimationViewController ()

@end

@implementation RFUsualAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //心跳
    UILabel *heartbeatLabel = [UILabel instanceWithSuperview:self.view bgColor:[UIColor purpleColor] makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(72));
        make.left.equalTo(@(8));
        make.width.height.equalTo(@(45));
    }];
    heartbeatLabel.layer.cornerRadius = 22.5;
    heartbeatLabel.clipsToBounds = YES;
    heartbeatLabel.text = @"心跳";
    heartbeatLabel.textColor = [UIColor whiteColor];
    heartbeatLabel.textAlignment = NSTextAlignmentCenter;
    
    CABasicAnimation *heartbeatAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    heartbeatAnima.fromValue = @(0.75);
    heartbeatAnima.toValue = @(1.25);
    heartbeatAnima.repeatCount = HUGE;
    heartbeatAnima.autoreverses = YES;
    heartbeatAnima.duration = 0.5;
    [heartbeatLabel.layer addAnimation:heartbeatAnima forKey:nil];
    
    //点赞
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
