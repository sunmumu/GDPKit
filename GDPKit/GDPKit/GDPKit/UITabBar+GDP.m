//
//  UITabBar+GDP.m
//  HaiPai
//
//  Created by solin on 2019/9/4.
//  Copyright © 2019 solin. All rights reserved.
//

#import "UITabBar+GDP.h"

@implementation UITabBar (GDP)

//显示
- (void)showBadgeOnItemIndex:(int)index WithCount:(NSInteger)count{
    //移除之前的圆点
    [self removeBadgeOnItemIndex:index];
    
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
    CGRect tabFrame = self.frame;
    
    //位置
    float percentX = (index +0.6) / 4;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height-3);
    badgeView.frame = CGRectMake(x, y, 15, 15);//圆形大小为10
    [self addSubview:badgeView];
}

- (void)showBadgeOnItemIndex:(int)index {
    //移除之前的圆点
    [self removeBadgeOnItemIndex:index];
    
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
    CGRect tabFrame = self.frame;
    
    //位置
    float percentX = (index +0.6) / 4;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height-3);
    badgeView.frame = CGRectMake(x, y, 7, 7);//圆形大小为10
    [self addSubview:badgeView];
}

//隐藏
- (void)hideBadgeOnItemIndex:(int)index{
    //移除
    [self removeBadgeOnItemIndex:index];
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
