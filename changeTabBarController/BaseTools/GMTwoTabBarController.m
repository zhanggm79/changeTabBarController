//
//  GMTwoTabBarController.m
//  changeTabBarController
//
//  Created by Z on 2018/3/2.
//  Copyright © 2018年 Z. All rights reserved.
//

#import "GMTwoTabBarController.h"
#import "TwoHomeController.h"
#import "TwoMineController.h"
#import "TempController.h"
#import "GMNavigationController.h"


@interface GMTwoTabBarController ()

@end

@implementation GMTwoTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];    
    TwoHomeController * homeCtrl = [[TwoHomeController alloc] init];
    [self addChildViewController:homeCtrl title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    TempController * tempCtrl = [[TempController alloc] init];
    [self addChildViewController:tempCtrl title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    TwoMineController * mineCtrl = [[TwoMineController alloc] init];
    [self addChildViewController:mineCtrl title:@"我的" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}

- (void)addChildViewController:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    //设置文字的样式
    [self.tabBar setTintColor: KSpinKitColor];
    GMNavigationController * nav = [[GMNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}



@end
