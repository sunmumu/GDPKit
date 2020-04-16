//
//

#import "GDPFileManager.h"

@implementation GDPFileManager

/// 清除缓存
+ (void)clearTheCache {
    dispatch_async(
       dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
       , ^{
           NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
           NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
           for (NSString *p in files)
           {
               NSError *error;
               NSString *path = [cachPath stringByAppendingPathComponent:p];
               if ([[NSFileManager defaultManager] fileExistsAtPath:path])
               {
                   [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
               }
           }
        }
    );
}

/// 遍历文件夹获得文件夹大小，返回多少M
/// @param folderPath 文件路径
+ (NSString *)folderSizeAtPath:(NSString*)folderPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath])
    {
        return 0;
    }
    else
    {
        NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
        NSString *fileName = nil;
        long long folderSize = 0;
        while ((fileName = [childFilesEnumerator nextObject]) != nil)
        {
            NSString *fileAbsolutePath = [NSString stringWithFormat:@"%@",[folderPath stringByAppendingPathComponent:fileName]];
            folderSize += [GDPFileManager fileSizeAtPath:fileAbsolutePath];
        }
        if (folderSize >= 1024.0*1024.0*1024.0)
        {
            return [NSString stringWithFormat:@"%.2f G",folderSize/(1024.0*1024.0*1024.0)];
        }
        else if (folderSize >= 1024.0*1024.0)
        {
            return [NSString stringWithFormat:@"%.2f M",folderSize/(1024.0*1024.0)];
        }
        else if (folderSize >= 1024.0)
        {
            return [NSString stringWithFormat:@"%.2f KB",folderSize/(1024.0)];
        }
        else
        {
            return [NSString stringWithFormat:@"%.2f B",folderSize/(1024.0*1024.0)];
        }
        return @"0.00B";
    }
}

/// 单个文件的大小
/// @param filePath 文件路径
+ (long long ) fileSizeAtPath:(NSString*)filePath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath])
    {
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:[manager attributesOfItemAtPath:filePath error:nil]];
        return dic.fileSize;
    }
    return 0;
}


@end
