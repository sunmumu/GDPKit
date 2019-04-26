//
//  NSDate+GDP.h
//  51jrqFramework
//
//  Created by sunmumu on 2018/12/28.
//  Copyright © 2018 xiao han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GDP)

// 日期转化为 便于阅读的日期 如: 3分钟前, 昨天, 一个月前
- (NSString *)dateToTimeString;

//获取当前日期之后的N个工作日后的日期
+ (NSString *)nextWeekdays:(NSInteger)days;

//获取当前日期之后的N天的日期
+ (NSString *)nextDays:(NSInteger)days;

//获取某个日期 是星期几
+ (NSString *)weekdayStringFromDate:(NSDate*)inputDate;
    
@end
