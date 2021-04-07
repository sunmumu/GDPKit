//
//  UILabel+GDP.m
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/23.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import "UILabel+GDP.h"
#import "NSString+GDP.h"

@implementation UILabel (GDP)

// MARK: - Change
/// 文本置顶
/// @param label label
+ (void)changeTextAlignTop:(UILabel *)label {
    if ([label.text isKindOfClass:[NSNull class]])
        return;
    CGSize size = [label sizeThatFits:CGSizeMake(label.frame.size.width, MAXFLOAT)];
    int num = size.height/label.font.lineHeight;
    if (num < label.numberOfLines) {
        NSString *str = label.text;
        for (int i=0; i<label.numberOfLines-num; i++) {
            str = [str stringByAppendingString:@"\n "];
        }
        label.text = str;
    }
}

/// 文本置底
/// @param label label
+ (void)changeTextAlignBottom:(UILabel *)label {
    CGSize fontSize = [label.text sizeWithFont:label.font];
    
    double finalHeight = fontSize.height * label.numberOfLines;
    double finalWidth = label.frame.size.width;    //expected width of label
    
    CGSize theStringSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:label.lineBreakMode];
    
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    
    for(int i=0; i< newLinesToPad; i++) {
        label.text = [NSString stringWithFormat:@" \n%@",label.text];
    }
}

/// 修改行间距
/// @param label label
/// @param spase spase 行间距
+ (void)changeSpase:(UILabel *)label spase:(CGFloat)spase {
    if ([label.text isKindOfClass:[NSNull class]] || !label.text)
        return;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = spase;
    [attr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, label.text.length)];
    label.attributedText = attr;
}

/// 修改文字大小 指定范围
/// @param label label
/// @param fontSize 文字大小
/// @param range 范围
+ (void)changeFontSize:(UILabel *)label fontSize:(CGFloat)fontSize range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
    label.attributedText = attr;
}

/// 修改文字颜色
/// @param label label
/// @param color 文字颜色
/// @param range 范围
+ (void)changeTextColor:(UILabel *)label color:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attr addAttribute:NSForegroundColorAttributeName value:color range:range];
    label.attributedText = attr;
}

/// 修改文字颜色并添加文字下划线 范围
/// @param label label
/// @param color 文字颜色
/// @param range 范围
+ (void)changeTextColorAndAddTextUnderLine:(UILabel *)label color:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attr addAttribute:NSForegroundColorAttributeName value:color range:range];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 3;
    [attr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, label.text.length)];
    label.attributedText = attr;
}

/// 修改文字颜色 和文字大小
/// @param label label
/// @param color 文字颜色
/// @param fontSize 文字大小
/// @param range 范围
+ (void)changeTextColorAndFontSize:(UILabel *)label color:(UIColor *)color font:(CGFloat)fontSize range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
    [attr addAttribute:NSForegroundColorAttributeName value:color range:range];
    label.attributedText = attr;
}

/// 修改文字颜色 文字大小 添加删除线并设置颜色
/// @param label label
/// @param color 文字颜色
/// @param fontSize 文字大小
/// @param deleteLineColor 删除线颜色
/// @param range 范围
+ (void)changeTextColorAndFontSizeAndAddDeleteLine:(UILabel *)label color:(UIColor *)color font:(CGFloat)fontSize deleteLineColor:(UIColor *)deleteLineColor range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
    [attr addAttribute:NSForegroundColorAttributeName value:color range:range];
    [attr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:range];
    [attr addAttribute:NSStrikethroughColorAttributeName value:deleteLineColor range:range];
    label.attributedText = attr;
}


// MARK: - Add 
/// 字体加粗
/// @param label label
/// @param size 加粗大小
+ (void)addBold:(UILabel *)label size:(NSInteger)size {
    [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:size]];
}

/// 字体加粗 指定范围
/// @param label label
/// @param size 加粗大小
/// @param range 范围
+ (void)addBold:(UILabel *)label size:(NSInteger)size range:(NSRange)range {
    UIFont *boldFont = [UIFont boldSystemFontOfSize:size];
    NSString *string = label.text;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    [attrString addAttribute:NSFontAttributeName value:boldFont range:range];//设置Text这四个字母的字体为粗体
    label.attributedText = attrString;
}

/// 字体加粗和倾斜
/// @param label label
/// @param size 加粗大小
+ (void)addBoldAndOblique:(UILabel *)label size:(NSInteger)size {
    [label setFont:[UIFont fontWithName:@"Helvetica-BoldOblique" size:size]];
}

/// 添加删除线
/// @param label label
/// @param color 下划线颜色
/// @param range 范围
+ (void)addDeleteLine:(UILabel *)label color:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:range];
    [attr addAttribute:NSStrikethroughColorAttributeName value:color range:range];
    label.attributedText = attr;
}

/// 添加下划线并设置下划线颜色 指定范围
/// @param label label
/// @param underlineColor 下划线颜色
/// @param range 范围
+ (void)addUnderlineColor:(UILabel *)label underlineColor:(UIColor *)underlineColor range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    [attr addAttribute:NSStrikethroughColorAttributeName value:underlineColor range:range];
    label.attributedText = attr;
}

@end
