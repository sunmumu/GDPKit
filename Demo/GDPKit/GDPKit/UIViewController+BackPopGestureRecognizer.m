//
//  UIViewController+BackPopGestureRecognizer.m
//  GDPKit
//
//  Created by ule on 2020/7/7.
//  Copyright © 2020 sunmumu. All rights reserved.
//

#import "UIViewController+BackPopGestureRecognizer.h"
#import <objc/runtime.h>

@implementation UIViewController (BackPopGestureRecognizer)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method viewDidLoadImp = class_getInstanceMethod(self, @selector(viewDidLoad));
        Method cbi_viewDidLoadImp = class_getInstanceMethod(self, @selector(cbi_viewDidLoad));
        method_exchangeImplementations(viewDidLoadImp, cbi_viewDidLoadImp);
        
        Method viewDidAppearImp = class_getInstanceMethod(self, @selector(viewDidAppear:));
        Method cbi_viewDidAppearImp = class_getInstanceMethod(self, @selector(cbi_viewDidAppear:));
        method_exchangeImplementations(viewDidAppearImp, cbi_viewDidAppearImp);
        
        Method viewWillDisappearImp = class_getInstanceMethod(self, @selector(viewWillDisappear:));
        Method cbi_viewWillDisappearImp = class_getInstanceMethod(self, @selector(cbi_viewWillDisappear:));
        method_exchangeImplementations(viewWillDisappearImp, cbi_viewWillDisappearImp);
    });
}

- (void)leftItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cbi_viewDidLoad {
    
    //不在一级界面时添加自定义按钮
    if ([self.navigationController.viewControllers count] > 1) {
        //在这里自定义返回按钮
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick)];
        self.navigationItem.leftBarButtonItem = leftItem;
        
    }
    
    [self cbi_viewDidLoad];
}

- (void)cbi_viewDidAppear:(BOOL)animated {
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        if ([self.navigationController.viewControllers count] > 1) {
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
            self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
        } else {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    }
    
    [self cbi_viewDidAppear:animated];
}

- (void)cbi_viewWillDisappear:(BOOL)animated {
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    [self cbi_viewWillDisappear:animated];
}


@end
