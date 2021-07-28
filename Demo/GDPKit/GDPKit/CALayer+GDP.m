//
//  CALayer+GDP.m
//  HanYuanSchool
//
//  Created by sun on 2021/7/28.
//  Copyright © 2021 hanyuan. All rights reserved.
//

#import "CALayer+GDP.h"

@implementation CALayer (GDP)

/// 左右摇动动画
- (void)gdp_shake {
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat s = 8;
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    //时长
    kfa.duration = 0.3f;
    //重复
    kfa.repeatCount = 2;
    //移除
    kfa.removedOnCompletion = YES;
    [self addAnimation:kfa forKey:@"shake"];
}

@end
