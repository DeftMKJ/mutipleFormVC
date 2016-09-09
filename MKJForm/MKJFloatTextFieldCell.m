//
//  MKJFloatTextFieldCell.m
//  MKJForm
//
//  Created by MKJING on 16/9/8.
//  Copyright © 2016年 MKJING. All rights reserved.
//

#import "MKJFloatTextFieldCell.h"

NSString * const XLFormRowDescriporTypeFloat = @"XLFormRowDescriporTypeFloat";

@interface MKJFloatTextFieldCell () <UITextFieldDelegate>

@end

@implementation MKJFloatTextFieldCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([MKJFloatTextFieldCell class]) forKey:XLFormRowDescriporTypeFloat];
}

- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.leftLabel.layer.borderColor = [UIColor yellowColor].CGColor;
    self.leftLabel.layer.borderWidth = 1.0f;
    self.textField.delegate = self;
    self.textField.font = [UIFont boldSystemFontOfSize:16];
    self.textField.floatingLabel.font = [UIFont boldSystemFontOfSize:11];
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.floatingLabelTextColor = [UIColor lightGrayColor];
    self.textField.floatingLabelActiveTextColor = [UIColor redColor];
    
}

- (void)update
{
    [super update];
    NSDictionary *value = self.rowDescriptor.value;
    self.leftLabel.text = [value objectForKey:@"left"];
    self.textField.text = [value objectForKey:@"right"];
    self.textField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:self.rowDescriptor.title
                                    attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.textField.floatingLabel.text = @"快点输入面积大小";
    
}

// 返回NO就不会出现底部的左右切换View
-(BOOL)formDescriptorCellCanBecomeFirstResponder
{
    return NO;
}

-(BOOL)formDescriptorCellBecomeFirstResponder
{
    return [self.textField becomeFirstResponder];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return [self.formViewController textFieldShouldClear:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [self.formViewController textFieldShouldReturn:textField];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return [self.formViewController textFieldShouldBeginEditing:textField];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return [self.formViewController textFieldShouldEndEditing:textField];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [self.formViewController textField:textField shouldChangeCharactersInRange:range replacementString:string];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.formViewController textFieldDidBeginEditing:textField];
}

-(void)setReturnKeyType:(UIReturnKeyType)returnKeyType
{
    self.textField.returnKeyType = returnKeyType;
}

-(UIReturnKeyType)returnKeyType
{
    return self.textField.returnKeyType;
}

+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor
{
    return 60;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self textFieldDidChange:textField];
    [self.formViewController textFieldDidEndEditing:textField];
}

#pragma mark - Helpers

- (void)textFieldDidChange:(UITextField *)textField
{
    NSMutableDictionary *value = [self.rowDescriptor.value mutableCopy];
    if (self.textField == textField) {
        if ([self.textField.text length] > 0) {
            
            [value setObject:self.textField.text forKey:@"right"];
            
        } else {
            
            [value setObject:@"" forKey:@"right"];
            
        }
    }
    self.rowDescriptor.value = value;
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
