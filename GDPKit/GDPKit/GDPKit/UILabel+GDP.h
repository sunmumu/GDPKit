//
//  UILabel+GDP.h
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/23.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (GDP)

/**
 文本置顶

 @return nil
 */
- (void)alignTop;

/**
 添加行间距

 @return nil
 */
- (void)addLabelSpasing:(CGFloat)spa;

/**
 修改字体大小

 @param fontSize 字体大小
 @param range 范围
 */
- (void)changeLabelfont:(CGFloat)fontSize range:(NSRange)range;

/**
 修改字体颜色

 @param color UIColor
 @param range range
 */
- (void)changeLabelcolor:(UIColor *)color range:(NSRange)range;

/**
 修改字体颜色 字体大小 范围

 @param color color
 @param fontSize fontSize description
 @param range range description
 */
- (void)changeLabelcolor:(UIColor *)color font:(CGFloat)fontSize range:(NSRange)range;

/**
 添加下划线

 @param color color description
 @param range range description
 */
- (void)changeLabelAddLinecolor:(UIColor *)color range:(NSRange)range;

/**
 添加删除线

 @param color color description
 @param range range description
 */
- (void)addDeleteLineColor:(UIColor *)color range:(NSRange)range;

/**
 修改字体颜色 字体大小 删除线

 @param color color description
 @param fontSize fontSize description
 @param del del description
 @param range range description
 */
- (void)changeLabelcolor:(UIColor *)color font:(CGFloat)fontSize delColor:(UIColor *)del range:(NSRange)range;

/**
 添加下划线

 @param color color description
 @param range range description
 */
- (void)addUnderlineColor:(UIColor *)color range:(NSRange)range;

@end
