//
//  UITabBar+GDP.m
//  HaiPai
//
//  Created by solin on 2019/9/4.
//  Copyright © 2019 solin. All rights reserved.
//

#import "UITabBar+GDP.h"

@implementation UITabBar (GDP)

/// 显示 角标个数 指定tabbar
/// @param tabBar tabBar
/// @param index 下标
/// @param count 角标个数
+ (void)showBadge:(UITabBar *)tabBar index:(int)index WithCount:(NSInteger)count tabBarCounts:(int)tabBarCounts{
    //移除之前的圆点
    [tabBar removeBadgeOnItemIndex:index];
    
    //新建圆点
    UILabel *badgeView = [[UILabel alloc]init];
    badgeView.textColor = [UIColor whiteColor];
    badgeView.text = [NSString stringWithFormat:@"%ld",count];
    badgeView.font = [UIFont systemFontOfSize:10];
    badgeView.textAlignment = NSTextAlignmentCenter;
    badgeView.tag = 10000 + index;
    badgeView.layer.cornerRadius = 7.5;//圆形
    badgeView.clipsToBounds = YES;
    badgeView.backgroundColor = [UIColor redColor];//颜色
    CGRect tabFrame = tabBar.frame;
    
    //位置
    float percentX = (index +0.6) / tabBarCounts;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height-3);
    badgeView.frame = CGRectMake(x, y, 15, 15);//圆形大小为10
    [tabBar addSubview:badgeView];
}


/// 显示 角标圆点 指定tabbar
/// @param tabBar tabBar
/// @param index 下标
+ (void)showBadge:(UITabBar *)tabBar index:(int)index tabBarCounts:(int)tabBarCounts{
    //移除之前的圆点
    [tabBar removeBadgeOnItemIndex:index];
    
    //新建圆点
    UILabel *badgeView = [[UILabel alloc]init];
    badgeView.textColor = [UIColor whiteColor];
//    badgeView.text = [NSString stringWithFormat:@"%ld",count];
    badgeView.font = [UIFont systemFontOfSize:10];
    badgeView.textAlignment = NSTextAlignmentCenter;
    badgeView.tag = 10000 + index;
    badgeView.layer.cornerRadius = 3.5;//圆形
    badgeView.clipsToBounds = YES;
    badgeView.backgroundColor = [UIColor redColor];//颜色
    CGRect tabFrame = tabBar.frame;
    
    //位置
    float percentX = (index +0.6) / tabBarCounts;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height-3);
    badgeView.frame = CGRectMake(x, y, 7, 7);//圆形大小为10
    [tabBar addSubview:badgeView];
}

/// 隐藏角标 指定tabbar
/// @param tabBar tabBar
/// @param index 下标
+ (void)hideBadge:(UITabBar *)tabBar index:(int)index {
    //移除
    [tabBar removeBadgeOnItemIndex:index];
}

//移除圆点
- (void)removeBadgeOnItemIndex:(int)index{
    for (UIView *subView in self.subviews) {
        if (subView.tag == 10000+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
