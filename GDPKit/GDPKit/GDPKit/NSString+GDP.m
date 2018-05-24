

#import "NSString+GDP.h"
#import <UIKit/UIKit.h>

@implementation NSString (GDP)


/**
 获取APP的版本号

 @return APP版本号 例 v1.01
 */
+ (NSString *)appVersion {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = infoDic[@"CFBundleShortVersionString"];
    if (appVersion.length < 3) {
        return @"";
    }
    NSString *appVersionString = [NSString stringWithFormat:@"v%@", appVersion];
    return appVersionString;
}

/**
 十六进制的字符串 转成十进制 NSInteger

 @param hexString 十六进制的字符串
 @return 十进制 NSInteger
 */
+ (NSInteger)numberWithHexString:(NSString *)hexString {
    const char *hexChar = [hexString cStringUsingEncoding:NSUTF8StringEncoding];
    int hexNumber;
    sscanf(hexChar, "%x", &hexNumber);
    return (NSInteger)hexNumber;
}

@end
