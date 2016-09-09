//
//  MKJCarPlateCell.h
//  MKJForm
//
//  Created by MKJING on 16/9/6.
//  Copyright © 2016年 MKJING. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFormBaseCell.h"

extern NSString * const XLFormRowDescriporTypeCar;

@interface MKJCarPlateCell : XLFormBaseCell

@property (weak, nonatomic) IBOutlet UIView *clickView;
@property (weak, nonatomic) IBOutlet UILabel *countryName;
@property (weak, nonatomic) IBOutlet UIImageView *downArrow;
@property (weak, nonatomic) IBOutlet UITextField *rightTextField;

@end
