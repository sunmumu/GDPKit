//  Created by sunmumu

#import "UIViewController+GDP.h"

@interface UIViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation UIViewController (GDP)

// MARK: - Show 
/// 显示选择 护照 身份证 驾驶证 弹框 AlertController
/// @param firstBlock 点击事件回调
/// @param secondBlock 点击事件回调
/// @param thirdBlock 点击事件回调
- (void)showSelectIDTypeAlertControllerDidClickManBlock:(StringBlock)firstBlock didClickSecondBlock:(StringBlock)secondBlock didClickThirdBlock:(StringBlock)thirdBlock {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"护照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (firstBlock) {
            firstBlock(@"护照");
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"身份证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (secondBlock) {
            secondBlock(@"身份证");
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"驾驶证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (thirdBlock) {
            thirdBlock(@"驾驶证");
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}

/// 显示 性别选择弹框 AlertController
/// @param firstBlock 点击事件回调
/// @param secondBlock 点击事件回调
- (void)showSelectGenderAlertControllerDidClickManBlock:(StringBlock)firstBlock didClickSecondBlock:(StringBlock)secondBlock {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (firstBlock) {
            firstBlock(@"男");
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (secondBlock) {
            secondBlock(@"女");
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}

/// 显示 选择拍照/相册 上传图片方式弹框
/// @param isEditing 是否可编辑
- (void)showSelectCammerAndPhotoAlumAlertController:(BOOL)isEditing {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectImageFromCamera:self isEditing:isEditing];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectImageFromAlbum:self isEditing:isEditing];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}

/// 显示 相机页面
/// @param target 执行者
/// @param isEditing 是否编辑
- (void)selectImageFromCamera:(UIViewController *)target isEditing:(BOOL)isEditing{
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = isEditing;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [target presentViewController:picker animated:YES completion:nil];
    } else {
        DebugLog(@"该设备无摄像头");
    }
}

/// 显示 相册页面
/// @param target 执行者
/// @param isEditing 是否编辑
- (void)selectImageFromAlbum:(UIViewController *)target isEditing:(BOOL)isEditing{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = isEditing;
    [target presentViewController:picker animated:YES completion:nil];
}


@end
