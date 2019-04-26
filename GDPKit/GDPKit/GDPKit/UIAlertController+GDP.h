//
//  UIAlertController+GDP.h
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/16.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^VoidBlock)(void);

@interface UIAlertController (GDP)

+ (void)showWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle sureClickBlock:(VoidBlock)sureClickBlock;

+ (void)showWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancleClickBlock:(VoidBlock)cancleClickBlock sureClickBlock:(VoidBlock)sureClickBlock;

@end
