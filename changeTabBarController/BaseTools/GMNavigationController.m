//
//  GMNavigationController.m
//  changeTabBarController
//
//  Created by Z on 2018/3/2.
//  Copyright © 2018年 Z. All rights reserved.
//

#import "GMNavigationController.h"

@interface GMNavigationController ()

@property (strong,nonatomic) UIBarButtonItem * backButton;
@property (strong,nonatomic) UIBarButtonItem * editButton;

@end

@implementation GMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
    //修改tabBra的frame，否则iPhone X上push页面tabBar会向上跳动
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
    
}


@end
