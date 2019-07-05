//  Created by sunmumu

#import "UIViewController+GDP.h"

@interface UIViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation UIViewController (GDP)

// MARK: - AlertController
/**
 弹出头像上传选择方式
 */
- (void)showSelectCammerAndPhotoAlumAlertController {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectImageFromCamera:self];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectImageFromAlbum:self];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}

// MARK: - 弹出相机界面
- (void)selectImageFromCamera:(UIViewController *)target{
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [target presentViewController:picker animated:YES completion:nil];
    }else {
        DebugLog(@"该设备无摄像头");
    }
}

// MARK: - 弹出相册界面
- (void)selectImageFromAlbum:(UIViewController *)target{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    [target presentViewController:picker animated:YES completion:nil];
}


@end
