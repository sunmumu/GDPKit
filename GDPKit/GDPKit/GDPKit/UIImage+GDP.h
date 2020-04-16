//  Created by sunmumu

#import <UIKit/UIKit.h>
#import "NSString+GDP.h"

@interface UIImage (GDP)

// MARK: - Change 修改
/// 压缩图片 到指定大小容量
/// @param image image
/// @param maxLength 指定大小容量
+ (UIImage *)changeImageToMaxLength:(UIImage *)image maxLength:(NSUInteger)maxLength;

/// 压缩图片 到指定大小容量 返回NSData
/// @param image image
/// @param maxLength 指定大小容量
+ (NSData *)changeImageToMaxLengthData:(UIImage *)image maxLength:(NSUInteger)maxLength;

/// 压缩图片 到指定大小容量
/// @param image image
/// @param maxLength 指定大小容量
+ (UIImage *)changeImageToMaxLengthImage:(UIImage *)image MaxLength:(NSUInteger)maxLength;


// MARK: - Get 获取
/// 获取 指定URL 下的图片
/// @param imageUrlStrig 图片URL字符串
+ (UIImage *)getImage:(NSString *)imageUrlStrig;

/// 通过颜色 创建图片
/// @param color 颜色
+ (UIImage *)getImageWithColor:(UIColor *)color;

/// 绘制图片 根据字符串
/// @param badgeString 角标字符串
/// @param font 文字大小
/// @param size 图片大小
/// @param hexColor 颜色
+ (UIImage *)getImageWithBadgeString:(NSString *)badgeString font:(NSInteger)font imageSize:(CGSize)size hexColor:(NSString *)hexColor;

/// 通过字符串 绘制通讯录的头像
/// @param string 字符串
/// @param font 字体大小
/// @param size 图片大小
/// @param hexColor 文字颜色
+ (UIImage *)getAcquireImageWithString:(NSString *)string font:(NSInteger)font imageSize:(CGSize)size hexString:(NSString *)hexColor;

/// 根据nikeName绘制图片
/// @param string 字符串
/// @param font 字体大小
/// @param size 图片大小
/// @param hexColor 文字颜色
+ (UIImage *)getImageWithString:(NSString *)string font:(NSInteger)font imageSize:(CGSize)size hexString:(NSString*)hexColor;

/// 获取 指定颜色的图片
/// @param color 颜色
/// @param size 图片大小
/// @param radius 圆角
+ (UIImage *)getImageWithBackgroundColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)radius;

/// 获取 颜色 根据HexString
/// @param hexColor 16进制颜色字符串
/// @param alpha 透明度
+ (UIColor *)getColorWithHexString:(NSString*)hexColor alpha:(CGFloat)alpha;

@end
