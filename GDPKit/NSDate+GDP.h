//
//  NSDate+GDP.h
//  51jrqFramework
//
//  Created by sunmumu on 2018/12/28.
//  Copyright © 2018 xiao han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GDP)

// MARK: - Change
/// 日期 转成 星期几
/// @param date 日期
+ (NSString *)changeDateToWeekDayString:(NSDate*)date;

/// 日期 转成 便于阅读的日期 如: 3分钟前, 昨天, 一个月前
/// @param date 日期
+ (NSString *)changeDateToChatTimeString:(NSDate *)date;

// MARK: - Get 
/// 获取现在, N个工作日后的日期
/// @param day N个工作日
+ (NSString *)getWorkDayStringFromNowAfterNumberDay:(NSInteger)day;

/// 获取现在, N天之后的日期
/// @param day N天
+ (NSString *)getDayStringFromNowAfterNumberDay:(NSInteger)day;
    
@end
