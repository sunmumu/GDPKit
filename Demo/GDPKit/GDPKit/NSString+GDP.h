#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (GDP)

// MARK: - Change
/// 对无效字符串进行处理(字符串所有无效格式)
/// @param string 待处理字符串string
+ (NSString *)changeToUnNullString:(id)string;

/// 十六进制的字符串 转成十进制 NSInteger
/// @param hexString 十六进制的字符串
+ (NSInteger)changeHexStringToNSInteger:(NSString *)hexString;

/// 未转成UTF8格式的json 转成NSString
/// @param dic NSDictionary
+ (NSString *)changeJsonToDictionary:(NSDictionary *)dic;

/// 清除字符串的首尾空格
/// @param string 字符串
+ (NSString *)changeToUnContainSpaceString:(NSString *)string;

/// 小数保留2位精度
/// @param string 字符串
+ (NSString *)changeToTwoDecimalString:(NSString *)string;

/// 去除小数点后无效字符
/// @param string 字符串
+ (NSString *)changeToUnContainEffective:(NSString *)string;

/// Int 转成 NSString
/// @param num num
+ (NSString *)changeIntToString:(int)num;

/// double 转成 NSString
/// @param num num
+ (NSString *)changeDoubleToNSIntger:(NSInteger)num;

/// NSInteger 转成 NSString
/// @param num num
+ (NSString *)changeDoubleToString:(double)num;

/// 时间戳 转成格式化时间yyyy-MM-dd 字符串
/// @param timeInteger 时间戳
+ (NSString *)changeTimeNSIntegerToFormattingTimeYMDString:(NSInteger)timeInteger;

/// 格式化时间 yyyy-MM-dd HH:mm:ss
/// @param timeInteger 时间戳
+ (NSString *)changeTimeNSIntegerToFormattingTimeYMDHMSString:(NSInteger)timeInteger;

/// 时间 转成 时间戳字符串
/// @param date 时间
+ (NSString *)changeDateToTimeString:(NSDate *)date;

/// 获取字典有序value数组 对传入的字典key进行ASCII排序，然后拼接key和value成字符串
/// @param dict NSDictionary
+ (NSString *)orderValueStringWithDictionary:(NSDictionary *)dict;

// MARK: - CheckIs

/// 检查是否空字符串
/// @param string id
+ (BOOL)checkIsNullString:(id)string;

/// 检查是否包含某个字符串
/// @param string 字符串
/// @param containString 包含字符串
+ (BOOL)checkIsContainString:(NSString *)string containString:(NSString *)containString;

/// 检查是否包含空格
/// @param string 字符串
+ (BOOL)checkisContainSpace:(NSString *)string;

/// 检查是否全是数字(不含小数点) 字符串
/// @param string 字符串
+ (BOOL)checkIsDigitalPlastic:(NSString*)string;

/// 检查是否邮箱格式
/// @param string 字符串
+ (BOOL)checkIsEmail:(NSString *)string;

/// 检查是否手机号码
/// @param string 字符串
+ (BOOL)checkIsPhone:(NSString *)string;

/// 检查是否符合密码格式要求 (包含数字和字母, 个数: >= minLength <= maxLength)
/// @param string 字符串
/// @param minLength 最小个数
/// @param maxLength 最大个数
+ (BOOL)checkIsPassWord:(NSString *)string minLength:(NSInteger)minLength maxLength:(NSInteger)maxLength;

/// 检查是否身份证号码 (18位)
/// @param string 字符串
+ (BOOL)checkIsID:(NSString *)string;

/// 检查是否中文
/// @param string 字符串
+ (BOOL)checkIsChinese:(NSString *)string;

// MARK: - Get 
/// 获取APP的版本号 例 1.01
+ (NSString *)getAppVersion;

/// 根据字符串计算所使用的宽高
/// @param limit 所允许的宽高
/// @param font 字体
+ (CGSize)getTextsize:(NSString *)string limit:(CGSize)limit font:(UIFont *)font;

/// 返回字符串所占用的尺寸
/// @param string 字符串
/// @param font 字体
/// @param maxSize 最大尺寸
+ (CGSize)getTextsize:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize;

/// 返回字符串所占用的尺寸
/// @param font 字体
/// @param maxWidth 最大尺寸
+ (CGSize)getTextsize:(NSString *)string systemFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;

/// 获取某个字符串或者汉字的首字母
/// @param string 字符串或者汉字
+ (NSString *)getFirstCharactorWithString:(NSString *)string;


@end
