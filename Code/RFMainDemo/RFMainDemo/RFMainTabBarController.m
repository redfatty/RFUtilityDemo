//
//  RFMainTabBarController.m
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import "RFMainTabBarController.h"
#import "RFAnimationHomeViewController.h"
#import "RFBaseNavigationController.h"

@interface RFMainTabBarController ()

@end

@implementation RFMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RFAnimationHomeViewController *animationHomeVC = [[RFAnimationHomeViewController alloc] init];
    animationHomeVC.tabBarItem.title = @"动画";
    RFBaseNavigationController *animationNav = [[RFBaseNavigationController alloc] initWithRootViewController:animationHomeVC];
    
    
    
    [self addChildViewController:animationNav];
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
