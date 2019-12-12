//
//  GDPConstant.h
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef GDPConstant_h
#define GDPConstant_h

#define SHARED_APP_KEY_WINDOW_ROOT_VIEW ([UIApplication sharedApplication].keyWindow.rootViewController.view)

// MARK: - Utils
#define WEAK_SELF                                       __weak typeof(self) weakSelf = self;
#define STRONG_SELF                                     __strong typeof(self) strongSelf = weakSelf;

// MARK: - UIDevice
#define IOS_VERSION                                     [[[UIDevice currentDevice] systemVersion] floatValue]

/* 设备类型和方向 */
#define UI_USER_INTERFACE_IDIOM()                       ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] ? [[UIDevice currentDevice] userInterfaceIdiom] : UIUserInterfaceIdiomPhone)

#define UIDeviceOrientationIsPortrait(orientation)      ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown)
#define UIDeviceOrientationIsLandscape(orientation)     ((orientation) == UIDeviceOrientationLandscapeLeft || (orientation) == UIDeviceOrientationLandscapeRight)

// MARK: - CGSize
#define SCREEN_WIDTH                                    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT                                   [[UIScreen mainScreen] bounds].size.height
#define GDPHEIGHT(view)                                 view.frame.size.height
#define GDPWIDTH(view)                                  view.frame.size.width
#define HEIGHT(view)                                    view.frame.size.height
#define WIDTH(view)                                     view.frame.size.width

#pragma mark  设备屏幕
#define Is_iPhoneX         [UIScreen mainScreen].bounds.size.height == 812

#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)
#define IS_IPHONE_X         [UIScreen mainScreen].bounds.size.height == 812
#define IS_IPHONE_XR         [UIScreen mainScreen].bounds.size.height == 896
#define IS_IPHONE_XMAX         [UIScreen mainScreen].bounds.size.height == 896

// MARK: - UIColor
#define RGB(r, g, b)                                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#define RGBCOLOR(r,g,b)                                 [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define HEXCOLOR(rgbValue)                              [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RandomColor                                     RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// MARK: - UiView
#define IMAGE(name)                                     [UIImage imageNamed:name]

#pragma mark 16进制 -> 色值
#define UIColorWithCode(_code_) UIColorWithCodeAlpha(_code_,1)

#define UIColorWithCodeAlpha(_code_, _al_)  \
[UIColor colorWithRed:((float)((_code_ & 0xFF0000) >> 16))/255.0 \
green:((float)((_code_ & 0x00FF00) >> 8))/255.0 \
blue:((float)(_code_ & 0x0000FF))/255.0 \
alpha:_al_]

// MARK: - NSString
#define IsEmpty(string)                                    (string == nil || [string isEqualToString:@""] || [string isEqualToString:@"(null)"] || [string isEqualToString:@"null"]|| [string isEqualToString:@"NO"])
//NSString 为 nil/@"" 容错处理
#define NONEMPTY_NSSTRING(string)                               IsEmpty(string) ? @"" : string

// MARK: - Check
//判断是 空/NO/(null)/nil 字符串
#define CHECK_EMPTY_NSSTRING(string)                            (string == nil || [string isEqualToString:@""] || [string isEqualToString:@"NO"] || [string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"]) ? YES : NO
//判断是 非空 字符串
#define CHECK_NOT_EMPTY_NSSTRING(string)                          (![string isEqualToString:@""] && string != nil && ![string isEqualToString:@"(null)"] && ![string isEqualToString:@"NO"] && ![string isEqualToString:@"<null>"]) ? YES : NO
//判断是 非空 字典
#define CHECK_NOT_EMPTY_NSDICTIONARY(dictionary)                          ([dictionary isKindOfClass:[NSDictionary class]] && dictionary != nil && dictionary.allKeys.count != 0 && dictionary.allValues.count != 0)? YES:NO
//判断是 非空 数组
#define CHECK_NOT_EMPTY_NSARRAY(array)                          ([array isKindOfClass:[NSArray class]] && array != nil && array.count != 0) ? YES : NO

// 判断是 NSString类型
#define CHECK_CLASS_NSSTRING(string)                        [[string class] isSubclassOfClass:[NSString class]] ? YES : NO
//判断是
// 1NSString类型, 且为 nil/ @""
// 2非NSString类型
#define CHECK_NOT_NSSTRING_OR_EMPTY_NSSTRING(string)                          (CHECK_CLASS_NSSTRING(string) == YES) ? ((string == nil || [string isEqualToString:@""]) ? ((string = @""), YES) :NO) : YES
//判断是 NSString类型, 且不为nil/@""
#define CHECK_NOT_EMPTY_NSSTRING(string)                          (CHECK_NOT_NSSTRING_OR_EMPTY_NSSTRING(string) == YES) ? NO : YES


// MARK: - Dispatch
#define MAIN_THREAD(block) dispatch_async(dispatch_get_main_queue(), block)
#define BACKGROUD_THREAD(block) dispatch_async(dispatch_get_global_queue(0, 0), block)

#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#define SINGLETON(__class) + (instancetype)sharedManager { \
static __class *singleton; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
singleton = [[__class alloc] init]; \
}); \
return singleton; \
}

// MARK: - Block
typedef void (^VoidBlock)(void);

typedef void (^ErrorBlock)(NSError *error);
typedef void (^ErrorMsgBlock)(NSError *error, NSString *errorMsg);

typedef void (^NotificationBlock)(NSNotification *notification);

typedef void (^BoolBlock)(BOOL result);
typedef void (^BoolMsgBlock)(BOOL result, NSString *errorMsg);

typedef void (^ArrayBlock)(NSArray *resultList);
typedef void (^ArrayMsgBlock)(NSArray *resultList, NSString *errorMsg);

typedef void (^DictionaryBlock)(NSDictionary *resultDict);
typedef void (^DictionaryMsgBlock)(NSDictionary *resultDict, NSString *errorMsg);

typedef void (^NumberBlock)(NSNumber *resultNumber);
typedef void (^NumberMsgBlock)(NSNumber *resultNumber, NSString *errorMsg);

typedef void (^IntegerBlock)(NSInteger resultNumber);
typedef void (^IntegerMsgBlock)(NSInteger resultNumber, NSString *errorMsg);

typedef void (^StringBlock)(NSString *result);
typedef void (^StringMsgBlock)(NSString *result, NSString *errorMsg);

typedef void (^ImageBlock)(UIImage *image);

typedef void (^ObjectBlock)(id sender);
typedef void (^ObjectMsgBlock)(id result, NSString *errorMsg);

// MARK: - LOG打印
// 调试状态
#ifdef DEBUG
// 打开LOG功能
#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
// 发布状态
// 关闭LOG功能
#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#endif

#endif /* GDPConstant_h */
