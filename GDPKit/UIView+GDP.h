//
//  UIView+GDP.h
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/23.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GDP)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
/**
 时间戳为当前View的ID，适用于多重通知，方式通知重复执行
 */
@property (nonatomic, copy) NSString *timeId;

- (void)setCornerOnTop:(CGFloat)conner;

/// UIView 添加边框线
/// @param hasTopBorder 顶部边框
/// @param hasLeftBorder 左边边框
/// @param hasBottomBorder 底部边框
/// @param hasRightBorder 右边边框
/// @param borderColor 边框颜色
/// @param borderWidth 边框宽度
- (void)addBorderLineWithTop:(BOOL)hasTopBorder left:(BOOL)hasLeftBorder bottom:(BOOL)hasBottomBorder right:(BOOL)hasRightBorder borderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth;

@end
