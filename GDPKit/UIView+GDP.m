//
//  UIView+GDP.m
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/23.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import "UIView+GDP.h"
#import <objc/runtime.h>

@implementation UIView (GDP)

// MARK: - 属性
- (void)setTimeId:(NSString *)timeId{
    objc_setAssociatedObject(self, @selector(timeId), timeId, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)timeId{
    return objc_getAssociatedObject(self, @selector(timeId));
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect newFrame = self.frame;
    newFrame.origin = origin;
    self.frame      = newFrame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect newFrame = self.frame;
    newFrame.size   = size;
    self.frame      = newFrame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = x;
    self.frame        = newFrame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = y;
    self.frame        = newFrame;
}

- (CGFloat)width {
    return CGRectGetWidth(self.bounds);
}

- (void)setWidth:(CGFloat)width {
    CGRect newFrame     = self.frame;
    newFrame.size.width = width;
    self.frame          = newFrame;
}

- (CGFloat)height {
    return CGRectGetHeight(self.bounds);
}

- (void)setHeight:(CGFloat)height {
    CGRect newFrame      = self.frame;
    newFrame.size.height = height;
    self.frame           = newFrame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = top;
    self.frame        = newFrame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = bottom - self.frame.size.height;
    self.frame        = newFrame;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = left;
    self.frame        = newFrame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = right - self.frame.size.width;
    self.frame        = newFrame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint newCenter = self.center;
    newCenter.x       = centerX;
    self.center       = newCenter;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint newCenter = self.center;
    newCenter.y       = centerY;
    self.center       = newCenter;
}

- (CGPoint)BottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)BottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)TopRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}
- (CGPoint)TopLeft
{
    CGFloat x = self.frame.origin.x ;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

- (CGFloat)middleX {
    return CGRectGetWidth(self.bounds) / 2.f;
}

- (CGFloat)middleY {
    return CGRectGetHeight(self.bounds) / 2.f;
}

- (CGPoint)middlePoint {
    return CGPointMake(CGRectGetWidth(self.bounds) / 2.f, CGRectGetHeight(self.bounds) / 2.f);
}

// MARK: - Add

/// view设置指定圆角
/// @param view 被设置圆角的view
/// @param uiRectCorner UIRectCorner
/// @param conner 圆角大小
+ (void)addCorner:(UIView *)view uiRectCorner:(UIRectCorner)uiRectCorner conner:(CGFloat)conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                     byRoundingCorners:uiRectCorner
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

/// UIView 添加边框线
/// @param hasTopBorder 顶部边框
/// @param hasLeftBorder 左边边框
/// @param hasBottomBorder 底部边框
/// @param hasRightBorder 右边边框
/// @param borderColor 边框颜色
/// @param borderWidth 边框宽度
+ (void)addBorderLine:(UIView *)view top:(BOOL)hasTopBorder left:(BOOL)hasLeftBorder bottom:(BOOL)hasBottomBorder right:(BOOL)hasRightBorder borderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth {
    
    float height = view.frame.size.height;
    float width = view.frame.size.width;
    CALayer *topBorder = [CALayer layer];
    topBorder.frame = CGRectMake(0, 0, width, borderWidth);
    topBorder.backgroundColor = borderColor.CGColor;
    CALayer *leftBorder = [CALayer layer];
    leftBorder.frame = CGRectMake(0, 0, 1, height);
    leftBorder.backgroundColor = borderColor.CGColor;
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0, height, width, borderWidth);
    bottomBorder.backgroundColor = borderColor.CGColor;
    CALayer *rightBorder = [CALayer layer];
    rightBorder.frame = CGRectMake(width, 0, borderWidth, height);
    rightBorder.backgroundColor = borderColor.CGColor;
    
    if (hasTopBorder) {
        [view.layer addSublayer:topBorder];
    }
    if (hasLeftBorder) {
        [view.layer addSublayer:leftBorder];
    }
    if (hasBottomBorder) {
        [view.layer addSublayer:bottomBorder];
    }
    if (hasRightBorder) {
        [view.layer addSublayer:rightBorder];
    }
}

/// 添加虚线
/// @param view 被添加的view
/// @param dottedWidth 每个虚线点的宽度
/// @param dottedSpacing 每个虚线之间的间距
/// @param lineColor 虚线的颜色
+ (void)addDottedLine:(UIView *)view dottedWidth:(int)dottedWidth dottedSpacing:(int)dottedSpacing lineColor:(UIColor *)lineColor {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:view.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(view.frame) / 2, CGRectGetHeight(view.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];

    //  设置虚线颜色lineColor
    [shapeLayer setStrokeColor:lineColor.CGColor];

    //  设置整个虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(view.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];

    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:dottedWidth], [NSNumber numberWithInt:dottedSpacing], nil]];

    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(view.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);

    //  把绘制好的虚线添加上来
    [view.layer addSublayer:shapeLayer];
}

// MARK: - Get
/// 获取view的截图 是否圆角 圆角为多大
/// @param view 被截图的view
/// @param isCornerRadius 是否圆角
/// @param cornerRadius 圆角为多大
+ (UIImage *)getViewImage:(UIView *)view isCornerRadius:(BOOL)isCornerRadius cornerRadius:(CGFloat)cornerRadius {
    view.layer.masksToBounds = YES;
    if (isCornerRadius) {
        view.layer.cornerRadius = cornerRadius;
    } else {
        view.layer.cornerRadius = 0;
    }
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    view.layer.cornerRadius = cornerRadius;
    
    return image;
}

// MARK: - Save
/// 保存view的截图到相册
/// @param view 被截图的view
/// @param isCornerRadius 是否圆角
/// @param cornerRadius 圆角为多大
+ (void)saveViewImageToPhotoAlbum:(UIView *)view isCornerRadius:(BOOL)isCornerRadius cornerRadius:(CGFloat)cornerRadius {
    view.layer.masksToBounds = YES;
    if (isCornerRadius) {
        view.layer.cornerRadius = cornerRadius;
    } else {
        view.layer.cornerRadius = 0;
    }
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, view, nil, nil);
    
    view.layer.cornerRadius = cornerRadius;
}

@end
