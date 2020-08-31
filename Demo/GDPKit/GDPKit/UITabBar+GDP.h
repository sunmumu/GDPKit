//
//  UITabBar+GDP.h
//  HaiPai
//
//  Created by solin on 2019/9/4.
//  Copyright © 2019 solin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (GDP)

/// 显示 角标个数 指定tabbar
/// @param tabBar tabBar
/// @param index 下标
/// @param count 角标个数
+ (void)showBadge:(UITabBar *)tabBar index:(int)index WithCount:(NSInteger)count tabBarCounts:(int)tabBarCounts;


/// 显示 角标圆点 指定tabbar
/// @param tabBar tabBar
/// @param index 下标
+ (void)showBadge:(UITabBar *)tabBar index:(int)index tabBarCounts:(int)tabBarCounts;

/// 隐藏角标 指定tabbar
/// @param tabBar tabBar
/// @param index 下标
+ (void)hideBadge:(UITabBar *)tabBar index:(int)index;

@end

NS_ASSUME_NONNULL_END
