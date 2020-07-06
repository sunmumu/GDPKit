#import "NSString+GDP.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSString (GDP)

// MARK: - Change 修改
/// 对无效字符串进行处理(字符串所有无效格式)
/// @param string 待处理字符串string
+ (NSString *)changeToUnNullString:(id)string {
    if ([string isEqual:@"NULL"]
        || [string isKindOfClass:[NSNull class]]
        || [string isEqual:[NSNull null]]
        || [string isEqual:NULL]
        || [[string class] isSubclassOfClass:[NSNull class]]
        || string == nil
        || string == NULL
        || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0
        || [string isEqualToString:@"<null>"]
        || [string isEqualToString:@"(null)"]) {
        return @"";
    } else {
        return (NSString *)string;
    }
}

/// 十六进制的字符串 转成十进制 NSInteger
/// @param hexString 十六进制的字符串
+ (NSInteger)changeHexStringToNSInteger:(NSString *)hexString {
    const char *hexChar = [hexString cStringUsingEncoding:NSUTF8StringEncoding];
    int hexNumber;
    sscanf(hexChar, "%x", &hexNumber);
    return (NSInteger)hexNumber;
}

/// 未转成UTF8格式的json 转成NSString
/// @param dic NSDictionary
+ (NSString *)changeJsonToDictionary:(NSDictionary *)dic {
    if (!dic) {
        return @"";
    }
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *resultString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return resultString;
}

/// 清除字符串的首尾空格
/// @param string 字符串
+ (NSString *)changeToUnContainSpaceString:(NSString *)string {
    NSString *resultString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return resultString;
}

/// 小数保留2位精度
/// @param string 字符串
+ (NSString *)changeToTwoDecimalString:(NSString *)string {
    if ([string componentsSeparatedByString:@"."].count>1) {
        NSArray * arr = [string componentsSeparatedByString:@"."];
        NSString *left = arr[0];
        NSString *right = arr[1];
        if (right.length>2) {
            right = [right substringWithRange:NSMakeRange(0, 2)];
        }
        return [NSString stringWithFormat:@"%@.%@", left, right];
    } else {
        return string;
    }
}

/// 去除小数点后无效字符
/// @param string 字符串
+ (NSString *)changeToUnContainEffective:(NSString *)string {
    @try {
//        string = [NSString stringToDouble:string.doubleValue];
//        string = [NSString stringToDouble:string.doubleValue];
        long len = string.length;
        for (int i = 0; i < len; i++)
        {
            if (![string  hasSuffix:@"0"])
                break;
            else
                string = [string substringToIndex:[string length]-1];
        }
        if ([string hasSuffix:@"."])//避免像2.0000这样的被解析成2.
        {
            return [string substringToIndex:[string length]-1];//s.substring(0, len - i - 1);
        }
        else
        {
            return string;
        }
    } @catch (NSException *exception) {
        return string;
    }
}

/// Int 转成 NSString
/// @param num num
+ (NSString *)changeIntToString:(int)num {
    return [NSString stringWithFormat:@"%d", num];
}

/// double 转成 NSString
/// @param num num
+ (NSString *)changeDoubleToNSIntger:(NSInteger)num {
    NSString *resuletString = @"";
    @try {
        resuletString = [NSString stringWithFormat:@"%ld", (long)num];
    } @catch (NSException *exception) {
        resuletString = @"0";
    } @finally {
        return resuletString;
    }
}

/// NSInteger 转成 NSString
/// @param num num
+ (NSString *)changeDoubleToString:(double)num {
    NSString *resuletString = @"";
    @try {
        resuletString = [NSString stringWithFormat:@"%f", num];
    } @catch (NSException *exception) {
        resuletString = @"0.0";
    } @finally {
        return resuletString;
    }
}

/// 时间戳 转成格式化时间yyyy-MM-dd 字符串
/// @param timeInteger 时间戳
+ (NSString *)changeTimeNSIntegerToFormattingTimeYMDString:(NSInteger)timeInteger {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInteger];
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"yyyy-MM-dd"];
    return [matter stringFromDate:date];
}

/// 格式化时间 yyyy-MM-dd HH:mm:ss
/// @param timeInteger 时间戳
+ (NSString *)changeTimeNSIntegerToFormattingTimeYMDHMSString:(NSInteger)timeInteger {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInteger];
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [matter stringFromDate:date];
}

/// 时间 转成 时间戳字符串
/// @param date 时间
+ (NSString *)changeDateToTimeString:(NSDate *)date {
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]*1000];
    return timeSp;
}

/// 获取字典有序value数组 对传入的字典key进行ASCII排序，然后拼接key和value成字符串
/// @param dict NSDictionary
+ (NSString *)orderValueStringWithDictionary:(NSDictionary *)dict {
    NSString *string = @"";
    
    //取出字典所有key
    NSArray *keyArray = [dict allKeys];
    
    //将key排序
    NSArray *sortedArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {
        return[obj1 compare:obj2 options:NSNumericSearch];//正序
    }];
    
    //根据key的顺序提取相应value
    for (NSString *key in sortedArray) {
        string = [NSString stringWithFormat:@"%@%@",string, key];
        string = [NSString stringWithFormat:@"%@=%@&",string,(NSString *)[dict objectForKey:key]];
//        [string stringByAppendingString:[NSString stringWithFormat:@"=%@&",(NSString *)[dict objectForKey:key]]];
    }
    string = [string substringWithRange:NSMakeRange(0, (string.length - 1))];
    return string;
}

// MARK: - CheckIs 检查是否

/// 检查是否空字符串
/// @param string id
+ (BOOL)checkIsNullString:(id)string {
    if ([string isEqual:@"NULL"]
        || [string isKindOfClass:[NSNull class]]
        || [string isEqual:[NSNull null]]
        || [string isEqual:NULL]
        || [[string class] isSubclassOfClass:[NSNull class]]
        || string == nil
        || string == NULL
        || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0
        || [string isEqualToString:@"<null>"]
        || [string isEqualToString:@"(null)"]) {
        return NO;
    } else {
        return YES;
    }
}

/// 检查是否包含某个字符串
/// @param string 字符串
/// @param containString 包含字符串
+ (BOOL)checkIsContainString:(NSString *)string containString:(NSString *)containString {
    NSRange range = [string rangeOfString:string];
    return range.length > 0 ? YES : NO;
}

/// 检查是否包含空格
/// @param string 字符串
+ (BOOL)checkisContainSpace:(NSString *)string {
    NSRange range = [string rangeOfString:@" "];
    if (range.location != NSNotFound) {
        //有空格
        return YES;
    }else {
        //没有空格
        return NO;
    }
}

/// 检查是否全是数字(不含小数点) 字符串
/// @param string 字符串
+ (BOOL)checkIsDigitalPlastic:(NSString*)string {
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

/// 检查是否邮箱格式
/// @param string 字符串
+ (BOOL)checkIsEmail:(NSString *)string {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTest evaluateWithObject:string];
}

/// 检查是否手机号码
/// @param string 字符串
+ (BOOL)checkIsPhone:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) {
        return NO;
    }
    if ([NSString checkIsNullString:string]) {
        return NO;
    }
    if ([string hasPrefix:@"86"]) {
        NSMutableString *phoneStr = [[NSMutableString alloc]initWithFormat:@"%@",string];
        string = [phoneStr substringFromIndex:2];
    }
    //手机号以13,14,15,16,17,18,198,199开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((19[89])|(13[0-9])|(14[0-9])|(15[^4,\\D])|(16[0-9])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:string];
}

/// 检查是否符合密码格式要求 (包含数字和字母, 个数: >= minLength <= maxLength)
/// @param string 字符串
/// @param minLength 最小个数
/// @param maxLength 最大个数
+ (BOOL)checkIsPassWord:(NSString *)string minLength:(NSInteger)minLength maxLength:(NSInteger)maxLength {
    if (![string isKindOfClass:[NSString class]]) {
        return NO;
    }
    if ([NSString checkIsNullString:string]) {
        return NO;
    }
    NSString *phoneRegex = [NSString stringWithFormat:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{%ld,%ld}$", minLength, maxLength];
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:string];
}

/// 检查是否身份证号码 (18位)
/// @param string 字符串
+ (BOOL)checkIsID:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) {
        return NO;
    }
    if ([NSString checkIsNullString:string]) {
        return NO;
    }
    NSString *phoneRegex = @"^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

/// 检查是否中文
/// @param string 字符串
+ (BOOL)checkIsChinese:(NSString *)string {
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:string];
}

// MARK: - Get 获取
/// 获取APP的版本号 例 1.01
+ (NSString *)getAppVersion {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = infoDic[@"CFBundleShortVersionString"];
    if (appVersion.length < 5) {
        return @"";
    }
    NSString *appVersionString = [NSString stringWithFormat:@"%@", appVersion];
    return appVersionString;
}

/// 根据字符串计算所使用的宽高
/// @param limit 所允许的宽高
/// @param font 字体
+ (CGSize)getTextsize:(NSString *)string limit:(CGSize)limit font:(UIFont *)font {
    CGSize resuletSize = [string boundingRectWithSize:limit options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return resuletSize;
}

/// 返回字符串所占用的尺寸
/// @param string 字符串
/// @param font 字体
/// @param maxSize 最大尺寸
+ (CGSize)getTextsize:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

/// 返回字符串所占用的尺寸
/// @param font 字体
/// @param maxWidth 最大尺寸
+ (CGSize)getTextsize:(NSString *)string systemFont:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize resultSize = [string boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    return resultSize;
}

/// 获取某个字符串或者汉字的首字母
/// @param string 字符串或者汉字
+ (NSString *)getFirstCharactorWithString:(NSString *)string {
    NSMutableString *str = [NSMutableString stringWithString:string];
    CFStringTransform((CFMutableStringRef) str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pinYin = [str capitalizedString];
    if (pinYin.length == 0) {
        return @"#";
    }
    unichar c = [pinYin characterAtIndex:0];
    if (c <'A'|| c >'Z') {
        return @"#";
    }
    NSCharacterSet *notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([[pinYin substringToIndex:1] rangeOfCharacterFromSet:notDigits].location == NSNotFound){
        // 是数字
        return @"#";
    }
    if ([[pinYin substringToIndex:1] isEqual:@"_"]) {
        return @"#";
    }
    return [pinYin substringToIndex:1];
}


@end
