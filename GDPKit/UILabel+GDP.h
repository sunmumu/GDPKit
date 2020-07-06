//
//  UILabel+GDP.h
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/23.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (GDP)

// MARK: - Change 修改
/// 文本置顶
/// @param label label
+ (void)changeTextAlignTop:(UILabel *)label;

/// 文本置底
/// @param label label
+ (void)changeTextAlignBottom:(UILabel *)label;

/// 修改行间距
/// @param label label
/// @param spase spase 行间距
+ (void)changeSpase:(UILabel *)label spase:(CGFloat)spase;

/// 修改文字大小 指定范围
/// @param label label
/// @param fontSize 文字大小
/// @param range 范围
+ (void)changeFontSize:(UILabel *)label fontSize:(CGFloat)fontSize range:(NSRange)range;

/// 修改文字颜色
/// @param label label
/// @param color 文字颜色
/// @param range 范围
+ (void)changeTextColor:(UILabel *)label color:(UIColor *)color range:(NSRange)range;

/// 修改文字颜色并添加文字下划线 范围
/// @param label label
/// @param color 文字颜色
/// @param range 范围
+ (void)changeTextColorAndAddTextUnderLine:(UILabel *)label color:(UIColor *)color range:(NSRange)range;

/// 修改文字颜色 和文字大小
/// @param label label
/// @param color 文字颜色
/// @param fontSize 文字大小
/// @param range 范围
+ (void)changeTextColorAndFontSize:(UILabel *)label color:(UIColor *)color font:(CGFloat)fontSize range:(NSRange)range;

/// 修改文字颜色 文字大小 添加删除线并设置颜色
/// @param label label
/// @param color 文字颜色
/// @param fontSize 文字大小
/// @param deleteLineColor 删除线颜色
/// @param range 范围
+ (void)changeTextColorAndFontSizeAndAddDeleteLine:(UILabel *)label color:(UIColor *)color font:(CGFloat)fontSize deleteLineColor:(UIColor *)deleteLineColor range:(NSRange)range;


// MARK: - Add 添加
/// 字体加粗
/// @param label label
/// @param size 加粗大小
+ (void)addBold:(UILabel *)label size:(NSInteger)size;

/// 字体加粗 指定范围
/// @param label label
/// @param size 加粗大小
/// @param range 范围
+ (void)addBold:(UILabel *)label size:(NSInteger)size range:(NSRange)range;

/// 字体加粗和倾斜
/// @param label label
/// @param size 加粗大小
+ (void)addBoldAndOblique:(UILabel *)label size:(NSInteger)size;

/// 添加删除线
/// @param label label
/// @param color 下划线颜色
/// @param range 范围
+ (void)addDeleteLine:(UILabel *)label color:(UIColor *)color range:(NSRange)range;

/// 添加下划线并设置下划线颜色 指定范围
/// @param label label
/// @param underlineColor 下划线颜色
/// @param range 范围
+ (void)addUnderlineColor:(UILabel *)label underlineColor:(UIColor *)underlineColor range:(NSRange)range;


@end
