//
//  UIAlertController+GDP.h
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/16.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^VoidBlock)(void);
typedef void (^StringBlock)(NSString *result);

@interface UIAlertController (GDP)

// MARK: - Show
/// 显示 确定 弹框
/// @param target 执行者
/// @param title 标题
/// @param message 消息
/// @param preferredStyle 弹框样式
/// @param sureClickBlock 点击回调
+ (void)showWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle sureClickBlock:(VoidBlock)sureClickBlock;


/// 显示 确定和取消 弹框
/// @param target 执行者
/// @param title 标题
/// @param message 消息
/// @param preferredStyle 弹框样式
/// @param cancleClickBlock 点击回调
/// @param sureClickBlock 点击回调
+ (void)showWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancleClickBlock:(VoidBlock)cancleClickBlock sureClickBlock:(VoidBlock)sureClickBlock;


/// 显示 确定 弹框
/// @param target 执行者
/// @param title 标题
/// @param message 消息
/// @param sureTitle 确定按钮的标题
/// @param sureClickBlock 点击回调
+ (void)showSureActionStyleAlertWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message sureTitle:(NSString *)sureTitle sureClickBlock:(StringBlock)sureClickBlock;


/// 显示 确定和取消 弹框
/// @param target 执行者
/// @param title 标题
/// @param message 消息
/// @param sureTitle 确定按钮的标题
/// @param cancleTitle 取消按钮的标题
/// @param preferredStyle 弹框样式
/// @param sureClickBlock 点击回调
/// @param cancleClickBlock 点击回调
+ (void)showSureAndCancleActionWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message sureTitle:(NSString *)sureTitle cancleTitle:(NSString *)cancleTitle  preferredStyle:(UIAlertControllerStyle)preferredStyle sureClickBlock:(StringBlock)sureClickBlock cancleClickBlock:(StringBlock)cancleClickBlock;


/// 显示 六个选择 弹框
/// @param target 执行者
/// @param title 标题
/// @param message 消息
/// @param firstTitle 标题
/// @param secondTitle 标题
/// @param thirdTitle 标题
/// @param fourthTitle 标题
/// @param fifthTitle 标题
/// @param sixthCancleTitle 标题
/// @param firstClickBlock 点击回调
/// @param secondClickBlock 点击回调
/// @param thirdClickBlock 点击回调
/// @param fourthClickBlock 点击回调
/// @param fifthClickBlock 点击回调
/// @param sixthCancleClickBlock 点击回调
+ (void)showSixActionSheetWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message firstTitle:(NSString *)firstTitle secondTitle:(NSString *)secondTitle thirdTitle:(NSString *)thirdTitle fourthTitle:(NSString *)fourthTitle fifthTitle:(NSString *)fifthTitle sixthCancleTitle:(NSString *)sixthCancleTitle  firstClickBlock:(StringBlock)firstClickBlock secondClickBlock:(StringBlock)secondClickBlock thirdClickBlock:(StringBlock)thirdClickBlock fourthClickBlock:(StringBlock)fourthClickBlock fifthClickBlock:(StringBlock)fifthClickBlock sixthCancleClickBlock:(StringBlock)sixthCancleClickBlock;

@end
