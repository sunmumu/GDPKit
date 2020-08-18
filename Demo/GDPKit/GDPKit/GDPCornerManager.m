//
//  GDPCornerManager.m
//  GDPKit
//
//  Created by ule on 2020/8/18.
//  Copyright © 2020 sunmumu. All rights reserved.
//

#import "GDPCornerManager.h"

@implementation GDPCornerManager

+ (void)setCornerOnUIRectCorner:(UIRectCorner)uiRectCorner conner:(CGFloat)conner view:(UIView *)view {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                     byRoundingCorners:uiRectCorner
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

@end
