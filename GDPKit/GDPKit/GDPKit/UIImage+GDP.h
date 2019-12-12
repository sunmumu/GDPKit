//  Created by sunmumu

#import <UIKit/UIKit.h>
#import "NSString+GDP.h"

@interface UIImage (GDP)


/**
 压缩图片(UIImage)到指定大小

 @param image 传入UIImage
 @param maxLength 传入压缩到多少kb
 @return 返回maxLength大小内的UIImage
 */
+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;

- (NSData *)compressWithMaxLength:(NSUInteger)maxLength;

/**
 压缩图片(UIImage)到指定大小
 
 @param image 传入UIImage
 @param maxLength 传入压缩到多少kb
 @return 返回maxLength大小内的UIImage
 */
+ (UIImage *)compressImage:(UIImage *)image MaxLength:(NSUInteger)maxLength;

/**
 通过颜色 创建图片

 @param color color
 @param size size
 @param radius radius
 @return UIImage
 */
+ (UIImage *)imageColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)radius;

/**
 通过URL获取图片
 
 @param imageUrl 图片URL
 @return UIImage
 */
+ (UIImage *)getImage:(NSString *)imageUrl;

/**
 通过颜色 创建图片
 
 @param color UIImage
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 通过字符串 绘制通讯录的头像

 @param string 字符串
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)acquireImageWithString:(NSString *)string font:(NSInteger)font imageSize:(CGSize)size hexString:(NSString *)hexColor;

/**
 通过字符串 绘制图片个数角标的图片
 
 @param string 字符串
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)badgeImageWithString:(NSString *)string font:(NSInteger)font imageSize:(CGSize)size hexString:(NSString *)hexColor;

@end
