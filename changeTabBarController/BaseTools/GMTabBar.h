//
//  GMTabBar.h
//  changeTabBarController
//
//  Created by Z on 2018/3/2.
//  Copyright © 2018年 Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMTabBar : UITabBar

@property (nonatomic,copy) void(^plusBtnClick)(void);

@end
