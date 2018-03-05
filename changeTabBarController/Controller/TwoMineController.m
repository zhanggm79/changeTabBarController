//
//  TwoMineController.m
//  changeTabBarController
//
//  Created by Z on 2018/3/2.
//  Copyright © 2018年 Z. All rights reserved.
//

#import "TwoMineController.h"

@interface TwoMineController ()

@end

@implementation TwoMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customNavBar.title = @"第二个---我的";
    
    [self.customNavBar wr_setLeftButtonWithTitle:@"返回" titleColor:[UIColor whiteColor]];
    
    WEAK_SELF(weakSelf);
    [self.customNavBar setOnClickLeftButton:^{
        [weakSelf.tabBarController.navigationController popViewControllerAnimated:YES];
    }];
    
}



@end
