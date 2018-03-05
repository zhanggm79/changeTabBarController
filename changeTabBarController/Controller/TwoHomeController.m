//
//  TwoHomeController.m
//  changeTabBarController
//
//  Created by Z on 2018/3/2.
//  Copyright © 2018年 Z. All rights reserved.
//

#import "TwoHomeController.h"
#import "TempController.h"

@interface TwoHomeController ()

@end

@implementation TwoHomeController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.customNavBar.title = @"第二个tabBar首页";
    [self.customNavBar wr_setLeftButtonWithTitle:@"返回" titleColor:[UIColor whiteColor]];

    WEAK_SELF(weakSelf);
    [self.customNavBar setOnClickLeftButton:^{
        
        [weakSelf.tabBarController.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    
    
    
    UIButton *tempBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [tempBtn setTitle:@"push到三级页面" forState:UIControlStateNormal];
    [tempBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tempBtn setBackgroundColor:[UIColor redColor]];
    [tempBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tempBtn];
}


- (void)btnClick {
    
    [self.navigationController pushViewController:[TempController new] animated:YES];
    
}




@end
