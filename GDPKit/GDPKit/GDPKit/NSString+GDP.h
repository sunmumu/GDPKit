

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


@end
