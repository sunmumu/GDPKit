//  Created by sunmumu

#import "UIImage+GDP.h"

#define ISSTRINGCLASS(IPHONESTR) [[IPHONESTR class] isSubclassOfClass:[NSString class]] ? YES:NO
#define ISNILSTRING(IPHONESTR)  (ISSTRINGCLASS(IPHONESTR) == YES) ? ((IPHONESTR == nil || [IPHONESTR isEqualToString:@""]) ? ((IPHONESTR = @""), YES):NO):YES
#define ISNOTNILSTR(IPHONESTR) (ISNILSTRING(IPHONESTR) == YES) ? NO:YES


@implementation UIImage (GDP)

/**
 压缩图片(UIImage)到指定大小
 
 @param image 传入UIImage
 @param maxLength 传入压缩到多少kb
 @return 返回maxLength大小内的UIImage
 */
+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength {
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) {
        return image;
    }
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) {
        return resultImage;
    }
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    return resultImage;
}

/**
 通过URL获取图片
 
 @param imageUrl 图片URL
 @return UIImage
 */
+ (UIImage *)getImage:(NSString *)imageUrl {
    UIImage *image;
    if (ISNOTNILSTR(imageUrl)) {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
    }
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f); //宽高 1.0只要有值就够了
    UIGraphicsBeginImageContext(rect.size); //在这个范围内开启一段上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);//在这段上下文中获取到颜色UIColor
    CGContextFillRect(context, rect);//用这个颜色填充这个上下文
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//从这段上下文中获取Image属性,,,结束
    UIGraphicsEndImageContext();
    
    return image;
}

@end
