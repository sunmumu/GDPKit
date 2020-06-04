//
//  UIViewController+ModalPresentationStyle.m
//  HaiPai
//
//  Created by ule on 2020/6/4.
//  Copyright © 2020 solin. All rights reserved.
//

#import "UIViewController+ModalPresentationStyle.h"
#import <objc/runtime.h>

//基类UIViewController 引用该category,实现ios13,present样式还是全屏

@implementation UIViewController (ModalPresentationStyle)

+ (void)load {
    [super load];
    SEL exchangeSel = @selector(gdp_presentViewController:animated: completion:);
    SEL originalSel = @selector(presentViewController:animated: completion:);
    method_exchangeImplementations(class_getInstanceMethod(self.class, originalSel), class_getInstanceMethod(self.class, exchangeSel));
    
}

// MARK: - Swizzled
- (void)gdp_presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion {
    if (@available(iOS 13.0, *)) {
        if (UIModalPresentationPageSheet == viewControllerToPresent.modalPresentationStyle) {
            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
        }
    }
    [self gdp_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
