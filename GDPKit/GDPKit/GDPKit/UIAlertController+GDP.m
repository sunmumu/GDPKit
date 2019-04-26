//
//  UIAlertController+GDP.m
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/16.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import "UIAlertController+GDP.h"

@implementation UIAlertController (GDP)

+ (void)showWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle sureClickBlock:(VoidBlock)sureClickBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureClickBlock) {
            sureClickBlock();
        }
    }];
    [alertController addAction:sureAction];
    [target presentViewController:alertController animated:YES completion:nil];
}

+ (void)showWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancleClickBlock:(VoidBlock)cancleClickBlock sureClickBlock:(VoidBlock)sureClickBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancleClickBlock) {
            cancleClickBlock();
        }
    }];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureClickBlock) {
            sureClickBlock();
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:sureAction];
    [target presentViewController:alertController animated:YES completion:nil];
}

@end
