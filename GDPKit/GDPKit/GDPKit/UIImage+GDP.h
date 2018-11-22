//  Created by sunmumu

#import <UIKit/UIKit.h>

@interface UIImage (GDP)


/**
 压缩图片(UIImage)到指定大小

 @param image 传入UIImage
 @param maxLength 传入压缩到多少kb
 @return 返回maxLength大小内的UIImage
 */
+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;

/**
 通过URL获取图片
 
 @param imageUrl 图片URL
 @return UIImage
 */
+ (UIImage *)getImage:(NSString *)imageUrl;


/**
 通过颜色 创建图片

 @param color
 @return 
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
