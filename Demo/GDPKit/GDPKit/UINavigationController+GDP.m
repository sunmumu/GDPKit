//
//  UINavigationController+GDP.m
//  HaiPai
//
//  Created by solin on 2019/8/26.
//  Copyright © 2019 solin. All rights reserved.
//

#import "UINavigationController+GDP.h"

@implementation UINavigationController (GDP)

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [[self topViewController] preferredStatusBarStyle];
}

@end
