//
//  NSDate+GDP.m
//  51jrqFramework
//
//  Created by sunmumu on 2018/12/28.
//  Copyright © 2018 xiao han. All rights reserved.
//

#import "NSDate+GDP.h"

@implementation NSDate (GDP)

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

@end
