//
//

#import <Foundation/Foundation.h>

@interface GDPFileManager : NSObject

/**
 清除缓存
 */
+ (void)clearTheCache;

/**
 遍历文件夹获得文件夹大小，返回多少G/M/KB/B
 */
+ (NSString *)folderSizeAtPath:(NSString*)folderPath;

/**
 单个文件的大小
 */
+ (long long )fileSizeAtPath:(NSString*)filePath;

@end
