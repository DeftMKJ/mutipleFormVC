//
//  MKJUploadImageCell.m
//  MKJForm
//
//  Created by MKJING on 16/9/8.
//  Copyright © 2016年 MKJING. All rights reserved.
//

#import "MKJUploadImageCell.h"
#import <MobileCoreServices/MobileCoreServices.h>

NSString *const XLFormRowDescriptorTypeUpload = @"XLFormRowDescriptorTypeUpload";

@interface MKJUploadImageCell () <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic) UIImagePickerController * imagePicker;

@end

@implementation MKJUploadImageCell


+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([MKJUploadImageCell class]) forKey:XLFormRowDescriptorTypeUpload];
}

- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(upload:)];
    [self.imageView1 addGestureRecognizer:tap];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(upload:)];
    [self.imageView2 addGestureRecognizer:tap1];
    
    self.imageView1.image = [UIImage imageNamed:@"naruto"];
    self.imageView2.image = [UIImage imageNamed:@"naruto"];
    self.imageView1.userInteractionEnabled = YES;
    self.imageView2.userInteractionEnabled = YES;
    
}

- (void)upload:(UITapGestureRecognizer *)tap
{
    UIImageView *imageView = (UIImageView *)tap.view;
    UIActionSheet *sheet = [[UIActionSheet  alloc] initWithTitle:nil
                                                        delegate:self
                                               cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:@"拍照",@"从手机相册中选取", nil];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [sheet showInView:window];
}

#pragma mark - sheet的代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        // 拍照
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            _imagePicker = [[UIImagePickerController alloc] init];
            _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear])
            {
                _imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
            }
            NSMutableArray *mediaType = [[NSMutableArray alloc] init];
            // 这个桥接是什么鬼
            [mediaType addObject:(__bridge NSString *)kUTTypeImage];
            _imagePicker.mediaTypes = mediaType;
            _imagePicker.delegate = self;
            [self.formViewController presentViewController:_imagePicker animated:YES completion:nil];
        }
        
        
    }
    else if (buttonIndex == 1)
    {
        // 相册
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        NSMutableArray *medieatype = [[NSMutableArray alloc] init];
        [medieatype addObject:(__bridge NSString *)kUTTypeImage];
        _imagePicker.mediaTypes = medieatype;
        _imagePicker.delegate = self;
        [self.formViewController presentViewController:_imagePicker animated:YES completion:nil];
    }
}

#pragma pickerController的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    // 填写表单 上传服务器
}

- (void)update
{
    [super update];
}

+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor {
    return 200;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
