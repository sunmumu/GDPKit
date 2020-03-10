//
//  NSDate+GDP.m
//  51jrqFramework
//
//  Created by sunmumu on 2018/12/28.
//  Copyright © 2018 xiao han. All rights reserved.
//

#import "NSDate+GDP.h"

@implementation NSDate (GDP)

// 日期转化为 便于阅读的日期 如: 3分钟前, 昨天, 一个月前
- (NSString *)dateToTimeString {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 1. 判断日期是否是今天
    if ([calendar isDateInToday:self]) {
        NSInteger delta = -(NSInteger)self.timeIntervalSinceNow;
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
    
    if ([calendar isDateInYesterday:self]) {
        formatterString = [@"昨天" stringByAppendingString:formatterString];
    } else {
        formatterString = [@"MM-dd" stringByAppendingString:formatterString];
        
        NSInteger year = [calendar component:NSCalendarUnitYear fromDate:self];
        NSInteger thisYear = [calendar component:NSCalendarUnitYear fromDate:[[NSDate alloc] init]];
        
        if (year != thisYear) {
            formatterString = [@"yyyy-" stringByAppendingString:formatterString];
        }
        
    }
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:formatterString];
    
    NSString *timeString = [dataFormatter stringFromDate:self];
    
    return timeString;
}

//获取当前日期之后的N个工作日后的日期
+ (NSString *)nextWeekdays:(NSInteger)days {
    if (days <= 0) {
        return @"无有效日期";
    }
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitWeekday;
    NSDate *today = [NSDate date];
    comps = [calendar components:unitFlags fromDate:today];
    NSInteger weekday = [comps weekday];
    NSInteger m = (days/5) * 7;
    
    NSInteger remainder = days % 5;
    switch (weekday) {
        case 1:
            m = ((days- 1) / 5) * 7 + remainder;//周天
            break;
        case 2:case 3:case 5:case 6:case 7:
        {
            m += remainder + ((remainder + weekday - 2)/ 5) * 2;
            
        }
        default:
            break;
    }
    return [today nextDay:m];
}

//获取当前日期之后的N天的日期
+ (NSString *)nextDays:(NSInteger)days {
    if (days <= 0) {
        return @"无有效日期";
    }
    NSDate *today = [NSDate date];

    return [today nextDay:days];
}

//获取当前日期之后N天的日期
- (NSString *)nextDay:(NSInteger)day{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [[NSDateComponents alloc] init];
    [component setDay:day];
    NSDate *date = [calendar dateByAddingComponents:component toDate:self options:0];
    NSString *weekdayString = [NSDate weekdayStringFromDate:date];
    
    NSString *formatterString = @"yyyy-MM-dd";
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:formatterString];
    NSString *timeString = [dataFormatter stringFromDate:date];
    NSString *dateString = [NSString stringWithFormat:@"%@ %@",timeString, weekdayString];
    
    return dateString;
}


//获取某个日期 是星期几
+ (NSString *)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

@end
