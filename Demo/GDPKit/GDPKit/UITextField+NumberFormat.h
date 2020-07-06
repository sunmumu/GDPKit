//
//  UITextField+NumberFormat.h
//  textField
//
//  Created by JiWuChao on 2017/11/21.
//  Copyright © 2017年 JiWuChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (NumberFormat)

/// 文字 空格格式化
/// @param textField textField
/// @param range 格式化的范围
/// @param string 字符串
/// @param blankLocation 要加的空格的位置 比如手机号11 位 如果需要 344的显示格式 空格位置就是 @[@4,@9]
/// @param limitCount 限制的长度 超过此限制长度 则不能输入 如果输入的为0 则不显示输入的长度
+ (BOOL)inputTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
     replacementString:(NSString *)string
        blankLocations:(NSArray <NSNumber *>*)blankLocation
            limitCount:(NSInteger )limitCount;

@end
