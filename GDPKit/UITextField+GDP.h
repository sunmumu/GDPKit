//
//  UITextField+GDP.h
//  HaiPai
//
//  Created by solin on 2019/8/29.
//  Copyright © 2019 solin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (GDP)

// MARK: - Change 修改
/// 修改 placeholder文字颜色
/// @param textField textField
/// @param placeholderColor 文字颜色
+ (void)changePlaceholderColor:(UITextField *)textField placeholderColor:(UIColor *)placeholderColor;

@end

NS_ASSUME_NONNULL_END
