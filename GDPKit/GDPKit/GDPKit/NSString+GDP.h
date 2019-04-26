#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/* 判定字符串是否为空 */
#define CHECK_EMPTY_NSSTRING(string) (string == nil || [string isEqualToString:@""] || [string isEqualToString:@"NO"] || [string isEqualToString:@"(null)"]) ? YES : NO

@interface NSString (GDP)

/**
 获取APP的版本号
 
 @return APP版本号 例 v1.01
 */
+ (NSString *)appVersion;

/**
 十六进制的字符串 转成十进制 NSInteger
 
 @param hexString 十六进制的字符串
 @return 十进制 NSInteger
 */
+ (NSInteger)numberWithHexString:(NSString *)hexString;

/**
 未转成UTF8格式的json 转成NSString
 
 @param dic 字段
 @return 十进制 NSInteger
 */
+ (NSString *)dictionaryToJson:(NSDictionary *)dic;

/**
 判断字符串是否全是数字整形
 */
+ (BOOL)isPureInt:(NSString*)string;

/**
 检查邮箱格式

 @param email 邮箱NSString
 @return 是否正确
 */
+ (BOOL)checkEmail:(NSString *)email;

/**
 检查手机号码是否正确

 @param mobileNumber 手机号码字符串
 @return 手机号码格式是否正确
 */
+ (BOOL)checkMobileNumber:(NSString *)mobileNumber;

/**
 清除首尾空格

 @return NSString
 */
- (NSString *)clearSpace;

/**
 根据字符串计算所使用的宽高
 
 @param limit 所允许的宽高
 @param font 字体
 @return 计算之后的宽高
 */
- (CGSize)textsizelimit:(CGSize)limit font:(UIFont *)font;

/**
 去除小数点后无效字符
 
 @param text 修改的数字
 @return 修改后的数字
 */
- (NSString *)effective:(NSString *)text;

/**
 去除小数点后无效字符

 @param text text description
 @return NSString
 */
+ (NSString *)effective:(NSString *)text;


/**
 只保留两位小数

 @param text text
 @return NSString
 */
- (NSString *)saveTwoDecimal:(NSString *)text;

/**
 Int 转成 NSString

 @param num num
 @return NSString
 */
+ (NSString *)stringToInt:(int)num;

/**
 double 转成 NSString

 @param num num
 @return NSString
 */
+ (NSString *)stringToDouble:(double)num;

/**
 NSInteger 转成 NSString

 @param num num
 @return NSString
 */
+ (NSString *)stringToNSIntger:(NSInteger)num;

/**
 格式化时间
 
 @param timestamp 时间戳
 @return 返回时间格式 yyyy-MM-dd
 */
+ (NSString *)formattingTimeYMD:(NSInteger) timestamp;

/**
 格式化时间

 @param timestamp 时间戳
 @return NSString
 */
+ (NSString *)formattingTimeYMDSHM:(NSInteger) timestamp;

/**
 判断是否为中文

 @return BOOL
 */
- (BOOL)isChinese;

/**
 *返回值是该字符串所占的大小(width, height)
 *font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *maxSize : 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (BOOL)EXcontainString:(NSString *)string;

/**
 * 判断字符串是否包含空格
 */
+ (BOOL)isBlank:(NSString *)str;

/**
 检查邮箱格式是否正确
 */
+ (BOOL)isEmail:(NSString *)emailAddress;

//获取某个字符串或者汉字的首字母.
+ (NSString *)firstCharactorWithString:(NSString *)string;

@end
