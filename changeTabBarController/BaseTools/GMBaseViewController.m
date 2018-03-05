//
//  GMBaseViewController.m
//  changeTabBarController
//
//  Created by Z on 2018/3/2.
//  Copyright © 2018年 Z. All rights reserved.
//

#import "GMBaseViewController.h"
#import "AppDelegate.h"
#import "WRNavigationBar.h"


@interface GMBaseViewController ()

@end

@implementation GMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = KBackGroundColor;
    [self setupNavBar];
    
}

- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];
    
    // 设置自定义导航栏背景图片
    //self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"millcolorGrad"];
    [self.customNavBar setBarBackgroundColor:KSpinKitColor];
    [self.customNavBar wr_setBottomLineHidden:YES];
    // 设置自定义导航栏标题颜色
    self.customNavBar.titleLabelColor = [UIColor whiteColor];
    
    if (self.navigationController.childViewControllers.count != 1) {
        //[self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"backArrow"]];
        [self.customNavBar wr_setLeftButtonWithTitle:@"<<" titleColor:[UIColor whiteColor]];
    }
}

- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
    }
    return _customNavBar;
}

@end
