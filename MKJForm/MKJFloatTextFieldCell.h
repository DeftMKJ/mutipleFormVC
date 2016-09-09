//
//  MKJFloatTextFieldCell.h
//  MKJForm
//
//  Created by MKJING on 16/9/8.
//  Copyright © 2016年 MKJING. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFormBaseCell.h"
#import <JVFloatLabeledTextField.h>

extern NSString *const XLFormRowDescriporTypeFloat;

@interface MKJFloatTextFieldCell : XLFormBaseCell
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *textField;


@end
