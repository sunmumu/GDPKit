//
//  UITextField+GDP.m
//  HaiPai
//
//  Created by solin on 2019/8/29.
//  Copyright © 2019 solin. All rights reserved.
//

#import "UITextField+GDP.h"

@implementation UITextField (GDP)

// MARK: - Change 修改
/// 修改 placeholder文字颜色
/// @param textField textField
/// @param placeholderColor 文字颜色
+ (void)changePlaceholderColor:(UITextField *)textField placeholderColor:(UIColor *)placeholderColor {
    NSMutableAttributedString *placeHolderStr = [[NSMutableAttributedString alloc] initWithString:textField.placeholder];
    NSDictionary *attrDic = @{
        @"NSFontAttributeName":[UIFont systemFontOfSize:15],
        @"NSForegroundColorAttributeName":placeholderColor
    };
    [placeHolderStr addAttributes:attrDic range:NSMakeRange(0, textField.placeholder.length)];
    textField.attributedPlaceholder = placeHolderStr;
}

@end
