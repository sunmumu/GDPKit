//
//  UILabel+GDP.m
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/23.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import "UILabel+GDP.h"

@implementation UILabel (GDP)

/**
 字体加粗
 
 @param size 加粗大小
 */
- (void)addBoldWithSize:(NSInteger)size {
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:size]];
}

- (void)addBoldWithSize:(NSInteger)size range:(NSRange)range {
    UIFont *boldFont = [UIFont boldSystemFontOfSize:size];
    NSString *string = self.text;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    [attrString addAttribute:NSFontAttributeName value:boldFont range:range];//设置Text这四个字母的字体为粗体
    self.attributedText = attrString;
}

/**
 字体加粗和倾斜
 
 @param size 加粗大小
 */
- (void)addBoldAndObliqueWithSize:(NSInteger)size {
    [self setFont:[UIFont fontWithName:@"Helvetica-BoldOblique" size:size]];
}

/**
 文本置顶
 */
- (void)alignTop {
    if ([self.text isKindOfClass:[NSNull class]])
        return;
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    int num = size.height/self.font.lineHeight;
    if (num < self.numberOfLines) {
        NSString *str = self.text;
        for (int i=0; i<self.numberOfLines-num; i++) {
            str = [str stringByAppendingString:@"\n "];
        }
        self.text = str;
    }
}

/**
 文本置底
 */
- (void)alignBottom {
    CGSize fontSize = [self.text sizeWithFont:self.font];
    
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    
    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    
    for(int i=0; i< newLinesToPad; i++) {
        self.text = [NSString stringWithFormat:@" \n%@",self.text];
    }
}

/**
 添加行间距

 @param spa 间距
 */
- (void) addLabelSpasing:(CGFloat)spa {
    if ([self.text isKindOfClass:[NSNull class]] || !self.text)
        return;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = spa;
    [attr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.text.length)];
    self.attributedText = attr;
}

/**
 修改字体大小
 
 @param fontSize 字体大小
 @param range 范围
 */
- (void) changeLabelfont:(CGFloat)fontSize range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
    self.attributedText = attr;
}

/**
 修改字体颜色

 @param color color description
 @param range range description
 */
- (void)changeLabelcolor:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attr addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attr;
}

/**
 添加下划线 修改字体颜色 范围
 
 @param color color
 @param fontSize fontSize description
 @param range range description
 */
- (void)changeLabelAddLinecolor:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attr addAttribute:NSForegroundColorAttributeName value:color range:range];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 3;
    [attr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.text.length)];
    self.attributedText = attr;
}

/**
 修改字体颜色 字体大小
 
 @param color color description
 @param range range description
 */
- (void)changeLabelcolor:(UIColor *)color font:(CGFloat)fontSize range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
    [attr addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attr;
}

/**
 添加删除线
 
 @param color color description
 @param range range description
 */
- (void)addDeleteLineColor:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:range];
    [attr addAttribute:NSStrikethroughColorAttributeName value:color range:range];
    self.attributedText = attr;
}

/**
 修改字体颜色 字体大小 删除线
 
 @param color color description
 @param fontSize fontSize description
 @param del del description
 @param range range description
 */
- (void)changeLabelcolor:(UIColor *)color font:(CGFloat)fontSize delColor:(UIColor *)del range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
    [attr addAttribute:NSForegroundColorAttributeName value:color range:range];
    [attr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:range];
    [attr addAttribute:NSStrikethroughColorAttributeName value:color range:range];
    self.attributedText = attr;
}

/**
 添加下划线
 
 @param color color description
 @param range range description
 */
- (void)addUnderlineColor:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    [attr addAttribute:NSStrikethroughColorAttributeName value:color range:range];
    self.attributedText = attr;
}

@end
