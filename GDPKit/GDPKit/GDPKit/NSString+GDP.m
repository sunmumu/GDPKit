

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
    if (appVersion.length < 5) {
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

/**
 未转成UTF8格式的json 转成NSString
 
 @param hexString 十六进制的字符串
 @return 十进制 NSInteger
 */
+ (NSString *)dictionaryToJson:(NSDictionary *)dic {
    if (!dic) {
        return @"";
    }
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/**
 判断字符串是否全是数字整形
 */
+ (BOOL)isPureInt:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/**
 是否为邮箱地址
 
 @return BOOL
 */
- (BOOL)isEmailAddress {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
