//
//  HomeController.m
//  changeTabBarController
//
//  Created by Z on 2018/3/2.
//  Copyright © 2018年 Z. All rights reserved.
//

#import "HomeController.h"
#import "TempController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customNavBar.title = @"首页";
    
    UIButton *tempBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [tempBtn setTitle:@"push到二级页面" forState:UIControlStateNormal];
    [tempBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tempBtn setBackgroundColor:[UIColor redColor]];
    [tempBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tempBtn];
}


- (void)btnClick {
    
    [self.navigationController pushViewController:[TempController new] animated:YES];
    
}



@end
