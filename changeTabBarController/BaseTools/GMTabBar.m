//
//  GMTabBar.m
//  changeTabBarController
//
//  Created by Z on 2018/3/2.
//  Copyright © 2018年 Z. All rights reserved.
//

#import "GMTabBar.h"


@interface GMTabBar ()

@property (nonatomic, strong) UIButton *publishButton;

@end


@implementation GMTabBar
- (UIButton *)publishButton {
    if (!_publishButton) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publishButton setImage:[UIImage imageNamed:@"tabbar_home"] forState:UIControlStateNormal];
        [_publishButton setTitle:@"自定义" forState:UIControlStateNormal];
        [_publishButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //[_publishButton setTitleColor:KSpinKitColor forState:UIControlStateHighlighted];
        _publishButton.titleLabel.font = [UIFont systemFontOfSize:10.0];
        //[_publishButton setBackgroundColor:[UIColor blueColor]];
        _publishButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //**需要先获取图片和文字的高度**  改变按钮图片和文字布局
        CGFloat imageHeight = _publishButton.imageView.image.size.height;
        CGFloat titleHeight = [_publishButton.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0]}].height;
        CGFloat titleWidth = [_publishButton.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0]}].width;
        CGFloat imageWidth = _publishButton.imageView.image.size.width;
        CGFloat space = 5.0;
        //如果要实现上下,比如图片在上，文字在下： 上左下右
        [_publishButton setImageEdgeInsets:UIEdgeInsetsMake(3, titleWidth*0.5, imageHeight*0.5 + space*0.5, -titleWidth*0.5)];
        [_publishButton setTitleEdgeInsets:UIEdgeInsetsMake(titleHeight + space, -imageWidth*0.5, -(titleHeight + space), imageWidth*0.5)];
        // 发布按钮的点击事件
        [_publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_publishButton];
    }
    return _publishButton;
}




- (void)layoutSubviews {
    [super layoutSubviews];
    /**** 设置所有UITabBarButton的frame ****/
    // 按钮的尺寸
    CGFloat buttonW = self.frame.size.width / (self.items.count +1);
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    //判断适配iPhone X
    if (iPhoneX) {
        buttonH = buttonH - 34;
    }
    // 按钮索引
    int buttonIndex = 0;
    for (UIView *subview in self.subviews) {
        // 过滤掉非UITabBarButton
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
            // 设置frame
            CGFloat buttonX = buttonIndex * buttonW;
            // 把自定义按钮的位置预留出来
        if (buttonIndex >= 3) {
            buttonX += buttonW;
        }
        subview.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        // 增加索引
        buttonIndex++;
    }
    /**** 设置最边上按钮的frame,当tabBarItem数量改变，这里需要调整Frame ****/
    self.publishButton.frame = CGRectMake(0, 0, buttonW, buttonH);
    if (iPhoneX) {
        self.publishButton.center = CGPointMake(self.frame.size.width * 0.5 + 1.5*buttonW, self.frame.size.height * 0.5-17);
    }else{
        self.publishButton.center = CGPointMake(self.frame.size.width * 0.5 + 1.5*buttonW, self.frame.size.height * 0.5);
    }
}


- (void)publishClick {
    NSLog(@"点击了");
    if (self.plusBtnClick) {
        self.plusBtnClick();
    }
}


@end
