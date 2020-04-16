//
//

#import <Foundation/Foundation.h>

@interface GDPFileManager : NSObject

/// 清除缓存
+ (void)clearTheCache;

/// 遍历文件夹获得文件夹大小，返回多少M
/// @param folderPath 文件路径
+ (NSString *)folderSizeAtPath:(NSString*)folderPath;

/// 单个文件的大小
/// @param filePath 文件路径
+ (long long ) fileSizeAtPath:(NSString*)filePath;


@end
