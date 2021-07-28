//
//  CALayer+GDP.h
//  HanYuanSchool
//
//  Created by sun on 2021/7/28.
//  Copyright © 2021 hanyuan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (GDP)

/// 左右摇动动画
- (void)gdp_shake;

@end

NS_ASSUME_NONNULL_END
