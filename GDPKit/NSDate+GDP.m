//
//  NSDate+GDP.m
//  51jrqFramework
//
//  Created by sunmumu on 2018/12/28.
//  Copyright © 2018 xiao han. All rights reserved.
//

#import "NSDate+GDP.h"

@implementation NSDate (GDP)

// MARK: - Change 修改
/// 日期 转成 星期几
/// @param date 日期
+ (NSString *)changeDateToWeekDayString:(NSDate*)date {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

/// 日期 转成 便于阅读的日期 如: 3分钟前, 昨天, 一个月前
/// @param date 日期
+ (NSString *)changeDateToChatTimeString:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 1. 判断日期是否是今天
    if ([calendar isDateInToday:date]) {
        NSInteger delta = -(NSInteger)date.timeIntervalSinceNow;
        if (delta < 60) {
            return @"刚刚";
        }
        if (delta < 3600) {
            return [NSString stringWithFormat:@"%ld分钟前", (delta / 60)];
        }
        return [NSString stringWithFormat:@"%ld小时前", (delta / 3600)];
    }
    
    // 2. 其他天
    NSString *formatterString = @" HH:mm";
    
    if ([calendar isDateInYesterday:date]) {
        formatterString = [@"昨天" stringByAppendingString:formatterString];
    } else {
        formatterString = [@"MM-dd" stringByAppendingString:formatterString];
        
        NSInteger year = [calendar component:NSCalendarUnitYear fromDate:date];
        NSInteger thisYear = [calendar component:NSCalendarUnitYear fromDate:[[NSDate alloc] init]];
        
        if (year != thisYear) {
            formatterString = [@"yyyy-" stringByAppendingString:formatterString];
        }
    }
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:formatterString];
    
    NSString *timeString = [dataFormatter stringFromDate:date];
    
    return timeString;
}


// MARK: - Get 获取
/// 获取现在, N个工作日后的日期
/// @param day N个工作日
+ (NSString *)getWorkDayStringFromNowAfterNumberDay:(NSInteger)day {
    if (day <= 0) {
        return @"无有效日期";
    }
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitWeekday;
    NSDate *today = [NSDate date];
    comps = [calendar components:unitFlags fromDate:today];
    NSInteger weekday = [comps weekday];
    NSInteger m = (day/5) * 7;
    
    NSInteger remainder = day % 5;
    switch (weekday) {
        case 1:
            m = ((day- 1) / 5) * 7 + remainder;//周天
            break;
        case 2:case 3:case 5:case 6:case 7:
        {
            m += remainder + ((remainder + weekday - 2)/ 5) * 2;
            
        }
        default:
            break;
    }
    return [NSDate getDayStringFromNowAfterNumberDay:m];
}

/// 获取现在, N天之后的日期
/// @param day N天
+ (NSString *)getDayStringFromNowAfterNumberDay:(NSInteger)day {
    if (day <= 0) {
        return @"无有效日期";
    }
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [[NSDateComponents alloc] init];
    [component setDay:day];
    NSDate *date = [calendar dateByAddingComponents:component toDate:[NSDate date] options:0];
    NSString *weekdayString = [NSDate changeDateToWeekDayString:date];
    
    NSString *formatterString = @"yyyy-MM-dd";
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:formatterString];
    NSString *timeString = [dataFormatter stringFromDate:date];
    NSString *dateString = [NSString stringWithFormat:@"%@ %@",timeString, weekdayString];
    
    return dateString;
}

@end
