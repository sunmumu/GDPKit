//
//  UIViewController+ModalPresentationStyle.m
//  HaiPai
//
//  Created by ule on 2020/6/4.
//  Copyright © 2020 solin. All rights reserved.
//

#import "UIViewController+ModalPresentationStyle.h"
#import <objc/runtime.h>

//把文件放到项目中就行, 实现ios13,present样式还是全屏

@implementation UIViewController (ModalPresentationStyle)

+ (void)load {
    if (@available(iOS 13.0, *)) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self gdp_swizzlingInstanceMethodWithClass:self.class originalSel:@selector(presentViewController:animated: completion:) swizzlingSel:@selector(gdp_presentViewController:animated: completion:)];
        });
    }
}

- (void)gdp_presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion {
    if (@available(iOS 13.0, *)) {
        if (UIModalPresentationPageSheet == viewControllerToPresent.modalPresentationStyle) {
            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
        }
    }
    [self gdp_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

#pragma mark - Method Swizzling
+ (void)gdp_swizzlingInstanceMethodWithClass:(Class)class originalSel:(SEL)originalSel swizzlingSel:(SEL)swizzlingSel {
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method swizzlingMethod = class_getInstanceMethod(class, swizzlingSel);
    BOOL didAddMethod = class_addMethod(class, originalSel, method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzlingSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzlingMethod);
    }
}

@end
