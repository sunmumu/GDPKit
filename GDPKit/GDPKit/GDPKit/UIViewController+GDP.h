//  Created by sunmumu

#import <UIKit/UIKit.h>

typedef void (^VoidBlock)(void);
typedef void (^StringBlock)(NSString *result);

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
