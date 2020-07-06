//  Created by sunmumu

#import "UIImage+GDP.h"
#import "NSString+GDP.h"

#define HEXCOLOR(rgbValue)                              [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation UIImage (GDP)

// MARK: - Change 修改
/// 压缩图片 到指定大小容量
/// @param image image
/// @param maxLength 指定大小容量
+ (UIImage *)changeImageToMaxLength:(UIImage *)image maxLength:(NSUInteger)maxLength {
    
    if (!image) {
        return image;
    }
    if (maxLength<1) {
        return image;
    }
    
    maxLength*=1024;
    
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxLength && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    NSLog(@"压缩方法一----当前大小:%fkb",(float)[imageData length]/1024.0f);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

/// 压缩图片 到指定大小容量 返回NSData
/// @param image image
/// @param maxLength 指定大小容量
+ (NSData *)changeImageToMaxLengthData:(UIImage *)image maxLength:(NSUInteger)maxLength {
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
    if (data.length < maxLength) return data;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        //NSLog(@"Compression = %.1f", compression);
        //NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    //NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
    if (data.length < maxLength) return data;
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        //NSLog(@"Ratio = %.1f", ratio);
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
        //NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
    }
    //NSLog(@"After compressing size loop, image size = %ld KB", data.length / 1024);
    return data;
}

/// 压缩图片 到指定大小容量
/// @param image image
/// @param maxLength 指定大小容量
+ (UIImage *)changeImageToMaxLengthImage:(UIImage *)image MaxLength:(NSUInteger)maxLength {
    if (!image) {
        return image;
    }
    if (maxLength<1) {
        return image;
    }
    
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
    if (data.length < maxLength) return image;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        //NSLog(@"Compression = %.1f", compression);
        //NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    //NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
    if (data.length < maxLength) return [UIImage imageWithData:data];
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        //NSLog(@"Ratio = %.1f", ratio);
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
        //NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
    }
    NSLog(@"压缩方法二----当前大小:%fkb",(float)[data length]/1024.0f);
    return [UIImage imageWithData:data];
}

/// 解析gif图片转成图片数组
/// @param data Gif Data
+ (NSMutableArray *)changeGifDataToImageArray:(NSData *)data{
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    CGImageSourceRef src = CGImageSourceCreateWithData((CFDataRef)data, NULL);
    CGFloat animationTime = 0.f;
    if (src) {
        size_t l = CGImageSourceGetCount(src);
        frames = [NSMutableArray arrayWithCapacity:l];
        for (size_t i = 0; i < l; i++) {
            CGImageRef img = CGImageSourceCreateImageAtIndex(src, i, NULL);
            NSDictionary *properties = (NSDictionary *)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(src, i, NULL));
            NSDictionary *frameProperties = [properties objectForKey:(NSString *)kCGImagePropertyGIFDictionary];
            NSNumber *delayTime = [frameProperties objectForKey:(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
            animationTime += [delayTime floatValue];
            if (img) {
                [frames addObject:[UIImage imageWithCGImage:img]];
                CGImageRelease(img);
            }
        }
        CFRelease(src);
    }
    return frames;
}


// MARK: - Get 获取
/// 获取 指定URL 下的图片
/// @param imageUrlStrig 图片URL字符串
+ (UIImage *)getImage:(NSString *)imageUrlStrig {
    UIImage *image;
    if (![NSString checkIsNullString:imageUrlStrig]) {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrlStrig]]];
    }
    return image;
}

/// 通过颜色 创建图片
/// @param color 颜色
+ (UIImage *)getImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 10, 40); //宽高 1.0只要有值就够了
    UIGraphicsBeginImageContext(rect.size); //在这个范围内开启一段上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);//在这段上下文中获取到颜色UIColor
    CGContextFillRect(context, rect);//用这个颜色填充这个上下文
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//从这段上下文中获取Image属性,,,结束
    UIGraphicsEndImageContext();
    
    return image;
}

/// 绘制图片 根据字符串
/// @param badgeString 角标字符串
/// @param font 文字大小
/// @param size 图片大小
/// @param hexColor 颜色
+ (UIImage *)getImageWithBadgeString:(NSString *)badgeString font:(NSInteger)font imageSize:(CGSize)size hexColor:(NSString *)hexColor {
    if (badgeString.length < 1 || [badgeString integerValue] == 1) {
        return [UIImage new];
    }
    NSString *firstString = [badgeString substringWithRange:NSMakeRange(0, 1)];
    return [UIImage getImageWithString:firstString font:font imageSize:size hexString:hexColor];
}

/// 通过字符串 绘制通讯录的头像
/// @param string 字符串
/// @param font 字体大小
/// @param size 图片大小
/// @param hexColor 文字颜色
+ (UIImage *)getAcquireImageWithString:(NSString *)string font:(NSInteger)font imageSize:(CGSize)size hexString:(NSString *)hexColor {
    NSString *firstString = [NSString getFirstCharactorWithString:string];
    return [UIImage getImageWithString:firstString font:font imageSize:size hexString:hexColor];
}

/// 根据nikeName绘制图片
/// @param string 字符串
/// @param font 字体大小
/// @param size 图片大小
/// @param hexColor 文字颜色
+ (UIImage *)getImageWithString:(NSString *)string font:(NSInteger)font imageSize:(CGSize)size hexString:(NSString*)hexColor {
    UIImage *image = [UIImage getImageWithBackgroundColor:[UIImage getColorWithHexString:hexColor alpha:0.5] size:size cornerRadius:size.width / 2];
    UIGraphicsBeginImageContextWithOptions (size, NO , 0.0 );
    [image drawAtPoint : CGPointMake ( 0 , 0 )];
    
    // 获得一个位图图形上下文
    CGContextRef context= UIGraphicsGetCurrentContext ();
    CGContextDrawPath (context, kCGPathStroke);
    
    // 画名字
    CGSize nameSize = [string sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]}];
    [string drawAtPoint : CGPointMake ( (size.width  - nameSize.width) / 2 , (size.height  - nameSize.height) / 2 ) withAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize:font], NSForegroundColorAttributeName :HEXCOLOR(0Xffffff)} ];
    
    // 返回绘制的新图形
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return newImage;
    
}

/// 获取 指定颜色的图片
/// @param color 颜色
/// @param size 图片大小
/// @param radius 圆角
+ (UIImage *)getImageWithBackgroundColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)radius {
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = CGSizeMake(1, 1);
    }
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(rect);
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    [colorImage drawInRect:rect];
    
    colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return colorImage;
}

/// 获取 颜色 根据HexString
/// @param hexColor 16进制颜色字符串
/// @param alpha 透明度
+ (UIColor *)getColorWithHexString:(NSString*)hexColor alpha:(CGFloat)alpha {
    
    unsigned int red,green,blue;
    NSRange range;
    
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    UIColor* retColor = [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green / 255.0f) blue:(float)(blue / 255.0f)alpha:alpha];
    return retColor;
}


@end
