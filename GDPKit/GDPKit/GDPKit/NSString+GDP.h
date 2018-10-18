

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

/**
 *返回值是该字符串所占的大小(width, height)
 *font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *maxSize : 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (BOOL)EXcontainString:(NSString *)string;

@end
