//  Created by sunmumu

#import "UIViewController+GDP.h"

@interface UIViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation UIViewController (GDP)

// MARK: - AlertController
/**
 弹出证件类型选择AlertController
 */
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

/**
 弹出性别选择AlertController
 */
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


/**
 弹出头像上传选择方式
 */
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

/**
 弹出相机界面

 @param target 执行者
 */
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


/**
 弹出相册界面

 @param target 执行者
 */
- (void)selectImageFromAlbum:(UIViewController *)target isEditing:(BOOL)isEditing{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = isEditing;
    [target presentViewController:picker animated:YES completion:nil];
}


@end
