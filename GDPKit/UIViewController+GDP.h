//  Created by sunmumu

#import <UIKit/UIKit.h>

typedef void (^VoidBlock)(void);
typedef void (^StringBlock)(NSString *result);

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

@interface UIViewController (GDP)

// MARK: - Show 

/// 显示选择 护照 身份证 驾驶证 弹框 AlertController
/// @param firstBlock 点击事件回调
/// @param secondBlock 点击事件回调
/// @param thirdBlock 点击事件回调
- (void)showSelectIDTypeAlertControllerDidClickManBlock:(StringBlock)firstBlock didClickSecondBlock:(StringBlock)secondBlock didClickThirdBlock:(StringBlock)thirdBlock;

/// 显示 性别选择弹框 AlertController
/// @param firstBlock 点击事件回调
/// @param secondBlock 点击事件回调
- (void)showSelectGenderAlertControllerDidClickManBlock:(StringBlock)firstBlock didClickSecondBlock:(StringBlock)secondBlock;

/// 显示 选择拍照/相册 上传图片方式弹框
/// @param isEditing 是否可编辑
- (void)showSelectCammerAndPhotoAlumAlertController:(BOOL)isEditing;


@end
