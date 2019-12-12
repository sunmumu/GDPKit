//  Created by sunmumu

#import "UIImage+GDP.h"

#define CHECK_CLASS_NSSTRING(IPHONESTR) [[IPHONESTR class] isSubclassOfClass:[NSString class]] ? YES:NO
#define CHECK_NOT_NSSTRING_OR_EMPTY_NSSTRING(IPHONESTR)  (CHECK_CLASS_NSSTRING(IPHONESTR) == YES) ? ((IPHONESTR == nil || [IPHONESTR isEqualToString:@""]) ? ((IPHONESTR = @""), YES):NO):YES
#define CHECK_NOT_EMPTY_NSSTRING(IPHONESTR) (CHECK_NOT_NSSTRING_OR_EMPTY_NSSTRING(IPHONESTR) == YES) ? NO:YES

#define HEXCOLOR(rgbValue)                              [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation UIImage (GDP)

/**
 压缩图片(UIImage)到指定大小
 
 @param image 传入UIImage
 @param maxLength 传入压缩到多少kb
 @return 返回maxLength大小内的UIImage
 */
+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength {
    
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

- (NSData *)compressWithMaxLength:(NSUInteger)maxLength {
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
    if (data.length < maxLength) return data;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(self, compression);
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

+ (UIImage *)compressImage:(UIImage *)image MaxLength:(NSUInteger)maxLength {
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

/**
 通过URL获取图片
 
 @param imageUrl 图片URL
 @return UIImage
 */
+ (UIImage *)getImage:(NSString *)imageUrl {
    UIImage *image;
    if (CHECK_NOT_EMPTY_NSSTRING(imageUrl)) {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
    }
    return image;
}

/**
 通过颜色 创建图片
 
 @param color color
 @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 10, 40); //宽高 1.0只要有值就够了
    UIGraphicsBeginImageContext(rect.size); //在这个范围内开启一段上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);//在这段上下文中获取到颜色UIColor
    CGContextFillRect(context, rect);//用这个颜色填充这个上下文
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//从这段上下文中获取Image属性,,,结束
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 通过字符串 绘制图片个数 角标的图片
 
 @param string 字符串
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)badgeImageWithString:(NSString *)string font:(NSInteger)font imageSize:(CGSize)size hexString:(NSString *)hexColor {
    if (string.length < 1 || [string integerValue] == 1) {
        return [UIImage new];
    }
    NSString *firstString = [string substringWithRange:NSMakeRange(0, 1)];
    return [UIImage createImageWithString:firstString font:font imageSize:size hexString:hexColor];
}

/**
 通过字符串 绘制通讯录的头像
 
 @param string 字符串
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)acquireImageWithString:(NSString *)string font:(NSInteger)font imageSize:(CGSize)size hexString:(NSString *)hexColor {
    NSString *firstString = [NSString firstCharactorWithString:string];
    return [UIImage createImageWithString:firstString font:font imageSize:size hexString:hexColor];
}

// 根据nikeName绘制图片
+ (UIImage *)createImageWithString:(NSString *)name font:(NSInteger)font imageSize:(CGSize)size hexString:(NSString*)hexColor {
    UIImage *image = [UIImage imageColor:[UIImage colorWithHexString:hexColor alpha:0.5] size:size cornerRadius:size.width / 2];
    UIGraphicsBeginImageContextWithOptions (size, NO , 0.0 );
    [image drawAtPoint : CGPointMake ( 0 , 0 )];
    
    // 获得一个位图图形上下文
    CGContextRef context= UIGraphicsGetCurrentContext ();
    CGContextDrawPath (context, kCGPathStroke);
    
    // 画名字
    CGSize nameSize = [name sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]}];
    [name drawAtPoint : CGPointMake ( (size.width  - nameSize.width) / 2 , (size.height  - nameSize.height) / 2 ) withAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize:font], NSForegroundColorAttributeName :HEXCOLOR(0Xffffff)} ];
    
    // 返回绘制的新图形
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return newImage;
    
}

+ (UIImage *)imageColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)radius {
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

+ (id)colorWithHexString:(NSString*)hexColor alpha:(CGFloat)alpha {
    
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

// 按规则截取nikeName
+ (NSString *)JW_dealWithNikeName:(NSString *)nikeName {
    // 筛除部分特殊符号
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"【】"];
    nikeName = [nikeName stringByTrimmingCharactersInSet:set];
    NSString *showName = @"";
    NSString *tempName = @"";
    
    NSRange range1 = [nikeName rangeOfString:@"-"];
    
    if (range1.length) {
        // 含有“-”
        tempName = [nikeName substringToIndex:range1.location];
    }
    else {
        // 不含“-”
        tempName = nikeName;
    }
    
    NSRange range2 = [tempName rangeOfString:@"("];
    
    if (range2.length) {
        // 含有“(”
        tempName = [tempName substringToIndex:range2.location];
    }
    else {
        // 不含“(”
        tempName = tempName;
    }
    
    if ([UIImage JW_isStringContainLetterWith:tempName]) {
        // 含有字母取前两个
        showName = [tempName substringToIndex:1];
    }
    else {
        // 不含字母
        if (!tempName.length) {
            
        }
        else if (tempName.length == 1)
        {
            showName = [tempName substringToIndex:1];
        }
        else if (tempName.length == 1)
        {
            showName = [tempName substringToIndex:1];
        }
        else if (tempName.length == 3)
        {
            showName = [tempName substringFromIndex:1];
        }
        else if (tempName.length == 4)
        {
            showName = [tempName substringFromIndex:1];
        }
        else {
            showName = [tempName substringToIndex:1];
        }
    }
    return showName;
}

// 检查是否含有字母
+ (BOOL)JW_isStringContainLetterWith:(NSString *)str {
    if (!str) {
        return NO;
    }
    NSRegularExpression *numberRegular = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSInteger count = [numberRegular numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    //count是str中包含[A-Za-z]数字的个数，只要count>0，说明str中包含数字
    if (count > 0) {
        return YES;
    }
    return NO;
}

@end
