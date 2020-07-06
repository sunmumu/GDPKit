//
//  UIAlertController+GDP.m
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/16.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import "UIAlertController+GDP.h"

@implementation UIAlertController (GDP)

// MARK: - Show 显示
/// 显示 确定 弹框
/// @param target 执行者
/// @param title 标题
/// @param message 消息
/// @param preferredStyle 弹框样式
/// @param sureClickBlock 点击回调
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


/// 显示 确定和取消 弹框
/// @param target 执行者
/// @param title 标题
/// @param message 消息
/// @param preferredStyle 弹框样式
/// @param cancleClickBlock 点击回调
/// @param sureClickBlock 点击回调
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


/// 显示 确定 弹框
/// @param target 执行者
/// @param title 标题
/// @param message 消息
/// @param sureTitle 确定按钮的标题
/// @param sureClickBlock 点击回调
+ (void)showSureActionStyleAlertWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message sureTitle:(NSString *)sureTitle sureClickBlock:(StringBlock)sureClickBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (sureClickBlock) {
            sureClickBlock(sureTitle);
        }
    }];
    [alertController addAction:sureAction];
    [target presentViewController:alertController animated:YES completion:nil];
}


/// 显示 确定和取消 弹框
/// @param target 执行者
/// @param title 标题
/// @param message 消息
/// @param sureTitle 确定按钮的标题
/// @param cancleTitle 取消按钮的标题
/// @param preferredStyle 弹框样式
/// @param sureClickBlock 点击回调
/// @param cancleClickBlock 点击回调
+ (void)showSureAndCancleActionWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message sureTitle:(NSString *)sureTitle cancleTitle:(NSString *)cancleTitle  preferredStyle:(UIAlertControllerStyle)preferredStyle sureClickBlock:(StringBlock)sureClickBlock cancleClickBlock:(StringBlock)cancleClickBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureClickBlock) {
            sureClickBlock(sureTitle);
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancleClickBlock) {
            cancleClickBlock(cancleTitle);
        }
    }];
    [alertController addAction:sureAction];
    [alertController addAction:cancelAction];
    [target presentViewController:alertController animated:YES completion:nil];
}


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
+ (void)showSixActionSheetWithTarget:(UIViewController *)target title:(NSString *)title message:(NSString *)message firstTitle:(NSString *)firstTitle secondTitle:(NSString *)secondTitle thirdTitle:(NSString *)thirdTitle fourthTitle:(NSString *)fourthTitle fifthTitle:(NSString *)fifthTitle sixthCancleTitle:(NSString *)sixthCancleTitle  firstClickBlock:(StringBlock)firstClickBlock secondClickBlock:(StringBlock)secondClickBlock thirdClickBlock:(StringBlock)thirdClickBlock fourthClickBlock:(StringBlock)fourthClickBlock fifthClickBlock:(StringBlock)fifthClickBlock sixthCancleClickBlock:(StringBlock)sixthCancleClickBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *sureAction1 = [UIAlertAction actionWithTitle:firstTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (firstClickBlock) {
            firstClickBlock(firstTitle);
        }
    }];
    UIAlertAction *sureAction2 = [UIAlertAction actionWithTitle:secondTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (secondClickBlock) {
            secondClickBlock(secondTitle);
        }
    }];
    UIAlertAction *sureAction3 = [UIAlertAction actionWithTitle:thirdTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (thirdClickBlock) {
            thirdClickBlock(thirdTitle);
        }
    }];
    UIAlertAction *sureAction4 = [UIAlertAction actionWithTitle:fourthTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (fourthClickBlock) {
            fourthClickBlock(fourthTitle);
        }
    }];
    UIAlertAction *sureAction5 = [UIAlertAction actionWithTitle:fifthTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (fifthClickBlock) {
            fifthClickBlock(fifthTitle);
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:sixthCancleTitle style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:sureAction1];
    [alertController addAction:sureAction2];
    [alertController addAction:sureAction3];
    [alertController addAction:sureAction4];
    [alertController addAction:sureAction5];
    [alertController addAction:cancelAction];
    [target presentViewController:alertController animated:YES completion:nil];
}

@end
