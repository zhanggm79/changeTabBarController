//
//  GMTabBarController.m
//  changeTabBarController
//
//  Created by Z on 2018/3/2.
//  Copyright © 2018年 Z. All rights reserved.
//

#import "GMTabBarController.h"
#import "HomeController.h"
#import "MessageController.h"
#import "MineController.h"
#import "GMNavigationController.h"
#import "GMTabBar.h"
#import "GMTwoTabBarController.h"

@interface GMTabBarController ()

@end

@implementation GMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    //设置tabBar
    GMTabBar *tabBar = [[GMTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    [tabBar setPlusBtnClick:^{
        NSLog(@"当前选中控制器 -- %@",self.selectedViewController);
        GMTwoTabBarController *tabCtrl = [[GMTwoTabBarController alloc] init];
        [self.selectedViewController pushViewController:tabCtrl animated:YES];
    }];
    
    HomeController * homeCtrl = [[HomeController alloc] init];
    [self addChildViewController:homeCtrl title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    MessageController * messageCtrl = [[MessageController alloc] init];
    [self addChildViewController:messageCtrl title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    MineController * mineCtrl = [[MineController alloc] init];
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
