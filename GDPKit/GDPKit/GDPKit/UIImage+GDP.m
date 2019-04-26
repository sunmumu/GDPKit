//  Created by sunmumu

#import "UIImage+GDP.h"

#define CHECK_CLASS_NSSTRING(IPHONESTR) [[IPHONESTR class] isSubclassOfClass:[NSString class]] ? YES:NO
#define CHECK_NOT_NSSTRING_OR_EMPTY_NSSTRING(IPHONESTR)  (CHECK_CLASS_NSSTRING(IPHONESTR) == YES) ? ((IPHONESTR == nil || [IPHONESTR isEqualToString:@""]) ? ((IPHONESTR = @""), YES):NO):YES
#define CHECK_NOT_EMPTY_NSSTRING(IPHONESTR) (CHECK_NOT_NSSTRING_OR_EMPTY_NSSTRING(IPHONESTR) == YES) ? NO:YES


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
    NSLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
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
 通过字符串 绘制通讯录的头像
 
 @param string 字符串
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)acquireImageWithString:(NSString *)string imageSize:(CGSize)size hexString:(NSString *)hexColor {
    NSString *firstString = [NSString firstCharactorWithString:string];
    return [UIImage createImageWithString:firstString imageSize:size hexString:hexColor];
}

// 根据nikeName绘制图片
+ (UIImage *)createImageWithString:(NSString *)name imageSize:(CGSize)size hexString:(NSString*)hexColor {
    UIImage *image = [UIImage imageColor:[UIImage colorWithHexString:hexColor alpha:1.0] size:size cornerRadius:size.width / 2];
    UIGraphicsBeginImageContextWithOptions (size, NO , 0.0 );
    [image drawAtPoint : CGPointMake ( 0 , 0 )];
    
    // 获得一个位图图形上下文
    CGContextRef context= UIGraphicsGetCurrentContext ();
    CGContextDrawPath (context, kCGPathStroke );
    
    // 画名字
    CGSize nameSize = [name sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:24]}];
    [name drawAtPoint : CGPointMake ( (size.width  - nameSize.width) / 2 , (size.height  - nameSize.height) / 2 ) withAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize:24], NSForegroundColorAttributeName :HEXCOLOR(0Xffffff)} ];
    
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
