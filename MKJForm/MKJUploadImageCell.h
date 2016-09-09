//
//  MKJUploadImageCell.h
//  MKJForm
//
//  Created by MKJING on 16/9/8.
//  Copyright © 2016年 MKJING. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFormRatingCell.h"

extern NSString *const XLFormRowDescriptorTypeUpload;

@interface MKJUploadImageCell : XLFormBaseCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@end
