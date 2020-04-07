#import "NSString+GDP.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSString (GDP)

/**
 获取APP的版本号
 
 @return APP版本号 例 1.01
 */
+ (NSString *)appVersion {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = infoDic[@"CFBundleShortVersionString"];
    if (appVersion.length < 5) {
        return @"";
    }
    NSString *appVersionString = [NSString stringWithFormat:@"%@", appVersion];
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

 @param dic NSDictionary
 @return NSString
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
 检查邮箱格式
 
 @param email 邮箱NSString
 @return 是否正确
 */
+ (BOOL)checkEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/**
 检查手机号码是否正确
 
 @param mobileNumber 手机号码字符串
 @return 手机号码格式是否正确
 */
+ (BOOL)checkMobileNumber:(NSString *)mobileNumber {
    if (![mobileNumber isKindOfClass:[NSString class]]) {
        return NO;
    }
    if (CHECK_EMPTY_NSSTRING(mobileNumber)) {
        return NO;
    }
    if ([mobileNumber hasPrefix:@"86"]) {
        NSMutableString *phoneStr = [[NSMutableString alloc]initWithFormat:@"%@",mobileNumber];
        mobileNumber = [phoneStr substringFromIndex:2];
    }
    //手机号以13,14,15,16,17,18,198,199开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((19[89])|(13[0-9])|(14[0-9])|(15[^4,\\D])|(16[0-9])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobileNumber];
}

/// 检查密码格式是否正确 (8-20位, 包含字母和数字)
- (BOOL)checkPassWord {
    if (![self isKindOfClass:[NSString class]]) {
        return NO;
    }
    if (CHECK_EMPTY_NSSTRING(self)) {
        return NO;
    }
    NSString *phoneRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

/// 检查身份证号码是否正确 (18位 或15位)
- (BOOL)checkIDNumber {
    if ([self checkIDNumberForFifteen] || [self checkIDNumberForEighteen]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)checkIDNumberForEighteen {
    if (![self isKindOfClass:[NSString class]]) {
        return NO;
    }
    if (CHECK_EMPTY_NSSTRING(self)) {
        return NO;
    }
    NSString *phoneRegex = @"^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}


- (BOOL)checkIDNumberForFifteen {
    if (![self isKindOfClass:[NSString class]]) {
        return NO;
    }
    if (CHECK_EMPTY_NSSTRING(self)) {
        return NO;
    }
    NSString *phoneRegex = @"^([1-6][1-9]|50)\d{4}\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}


/**
 清除首尾空格
 
 @return NSString
 */
- (NSString *)clearSpace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/**
 根据字符串计算所使用的宽高
 
 @param limit 所允许的宽高
 @param font 字体
 @return 计算之后的宽高
 */
- (CGSize)textsizelimit:(CGSize)limit font:(UIFont *)font {
    return [self boundingRectWithSize:limit options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}


- (NSString *)saveTwoDecimal:(NSString *)text {
    if ([text componentsSeparatedByString:@"."].count>1) {
        NSArray * arr = [text componentsSeparatedByString:@"."];
        NSString *left = arr[0];
        NSString *right = arr[1];
        if (right.length>2) {
            right = [right substringWithRange:NSMakeRange(0, 2)];
        }
        return [NSString stringWithFormat:@"%@.%@", left, right];
    } else {
        return text;
    }
}

/**
 去除小数点后无效字符
 
 @param text 修改的数字
 @return 修改后的数字
 */
- (NSString *)effective:(NSString *)text {
    @try {
        text = [NSString stringToDouble:text.doubleValue];
        long len = text.length;
        for (int i = 0; i < len; i++)
        {
            if (![text  hasSuffix:@"0"])
                break;
            else
                text = [text substringToIndex:[text length]-1];
        }
        if ([text hasSuffix:@"."])//避免像2.0000这样的被解析成2.
        {
            return [text substringToIndex:[text length]-1];//s.substring(0, len - i - 1);
        }
        else
        {
            return text;
        }
    } @catch (NSException *exception) {
        return text;
    }
}

/**
 去除小数点后无效字符
 
 @param text text description
 @return NSString
 */
+ (NSString *) effective:(NSString *)text{
    if(text.length==1) return text;
    @try {
        text = [NSString stringToDouble:text.doubleValue];
        long len = text.length;
        for (int i = 0; i < len; i++)
        {
            if (![text  hasSuffix:@"0"])
                break;
            else
                text = [text substringToIndex:[text length]-1];
        }
        if ([text hasSuffix:@"."])//避免像2.0000这样的被解析成2.
        {
            return [text substringToIndex:[text length]-1];//s.substring(0, len - i - 1);
        }
        else
        {
            return text;
        }
    } @catch (NSException *exception) {
        return text;
    }
}

/**
 Int 转成 NSString
 
 @param num num
 @return NSString
 */
+ (NSString *)stringToInt:(int)num {
    return [NSString stringWithFormat:@"%d", num];
}

/**
 double 转成 NSString
 
 @param num num
 @return NSString
 */
+ (NSString *)stringToNSIntger:(NSInteger)num {
    NSString *str = @"";
    @try {
        str = [NSString stringWithFormat:@"%ld", (long)num];
    } @catch (NSException *exception) {
        str = @"0";
    } @finally {
        return str;
    }
}

/**
 NSInteger 转成 NSString
 
 @param num num
 @return NSString
 */
+ (NSString *)stringToDouble:(double)num {
    NSString *str = @"";
    @try {
        str = [NSString stringWithFormat:@"%f", num];
    } @catch (NSException *exception) {
        str = @"0.0";
    } @finally {
        return str;
    }
}

/**
 格式化时间 yyyy-MM-dd
 
 @param timestamp 时间戳
 @return 返回时间格式 yyyy-MM-dd
 */
+ (NSString *)formattingTimeYMD:(NSInteger)timestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"yyyy-MM-dd"];
    return [matter stringFromDate:date];
}

/**
 格式化时间 yyyy-MM-dd HH:mm:ss
 
 @param timestamp 时间戳
 @return NSString
 */
+ (NSString *)formattingTimeYMDSHM:(NSInteger)timestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [matter stringFromDate:date];
}

/**
 判断是否为中文
 
 @return BOOL
 */
- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

//返回字符串所占用的尺寸.
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithSystemFont:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}

- (BOOL)EXcontainString:(NSString *)string {
    NSRange range = [self rangeOfString:string];
    return range.length > 0 ? YES : NO;
}

/**
 * 判断字符串是否包含空格
 */
+ (BOOL)isBlank:(NSString *)str {
    NSRange _range = [str rangeOfString:@" "];
    if (_range.location != NSNotFound) {
        //有空格
        return YES;
    }else {
        //没有空格
        return NO;
    }
}

/**
 检查邮箱格式是否正确
 
 @param emailAddress 邮箱字符串
 @return 邮箱格式是否正确
 */
+ (BOOL)isEmail:(NSString *)emailAddress {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTest evaluateWithObject:emailAddress];
}

/**
 获取某个字符串或者汉字的首字母.

 @param string 字符串或者汉字
 @return 首字母
 */
+ (NSString *)firstCharactorWithString:(NSString *)string {
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

/**
 时间转时间戳

 @param date 日期
 @return 时间戳字符串
 */
+ (NSString *)dateConversionTimeStamp:(NSDate *)date {
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]*1000];
    return timeSp;
}

/**
 获取字典有序value数组
 对传入的字典key进行ASCII排序，然后拼接key和value成字符串
 @param dict NSDictionary
 @return NSArray
 */
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

@end
