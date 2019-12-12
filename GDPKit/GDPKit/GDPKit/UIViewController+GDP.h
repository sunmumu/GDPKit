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

/**
 弹出证件类型选择AlertController
 */
- (void)showSelectIDTypeAlertControllerDidClickManBlock:(StringBlock)firstBlock didClickSecondBlock:(StringBlock)secondBlock didClickThirdBlock:(StringBlock)thirdBlock;

/**
 弹出性别选择AlertController
 */
- (void)showSelectGenderAlertControllerDidClickManBlock:(StringBlock)firstBlock didClickSecondBlock:(StringBlock)secondBlock;

/**
 弹出拍照和相册页面
 */
- (void)showSelectCammerAndPhotoAlumAlertController:(BOOL)isEditing;

@end
