//
//  UIView+GDP.h
//  51jrqBusinessFramework
//
//  Created by sunmumu on 2018/8/23.
//  Copyright © 2018年 xiao han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GDP)

// MARK: - 属性
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
/**
 时间戳为当前View的ID，适用于多重通知，方式通知重复执行
 */
@property (nonatomic, copy) NSString *timeId;


// MARK: - Add
/// view设置指定圆角
/// @param view 被设置圆角的view
/// @param uiRectCorner UIRectCorner
/// @param conner 圆角大小
+ (void)addCorner:(UIView *)view uiRectCorner:(UIRectCorner)uiRectCorner conner:(CGFloat)conner;

/// UIView 添加边框线
/// @param hasTopBorder 顶部边框
/// @param hasLeftBorder 左边边框
/// @param hasBottomBorder 底部边框
/// @param hasRightBorder 右边边框
/// @param borderColor 边框颜色
/// @param borderWidth 边框宽度
+ (void)addBorderLine:(UIView *)view top:(BOOL)hasTopBorder left:(BOOL)hasLeftBorder bottom:(BOOL)hasBottomBorder right:(BOOL)hasRightBorder borderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth;

/// 添加虚线
/// @param view 被添加的view
/// @param dottedWidth 每个虚线点的宽度
/// @param dottedSpacing 每个虚线之间的间距
/// @param lineColor 虚线的颜色
+ (void)addDottedLine:(UIView *)view dottedWidth:(int)dottedWidth dottedSpacing:(int)dottedSpacing lineColor:(UIColor *)lineColor;

// MARK: - Get
/// 获取view的截图 是否圆角 圆角为多大
/// @param view 被截图的view
/// @param isCornerRadius 是否圆角
/// @param cornerRadius 圆角为多大
+ (UIImage *)getViewImage:(UIView *)view isCornerRadius:(BOOL)isCornerRadius cornerRadius:(CGFloat)cornerRadius;

// MARK: - Save
/// 保存view的截图到相册
/// @param view 被截图的view
/// @param isCornerRadius 是否圆角
/// @param cornerRadius 圆角为多大
+ (void)saveViewImageToPhotoAlbum:(UIView *)view isCornerRadius:(BOOL)isCornerRadius cornerRadius:(CGFloat)cornerRadius;

@end
