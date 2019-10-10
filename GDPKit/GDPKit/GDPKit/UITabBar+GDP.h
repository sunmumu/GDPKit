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

- (void)showBadgeOnItemIndex:(int)index WithCount:(NSInteger)count;   //显示
- (void)showBadgeOnItemIndex:(int)index;
- (void)hideBadgeOnItemIndex:(int)index; //隐藏

@end

NS_ASSUME_NONNULL_END
