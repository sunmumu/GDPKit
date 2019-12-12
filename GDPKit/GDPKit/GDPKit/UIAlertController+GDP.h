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

+ (void)showWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle sureClickBlock:(VoidBlock)sureClickBlock;

+ (void)showWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancleClickBlock:(VoidBlock)cancleClickBlock sureClickBlock:(VoidBlock)sureClickBlock;

+ (void)showSureActionStyleAlertWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message sureTitle:(NSString *)sureTitle sureClickBlock:(StringBlock)sureClickBlock;

+ (void)showSureAndCancleActionWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message sureTitle:(NSString *)sureTitle cancleTitle:(NSString *)cancleTitle  preferredStyle:(UIAlertControllerStyle)preferredStyle sureClickBlock:(StringBlock)sureClickBlock cancleClickBlock:(StringBlock)cancleClickBlock;

+ (void)showSixActionSheetWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message firstTitle:(NSString *)firstTitle secondTitle:(NSString *)secondTitle thirdTitle:(NSString *)thirdTitle fourthTitle:(NSString *)fourthTitle fifthTitle:(NSString *)fifthTitle sixthCancleTitle:(NSString *)sixthCancleTitle  firstClickBlock:(StringBlock)firstClickBlock secondClickBlock:(StringBlock)secondClickBlock thirdClickBlock:(StringBlock)thirdClickBlock fourthClickBlock:(StringBlock)fourthClickBlock fifthClickBlock:(StringBlock)fifthClickBlock sixthCancleClickBlock:(StringBlock)sixthCancleClickBlock;

@end
