//
//  RFAnimationHomeViewController.m
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.


#import "RFAnimationHomeViewController.h"
#import "RFBaseNavigationController.h"
#import <Masonry.h>

@interface RFAnimationHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *animaVCClassNameArr;
@property (nonatomic, strong) NSMutableArray *animaTitleArr;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation RFAnimationHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animaVCClassNameArr = [NSMutableArray array];
    _animaTitleArr = [NSMutableArray array];
    
    [self addAnimationVC:@"RFViewAnimationViewController" title:@"UIView动画"];
    [self addAnimationVC:@"RFUsualAnimationViewController" title:@"常见动画"];

    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.left.right.equalTo(@(0));
        make.bottom.equalTo(@(-49));
    }];
}

- (void)addAnimationVC:(NSString *)vcClassName title:(NSString *)title {
    [_animaVCClassNameArr addObject:vcClassName];
    [_animaTitleArr addObject:title];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _animaVCClassNameArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = _animaTitleArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *animationVC = [[NSClassFromString(_animaVCClassNameArr[indexPath.row]) alloc] init];
    
    [self.navigationController pushViewController:animationVC animated:YES];
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
