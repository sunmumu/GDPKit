

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
 是否为邮箱地址
 
 @return BOOL
 */
- (BOOL)isEmailAddress;

@end
