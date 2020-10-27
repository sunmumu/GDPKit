//  Created by sunmumu

#import <Foundation/Foundation.h>

#if __has_include(<GDPKit/GDPKit.h>)

#import <GDPKit/NSString+GDP.h>
#import <GDPKit/NSDate+GDP.h>
#import <GDPKit/UIImage+GDP.h>
#import <GDPKit/UILabel+GDP.h>
#import <GDPKit/UIView+GDP.h>
#import <GDPKit/UITabBar+GDP.h>
#import <GDPKit/UIViewController+GDP.h>
#import <GDPKit/UIAlertController+GDP.h>
#import <GDPKit/GDPFileManager.h>
#import <GDPKit/UITextField+GDP.h>
#import <GDPKit/UITextField+NumberFormat.h>
//#import <GDPKit/UINavigationController+GDP.h>


#else

#import "NSString+GDP.h"
#import "NSDate+GDP.h"
#import "UIImage+GDP.h"
#import "UILabel+GDP.h"
#import "UIView+GDP.h"
#import "UITabBar+GDP.h"
#import "UITextField+GDP.h"
#import "UIViewController+GDP.h"
#import "UIAlertController+GDP.h"
#import "GDPFileManager.h"
#import "UITextField+NumberFormat.h"
//#import "UINavigationController+GDP.h"


//特殊说明
//UIView+ScrollToTop.h用法 :
//拖UIView+ScrollToTop.h / UIView+ScrollToTop.m文件到项目中, 不需要导入头文件.
//需要点击状态栏, 需要对应UIScrollView回滚最上面, 设置对应 scrollView.scrollsToTop = YES;


#endif
