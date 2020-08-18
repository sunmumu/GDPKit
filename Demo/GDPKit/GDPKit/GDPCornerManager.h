//
//  GDPCornerManager.h
//  GDPKit
//
//  Created by ule on 2020/8/18.
//  Copyright © 2020 sunmumu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GDPCornerManager : NSObject

+ (void)setCornerOnUIRectCorner:(UIRectCorner)uiRectCorner conner:(CGFloat)conner view:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
